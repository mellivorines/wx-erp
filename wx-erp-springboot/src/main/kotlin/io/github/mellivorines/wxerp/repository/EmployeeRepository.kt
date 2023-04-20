package io.github.mellivorines.wxerp.repository

import io.github.mellivorines.wxerp.entity.Employee
import org.babyfish.jimmer.spring.repository.KRepository
import org.springframework.stereotype.Repository

/**
 * <p>
 * EmployeeRepository 接口
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@Repository
interface EmployeeRepository : KRepository<Employee, Long> {

}

