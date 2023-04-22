package io.github.mellivorines.wxerp.entity

import org.babyfish.jimmer.sql.GeneratedValue
import org.babyfish.jimmer.sql.GenerationType
import org.babyfish.jimmer.sql.Id
import org.babyfish.jimmer.sql.Table


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/4/22
 */
@Table(name = "wx_meta")
interface Meta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long

    val icon: String

    val title: String

    val enableLink: String

    val enableHide: Boolean

    val enableFull: Boolean

    val enableAffix: Boolean

    val enableKeepAlive: Boolean

    val activeMenu: String?
}