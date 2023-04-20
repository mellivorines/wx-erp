package io.github.mellivorines.wxerp.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 *  部门表
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@Entity
@Table(name = "wx_department")
interface Department : BaseEntity {

    /**
     *  部门ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long

    /**
     *  部门名称 */
    val name: String

    /**
     *  父级部门ID */
    @Column(name = "parent_id")
    val parentId: Int
}
