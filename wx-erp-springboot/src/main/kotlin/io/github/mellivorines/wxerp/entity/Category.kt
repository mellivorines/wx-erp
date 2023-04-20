package io.github.mellivorines.wxerp.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 *  商品分类表
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@Entity
@Table(name = "wx_category")
interface Category : BaseEntity {

    /**
     *  分类ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long

    /**
     *  分类名称 */
    val name: String

    /**
     *  父级分类ID */
    @Column(name = "parent_id")
    val parentId: Int
}
