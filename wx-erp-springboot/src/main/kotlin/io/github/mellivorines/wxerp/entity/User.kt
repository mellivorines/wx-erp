package io.github.mellivorines.wxerp.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 *  用户表
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@Entity
@Table(name = "wx_user")
interface User : BaseEntity {

    /**
     *  用户ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long

    /**
     *  用户名 */
    val name: String

    /**
     *  密码 */
    val password: String

    /**
     *  邮箱 */
    val email: String

    /**
     *  手机号 */
    val mobile: String

    /**
     *  状态：1-正常，0-禁用 */
    val status: Int
}
