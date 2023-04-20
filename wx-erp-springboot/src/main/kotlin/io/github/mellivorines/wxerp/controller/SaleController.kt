package io.github.mellivorines.wxerp.controller

import io.github.mellivorines.wxerp.entity.Sale
import io.github.mellivorines.wxerp.model.BaseResponse
import io.github.mellivorines.wxerp.repository.SaleRepository
import org.springframework.web.bind.annotation.*

/**
 * <p>
 *  SaleController
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@RestController
@RequestMapping(value = ["/sale"])
class SaleController(var saleRepository: SaleRepository) {

    /**
     * 查询所有[sale]
     * @return [BaseResponse] 返回操作信息
     */
    @GetMapping(value = ["/list"])
    fun getUser(): BaseResponse {
        var list = saleRepository.findAll()
        return BaseResponse(200, list, "成功！")
    }

    /**
     * 添加[sale]信息
     * @param [sale] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PostMapping(value = ["/add"])
    fun saveUser(@RequestBody sale: Sale): BaseResponse {
        var save = saleRepository.save(sale)
        return BaseResponse(200, save, "成功！")
    }

    /**
     * 更新[sale]信息
     * @param [sale] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PutMapping(value = ["/update"])
    fun updateUser(@RequestBody sale: Sale): BaseResponse {
        var save = saleRepository.update(sale)
        return BaseResponse(200, save, "成功！")
    }


    /**
     * 批量删除[sale]
     * @param [ids] id
     * @return [BaseResponse] 返回操作信息
     */
    @DeleteMapping(value = ["/deleteUserByIds"])
    fun deleteUserByIds(@RequestBody ids: List<Long>): BaseResponse {
        var save = saleRepository.deleteAllById(ids)
        return BaseResponse(200, save, "成功！")
    }
}