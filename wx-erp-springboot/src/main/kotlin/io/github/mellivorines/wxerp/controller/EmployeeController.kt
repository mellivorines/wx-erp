package io.github.mellivorines.wxerp.controller

import io.github.mellivorines.wxerp.entity.Employee
import io.github.mellivorines.wxerp.model.BaseResponse
import io.github.mellivorines.wxerp.repository.EmployeeRepository
import org.springframework.web.bind.annotation.*

/**
 * <p>
 *  EmployeeController
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@RestController
@RequestMapping(value = ["/employee"])
class EmployeeController(var employeeRepository: EmployeeRepository) {

    /**
     * 查询所有[employee]
     * @return [BaseResponse] 返回操作信息
     */
    @GetMapping(value = ["/list"])
    fun getUser(): BaseResponse {
        var list = employeeRepository.findAll()
        return BaseResponse(200, list, "成功！")
    }

    /**
     * 添加[employee]信息
     * @param [employee] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PostMapping(value = ["/add"])
    fun saveUser(@RequestBody employee: Employee): BaseResponse {
        var save = employeeRepository.save(employee)
        return BaseResponse(200, save, "成功！")
    }

    /**
     * 更新[employee]信息
     * @param [employee] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PutMapping(value = ["/update"])
    fun updateUser(@RequestBody employee: Employee): BaseResponse {
        var save = employeeRepository.update(employee)
        return BaseResponse(200, save, "成功！")
    }


    /**
     * 批量删除[employee]
     * @param [ids] id
     * @return [BaseResponse] 返回操作信息
     */
    @DeleteMapping(value = ["/deleteUserByIds"])
    fun deleteUserByIds(@RequestBody ids: List<Long>): BaseResponse {
        var save = employeeRepository.deleteAllById(ids)
        return BaseResponse(200, save, "成功！")
    }
}