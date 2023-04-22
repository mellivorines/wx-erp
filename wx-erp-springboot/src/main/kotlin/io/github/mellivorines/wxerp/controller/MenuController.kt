package io.github.mellivorines.wxerp.controller

import io.github.mellivorines.wxerp.model.BaseResponse
import io.github.mellivorines.wxerp.repository.MenuRepository
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

/**
 * <p>
 *  CategoryController
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@RestController
@RequestMapping(value = ["/menu"])
class MenuController(var menuRepository: MenuRepository) {

    /**
     * 查询所有[category]
     * @return [BaseResponse] 返回操作信息
     */
    @GetMapping(value = ["/list"])
    fun getUser(): BaseResponse {
        var list = menuRepository.findAll()
        return BaseResponse(200, list, "成功！")
    }

}