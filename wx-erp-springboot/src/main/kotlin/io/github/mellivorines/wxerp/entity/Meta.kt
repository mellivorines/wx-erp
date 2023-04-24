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
     *  允许链接 */
    val enableLink: String?

    /**
     *  允许隐藏 */
    val enableHide: String?

    /**
     *  允许填充 */
    val enableFull: String?

    /**
     *  enableAffix
     */
    val enableAffix: String?

    /**
     *  允许保持 */
    val enableKeepAlive: String?

    /**
     *  激活菜单 */
    val activeMenu: String?
}
