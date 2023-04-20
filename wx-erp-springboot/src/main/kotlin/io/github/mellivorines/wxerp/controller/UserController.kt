package io.github.mellivorines.wxerp.controller

import io.github.mellivorines.wxerp.controller.base.BaseController
import io.github.mellivorines.wxerp.entity.User
import io.github.mellivorines.wxerp.model.BaseResponse
import io.github.mellivorines.wxerp.repository.UserRepository
import org.springframework.web.bind.annotation.*

/**
 * <p>
 *  UserController
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@RestController
@RequestMapping(value = ["/user"])
class UserController(var userRepository: UserRepository) : BaseController() {


    /**
     * 查询所有账户
     * @return [BaseResponse] 返回操作信息
     */
    @GetMapping(value = ["/list"])
    fun getUser(): BaseResponse {
        return process(userRepository.findAll())
    }

    /**
     * 添加用户信息
     * @param [user] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PostMapping(value = ["/add"])
    fun saveUser(@RequestBody user: User): BaseResponse {
        return process(userRepository.save(user))
    }

    /**
     * 更新用户信息
     * @param [user] 用户信息
     * @return [BaseResponse] 返回操作信息
     */
    @PutMapping(value = ["/update"])
    fun updateUser(@RequestBody user: User): BaseResponse {
        return process(userRepository.update(user))
    }

    /**
     * 批量删除用户
     * @param [ids] id
     * @return [BaseResponse] 返回操作信息
     */
    @DeleteMapping(value = ["/deleteUserByIds"])
    fun deleteUserByIds(@RequestBody ids: List<Long>): BaseResponse {
        return process(userRepository.deleteByIds(ids))
    }
}
