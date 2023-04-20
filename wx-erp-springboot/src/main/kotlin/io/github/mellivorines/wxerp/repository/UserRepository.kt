package io.github.mellivorines.wxerp.repository

import io.github.mellivorines.wxerp.entity.User
import org.babyfish.jimmer.spring.repository.KRepository
import org.springframework.stereotype.Repository

/**
 * <p>
 * UserRepository 接口
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@Repository
interface UserRepository : KRepository<User, Long> {
    fun findByNameAndPassword(username: String, password: String): User
}

