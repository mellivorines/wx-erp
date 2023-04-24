package io.github.mellivorines.wxerp.utils

import com.auth0.jwt.JWT
import com.auth0.jwt.JWTVerifier
import com.auth0.jwt.algorithms.Algorithm
import com.auth0.jwt.interfaces.DecodedJWT
import io.github.mellivorines.wxerp.entity.User
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import java.util.*


object JwtUtils {
    private val logger: Logger = LoggerFactory.getLogger(JwtUtils::class.java)

    /**
     * 密钥
     */
    private const val SECRET = "my_secret"

    /**
     * 过期时间
     */
    private const val EXPIRATION = 1800L //单位为秒

    /**
     * 生成用户token,设置token超时时间
     */
    fun createToken(user: User): String? {
        //过期时间
        val expireDate = Date(System.currentTimeMillis() + EXPIRATION * 1000)
        val map: MutableMap<String, Any> = HashMap()
        map["alg"] = "HS256"
        map["typ"] = "JWT"
        return JWT.create()
            .withHeader(map) // 添加头部
            //可以将基本信息放到claims中
            .withClaim("id", user.id) //userId
            .withClaim("userName", user.name) //userName
            .withClaim("password", user.password) //password
            .withExpiresAt(expireDate) //超时设置,设置过期的日期
            .withIssuedAt(Date()) //签发时间
            .sign(Algorithm.HMAC256(SECRET))
    }

    /**
     * 校验token并解析token
     */
    fun verifyToken(token: String?): Any? {
        var jwt: DecodedJWT? = try {
            val verifier: JWTVerifier = JWT.require(Algorithm.HMAC256(SECRET)).build()
            verifier.verify(token)
            //decodedJWT.getClaim("属性").asString()  获取负载中的属性值
        } catch (e: Exception) {
            logger.error(e.message)
            logger.error("token解码异常")
            //解码异常则抛出异常
            return null
        }
        logger.info("jwt:{}", jwt!!.getClaims())
        return jwt.claims
    }


}
