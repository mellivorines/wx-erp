import type {ProxyOptions} from "vite";
import AutoImport from "unplugin-auto-import/vite"
import {ConfigEnv, defineConfig, loadEnv, PluginOption, UserConfig} from "vite";
import {visualizer} from "rollup-plugin-visualizer";
import {createHtmlPlugin} from "vite-plugin-html";
import {createSvgIconsPlugin} from "vite-plugin-svg-icons";
import vue from "@vitejs/plugin-vue";
import vueJsx from "@vitejs/plugin-vue-jsx";
import viteCompression from "vite-plugin-compression";
import vueSetupExtend from "unplugin-vue-setup-extend-plus/vite";
import path, {resolve} from "path";
// @ts-ignore
import pkg from "./package.json";
import dayjs from "dayjs";


type ProxyItem = [string, string];

type ProxyList = ProxyItem[];

type ProxyTargetList = Record<string, ProxyOptions>;


// 创建代理，用于解析 .env.development 代理配置
function createProxy(list: ProxyList = []) {
  const ret: ProxyTargetList = {};
  for (const [prefix, target] of list) {
    const httpsRE = /^https:\/\//;
    const isHttps = httpsRE.test(target);

    // https://github.com/http-party/node-http-proxy#options
    ret[prefix] = {
      target: target,
      changeOrigin: true,
      ws: true,
      rewrite: path => path.replace(new RegExp(`^${prefix}`), ""),
      // https is require secure=false
      ...(isHttps ? {secure: false} : {})
    };
  }
  return ret;
}

//根据 compress 配置，生成不同的压缩规则
const createCompression = (viteEnv: ViteEnv): PluginOption | PluginOption[] => {
  const {VITE_BUILD_COMPRESS = "none", VITE_BUILD_COMPRESS_DELETE_ORIGIN_FILE} = viteEnv;
  const compressList = VITE_BUILD_COMPRESS.split(",");
  const plugins: PluginOption[] = [];

  if (compressList.includes("gzip")) {
    plugins.push(
      viteCompression({
        ext: ".gz",
        algorithm: "gzip",
        deleteOriginFile: VITE_BUILD_COMPRESS_DELETE_ORIGIN_FILE
      })
    );
  }
  if (compressList.includes("brotli")) {
    plugins.push(
      viteCompression({
        ext: ".br",
        algorithm: "brotliCompress",
        deleteOriginFile: VITE_BUILD_COMPRESS_DELETE_ORIGIN_FILE
      })
    );
  }

  return plugins;
};

//autoImport 插件
const autoImport = AutoImport({
  imports: ['vue', 'vue-router','pinia','vue-i18n'],
  dts: './src/auto-import.d.ts'
})

//创建 vite 插件
const createVitePlugins = (viteEnv: ViteEnv): (PluginOption | PluginOption[])[] => {
  return [
    vue(),
    autoImport,
    // vue 可以使用 jsx/tsx 语法
    vueJsx(),
    // esLint 报错信息显示在浏览器界面上
    // eslintPlugin(),
    // name 可以写在 script 标签上
    vueSetupExtend({}),
    // 创建打包压缩配置
    createCompression(viteEnv),
    // 注入变量到 html 文件
    createHtmlPlugin({
      inject: {
        data: {title: viteEnv.VITE_GLOB_APP_TITLE}
      }
    }),
    // 使用 svg 图标
    createSvgIconsPlugin({
      iconDirs: [resolve(process.cwd(), "src/assets/icons")],
      symbolId: "icon-[dir]-[name]"
    }),
    // 是否生成包预览，分析依赖包大小做优化处理
    viteEnv.VITE_REPORT && (visualizer({filename: "stats.html", gzipSize: true, brotliSize: true}) as PluginOption)
  ];
};


const {dependencies, devDependencies, name, version} = pkg;
const __APP_INFO__ = {
  pkg: {dependencies, devDependencies, name, version},
  lastBuildTime: dayjs().format("YYYY-MM-DD HH:mm:ss")
};

// @see: https://vitejs.dev/config/
export default defineConfig(({mode}: ConfigEnv): UserConfig => {
  const root = process.cwd();
  const env = loadEnv(mode, root);
  const viteEnv = wrapperEnv(env);

  return {
    base: viteEnv.VITE_PUBLIC_PATH,
    root,
    resolve: {
      alias: {
        "@": resolve(__dirname, "./src"),
        "vue-i18n": "vue-i18n/dist/vue-i18n.cjs.js"
      }
    },
    define: {
      __APP_INFO__: JSON.stringify(__APP_INFO__)
    },
    css: {
      preprocessorOptions: {
        scss: {
          additionalData: `@import "@/styles/var.scss";`
        }
      }
    },
    server: {
      host: "0.0.0.0",
      port: viteEnv.VITE_PORT,
      open: viteEnv.VITE_OPEN,
      cors: true,
      // Load proxy configuration from .env.development
      proxy: createProxy(viteEnv.VITE_PROXY)
    },
    plugins: createVitePlugins(viteEnv),
    esbuild: {
      pure: viteEnv.VITE_DROP_CONSOLE ? ["console.log", "debugger"] : []
    },
    build: {
      outDir: "dist",
      minify: "esbuild",
      // esbuild 打包更快，但是不能去除 console.log，terser打包慢，但能去除 console.log
      // minify: "terser",
      // terserOptions: {
      // 	compress: {
      // 		drop_console: viteEnv.VITE_DROP_CONSOLE,
      // 		drop_debugger: true
      // 	}
      // },
      // 禁用 gzip 压缩大小报告，可略微减少打包时间
      reportCompressedSize: false,
      // 规定触发警告的 chunk 大小
      chunkSizeWarningLimit: 2000,
      rollupOptions: {
        output: {
          // Static resource classification and packaging
          chunkFileNames: "assets/js/[name]-[hash].js",
          entryFileNames: "assets/js/[name]-[hash].js",
          assetFileNames: "assets/[ext]/[name]-[hash].[ext]"
        }
      }
    }
  };
});


function isDevFn(mode: string): boolean {
  return mode === "development";
}

function isProdFn(mode: string): boolean {
  return mode === "production";
}

function isTestFn(mode: string): boolean {
  return mode === "test";
}


/**
 * Whether to generate package preview
 */
function isReportMode(): boolean {
  return process.env.VITE_REPORT === "true";
}

// Read all environment variable configuration files to process.env
// @ts-ignore
function wrapperEnv(envConf: Recordable): ViteEnv {
  const ret: any = {};

  for (const envName of Object.keys(envConf)) {
    let realName = envConf[envName].replace(/\\n/g, "\n");
    realName = realName === "true" ? true : realName === "false" ? false : realName;
    if (envName === "VITE_PORT") realName = Number(realName);
    if (envName === "VITE_PROXY") {
      try {
        realName = JSON.parse(realName);
      } catch (error) {
      }
    }
    ret[envName] = realName;
  }
  return ret;
}

/**
 * Get user root directory
 * @param dir file path
 */
function getRootPath(...dir: string[]) {
  return path.resolve(process.cwd(), ...dir);
}


