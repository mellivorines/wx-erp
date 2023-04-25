package io.github.mellivorines.wxerp.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 *  元数据表
 * </p>
 *
 * @author mellivorines
 * @date 2023-04-24
 */
@Entity
@Table(name = "wx_meta")
interface Meta {

    /**
     *  员工ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long

    /**
     *  图标 */
    val icon: String?

    /**
     *  标题 */
    val title: String?

    /**
     *  链接 */
    @Column(name = "enable_link")
    val enableLink: String?

    /**
     *  是否隐藏 */
    @Column(name = "enable_hide")
    val enableHide: String?

    /**
     *  是否填充 */
    @Column(name = "enable_full")
    val enableFull: String?

    /**
     *  enable_affix
     */
    @Column(name = "enable_affix")
    val enableAffix: String?

    /**
     *  是否激活 */
    @Column(name = "enable_keep_alive")
    val enableKeepAlive: String?

    /**
     *  激活菜单 */
    @Column(name = "active_menu")
    val activeMenu: String?

    @LogicalDeleted(value = "1", restoredValue = "0")
    val deleted: Int
}
