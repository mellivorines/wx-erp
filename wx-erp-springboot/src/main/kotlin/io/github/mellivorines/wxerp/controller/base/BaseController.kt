package io.github.mellivorines.wxerp.controller.base

import io.github.mellivorines.wxerp.common.ResultCode
import io.github.mellivorines.wxerp.model.BaseResponse
import org.springframework.util.ObjectUtils

/**
 * <p>
 *  BaseController：基础Controller
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
open class BaseController {

    fun process(data: Any?): BaseResponse {
        val result = BaseResponse()
        if (!ObjectUtils.isEmpty(data)) result.data = data else result.msg = ResultCode.DATA_IS_NULL.desc()
        return result
    }
}
