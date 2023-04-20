package io.github.mellivorines.wxerp.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 *  员工信息表
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@Entity
@Table(name = "wx_employee")
interface Employee : BaseEntity {

    /**
     *  员工ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long

    /**
     *  员工姓名 */
    val name: String

    /**
     *  性别：0-未知，1-男，2-女 */
    val gender: Int

    /**
     *  年龄 */
    val age: Int

    /**
     *  手机号 */
    val mobile: String

    /**
     *  邮箱 */
    val email: String

    /**
     *  地址 */
    val address: String

    /**
     *  所属部门ID */
    @Column(name = "department_id")
    val departmentId: Int
}
