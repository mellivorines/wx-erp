package io.github.mellivorines.wxerp.model

/**
 * <p>
 *  BaseResponse：响应体基础模型
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
data class BaseResponse(var code: Int = 200, var data: Any? = null, var msg: String = "成功！")
