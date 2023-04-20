package io.github.mellivorines.wxerp.controller

import io.github.mellivorines.wxerp.entity.Category
import io.github.mellivorines.wxerp.model.BaseResponse
import io.github.mellivorines.wxerp.repository.CategoryRepository
import org.springframework.web.bind.annotation.*

/**
 * <p>
 *  CategoryController
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@RestController
@RequestMapping(value = ["/category"])
class CategoryController(var categoryRepository: CategoryRepository) {

    /**
     * 查询所有[category]
     * @return [BaseResponse] 返回操作信息
     */
    @GetMapping(value = ["/list"])
    fun getUser(): BaseResponse {
        var list = categoryRepository.findAll()
        return BaseResponse(200, list, "成功！")
    }

    /**
     * 添加[category]信息
     * @param [category] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PostMapping(value = ["/add"])
    fun saveUser(@RequestBody category: Category): BaseResponse {
        var save = categoryRepository.save(category)
        return BaseResponse(200, save, "成功！")
    }

    /**
     * 更新[category]信息
     * @param [category] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PutMapping(value = ["/update"])
    fun updateUser(@RequestBody category: Category): BaseResponse {
        var save = categoryRepository.update(category)
        return BaseResponse(200, save, "成功！")
    }


    /**
     * 批量删除[category]
     * @param [ids] id
     * @return [BaseResponse] 返回操作信息
     */
    @DeleteMapping(value = ["/deleteUserByIds"])
    fun deleteUserByIds(@RequestBody ids: List<Long>): BaseResponse {
        var save = categoryRepository.deleteAllById(ids)
        return BaseResponse(200, save, "成功！")
    }
}