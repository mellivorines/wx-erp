package io.github.mellivorines.wxerp.controller

import io.github.mellivorines.wxerp.entity.Product
import io.github.mellivorines.wxerp.model.BaseResponse
import io.github.mellivorines.wxerp.repository.ProductRepository
import org.springframework.web.bind.annotation.*

/**
 * <p>
 *  ProductController
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@RestController
@RequestMapping(value = ["/product"])
class ProductController(var productRepository: ProductRepository) {

    /**
     * 查询所有[product]
     * @return [BaseResponse] 返回操作信息
     */
    @GetMapping(value = ["/list"])
    fun getUser(): BaseResponse {
        var list = productRepository.findAll()
        return BaseResponse(200, list, "成功！")
    }

    /**
     * 添加[product]信息
     * @param [product] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PostMapping(value = ["/add"])
    fun saveUser(@RequestBody product: Product): BaseResponse {
        var save = productRepository.save(product)
        return BaseResponse(200, save, "成功！")
    }

    /**
     * 更新[product]信息
     * @param [product] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PutMapping(value = ["/update"])
    fun updateUser(@RequestBody product: Product): BaseResponse {
        var save = productRepository.update(product)
        return BaseResponse(200, save, "成功！")
    }


    /**
     * 批量删除[product]
     * @param [ids] id
     * @return [BaseResponse] 返回操作信息
     */
    @DeleteMapping(value = ["/deleteUserByIds"])
    fun deleteUserByIds(@RequestBody ids: List<Long>): BaseResponse {
        var save = productRepository.deleteAllById(ids)
        return BaseResponse(200, save, "成功！")
    }
}