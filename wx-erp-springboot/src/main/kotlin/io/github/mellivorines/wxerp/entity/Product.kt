package io.github.mellivorines.wxerp.entity

import org.babyfish.jimmer.sql.*
import java.math.BigDecimal


/**
 * <p>
 *  商品信息表
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@Entity
@Table(name = "wx_product")
interface Product : BaseEntity {

    /**
     *  商品ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long

    /**
     *  商品名称 */
    val name: String

    /**
     *  所属分类ID */
    @Column(name = "category_id")
    val categoryId: Int

    /**
     *  价格 */
    val price: BigDecimal

    /**
     *  库存 */
    val stock: Int
}
