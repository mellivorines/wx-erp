package io.github.mellivorines.wxerp.controller

import io.github.mellivorines.wxerp.entity.Department
import io.github.mellivorines.wxerp.model.BaseResponse
import io.github.mellivorines.wxerp.repository.DepartmentRepository
import org.springframework.web.bind.annotation.*

/**
 * <p>
 *  DepartmentController
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@RestController
@RequestMapping(value = ["/department"])
class DepartmentController(var departmentRepository: DepartmentRepository) {

    /**
     * 查询所有[department]
     * @return [BaseResponse] 返回操作信息
     */
    @GetMapping(value = ["/list"])
    fun getUser(): BaseResponse {
        var list = departmentRepository.findAll()
        return BaseResponse(200, list, "成功！")
    }

    /**
     * 添加[department]信息
     * @param [department] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PostMapping(value = ["/add"])
    fun saveUser(@RequestBody department: Department): BaseResponse {
        var save = departmentRepository.save(department)
        return BaseResponse(200, save, "成功！")
    }

    /**
     * 更新[department]信息
     * @param [department] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PutMapping(value = ["/update"])
    fun updateUser(@RequestBody department: Department): BaseResponse {
        var save = departmentRepository.update(department)
        return BaseResponse(200, save, "成功！")
    }


    /**
     * 批量删除[department]
     * @param [ids] id
     * @return [BaseResponse] 返回操作信息
     */
    @DeleteMapping(value = ["/deleteUserByIds"])
    fun deleteUserByIds(@RequestBody ids: List<Long>): BaseResponse {
        var save = departmentRepository.deleteAllById(ids)
        return BaseResponse(200, save, "成功！")
    }
}