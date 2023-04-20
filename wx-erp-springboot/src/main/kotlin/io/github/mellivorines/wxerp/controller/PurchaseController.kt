package io.github.mellivorines.wxerp.controller

import io.github.mellivorines.wxerp.entity.Purchase
import io.github.mellivorines.wxerp.model.BaseResponse
import io.github.mellivorines.wxerp.repository.PurchaseRepository
import org.springframework.web.bind.annotation.*

/**
 * <p>
 *  PurchaseController
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@RestController
@RequestMapping(value = ["/purchase"])
class PurchaseController(var purchaseRepository: PurchaseRepository) {

    /**
     * 查询所有[purchase]
     * @return [BaseResponse] 返回操作信息
     */
    @GetMapping(value = ["/list"])
    fun getUser(): BaseResponse {
        var list = purchaseRepository.findAll()
        return BaseResponse(200, list, "成功！")
    }

    /**
     * 添加[purchase]信息
     * @param [purchase] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PostMapping(value = ["/add"])
    fun saveUser(@RequestBody purchase: Purchase): BaseResponse {
        var save = purchaseRepository.save(purchase)
        return BaseResponse(200, save, "成功！")
    }

    /**
     * 更新[purchase]信息
     * @param [purchase] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PutMapping(value = ["/update"])
    fun updateUser(@RequestBody purchase: Purchase): BaseResponse {
        var save = purchaseRepository.update(purchase)
        return BaseResponse(200, save, "成功！")
    }


    /**
     * 批量删除[purchase]
     * @param [ids] id
     * @return [BaseResponse] 返回操作信息
     */
    @DeleteMapping(value = ["/deleteUserByIds"])
    fun deleteUserByIds(@RequestBody ids: List<Long>): BaseResponse {
        var save = purchaseRepository.deleteAllById(ids)
        return BaseResponse(200, save, "成功！")
    }
}