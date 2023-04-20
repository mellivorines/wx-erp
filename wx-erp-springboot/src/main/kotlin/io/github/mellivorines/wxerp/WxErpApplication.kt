package io.github.mellivorines.wxerp

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

/**
 * <p>
 *  程序启动类
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@SpringBootApplication
class WxErpApplication

fun main(args: Array<String>) {
    runApplication<WxErpApplication>(*args)
}
