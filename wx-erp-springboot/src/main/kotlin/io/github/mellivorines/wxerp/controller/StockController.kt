package io.github.mellivorines.wxerp.controller

import io.github.mellivorines.wxerp.entity.Stock
import io.github.mellivorines.wxerp.model.BaseResponse
import io.github.mellivorines.wxerp.repository.StockRepository
import org.springframework.web.bind.annotation.*

/**
 * <p>
 *  StockController
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@RestController
@RequestMapping(value = ["/stock"])
class StockController(var stockRepository: StockRepository) {

    /**
     * 查询所有[stock]
     * @return [BaseResponse] 返回操作信息
     */
    @GetMapping(value = ["/list"])
    fun getUser(): BaseResponse {
        var list = stockRepository.findAll()
        return BaseResponse(200, list, "成功！")
    }

    /**
     * 添加[stock]信息
     * @param [stock] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PostMapping(value = ["/add"])
    fun saveUser(@RequestBody stock: Stock): BaseResponse {
        var save = stockRepository.save(stock)
        return BaseResponse(200, save, "成功！")
    }

    /**
     * 更新[stock]信息
     * @param [stock] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PutMapping(value = ["/update"])
    fun updateUser(@RequestBody stock: Stock): BaseResponse {
        var save = stockRepository.update(stock)
        return BaseResponse(200, save, "成功！")
    }


    /**
     * 批量删除[stock]
     * @param [ids] id
     * @return [BaseResponse] 返回操作信息
     */
    @DeleteMapping(value = ["/deleteUserByIds"])
    fun deleteUserByIds(@RequestBody ids: List<Long>): BaseResponse {
        var save = stockRepository.deleteAllById(ids)
        return BaseResponse(200, save, "成功！")
    }
}