package io.github.mellivorines.wxerp.repository

import io.github.mellivorines.wxerp.entity.Category
import io.github.mellivorines.wxerp.entity.Menu
import org.babyfish.jimmer.spring.repository.KRepository
import org.springframework.stereotype.Repository

/**
 * <p>
 * CategoryRepository 接口
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@Repository
interface MenuRepository : KRepository<Menu, Long> {

}

