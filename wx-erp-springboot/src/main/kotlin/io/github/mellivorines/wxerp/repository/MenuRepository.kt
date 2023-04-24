package io.github.mellivorines.wxerp.repository

import io.github.mellivorines.wxerp.entity.Menu
import org.babyfish.jimmer.spring.repository.KRepository
import org.springframework.stereotype.Repository

/**
 * <p>
 * MenuRepository 接口
 * </p>
 *
 * @author mellivorines
 * @date 2023-04-24
 */
@Repository
interface MenuRepository : KRepository<Menu, Long> {

}

