package io.github.mellivorines.wxerp.config

import com.oasis.tga.utils.JwtUtils
import io.github.mellivorines.wxerp.annotation.Auth
import io.github.mellivorines.wxerp.repository.UserRepository
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.springframework.context.annotation.Configuration
import org.springframework.core.MethodParameter
import org.springframework.http.HttpStatus
import org.springframework.util.ObjectUtils
import org.springframework.web.bind.support.WebDataBinderFactory
import org.springframework.web.context.request.NativeWebRequest
import org.springframework.web.method.support.HandlerMethodArgumentResolver
import org.springframework.web.method.support.ModelAndViewContainer
import org.springframework.web.servlet.HandlerInterceptor
import org.springframework.web.servlet.config.annotation.InterceptorRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer

@Configuration
class WebMvcConfig(var userRepository: UserRepository) : WebMvcConfigurer {

    override fun addInterceptors(registry: InterceptorRegistry) {
        // 注册Token拦截器
        registry.addInterceptor(TokenInterceptor()).addPathPatterns("/**")
    }

    override fun addArgumentResolvers(resolvers: MutableList<HandlerMethodArgumentResolver>) {
        // 注册参数解析器
        resolvers.add(AuthHandlerMethodArgumentResolver())
    }

}

class TokenInterceptor : HandlerInterceptor {
    override fun preHandle(request: HttpServletRequest, response: HttpServletResponse, handler: Any): Boolean {
        // 获取请求头里的Token
        val token = request.getHeader("x-access-token")
        val loginUrl = request.requestURL
        return if (loginUrl.contains("/login")) {
            true
        } else if (!ObjectUtils.isEmpty(token)) {// 校验Token是否合法
            // Token合法，放行
            JwtUtils.verifyToken(token)
            true
        } else {
            // Token不合法，返回401错误
            response.status = HttpStatus.UNAUTHORIZED.value()
            false
        }
    }

}

class AuthHandlerMethodArgumentResolver : HandlerMethodArgumentResolver {

    override fun supportsParameter(parameter: MethodParameter): Boolean {
        // 判断参数是否带有@Auth注解
        return parameter.hasParameterAnnotation(Auth::class.java)
    }

    override fun resolveArgument(
        parameter: MethodParameter,
        mavContainer: ModelAndViewContainer?,
        webRequest: NativeWebRequest,
        binderFactory: WebDataBinderFactory?
    ): Any? {
        // 获取请求头里的Token
        val token = webRequest.getHeader("Authorization")?.replace("Bearer ", "")
        // 如果Token合法，则返回Token对应的User对象；否则返回null
        return if (token != null && isValidToken(token)) {
            getUserByToken(token)
        } else {
            null
        }
    }

    private fun getUserByToken(token: String):Any? {
        // 根据Token获取用户信息的逻辑
        return JwtUtils.verifyToken(token)
    }

    private fun isValidToken(token: String): Boolean {
        // 校验Token的逻辑
        JwtUtils.verifyToken(token)
        return true
    }
}
