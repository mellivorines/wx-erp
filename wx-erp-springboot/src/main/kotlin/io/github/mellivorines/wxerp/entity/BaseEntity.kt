package io.github.mellivorines.wxerp.entity

import org.babyfish.jimmer.sql.Column
import org.babyfish.jimmer.sql.MappedSuperclass
import java.time.LocalDateTime


/**
 * <p>
 *  基类
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@MappedSuperclass
interface BaseEntity {
    /**
     *  创建时间 */
    @Column(name = "create_time")
    val createTime: LocalDateTime

    /**
     *  更新时间 */
    @Column(name = "update_time")
    val updateTime: LocalDateTime
}