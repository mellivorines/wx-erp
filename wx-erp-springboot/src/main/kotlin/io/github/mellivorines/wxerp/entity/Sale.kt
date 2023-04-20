package io.github.mellivorines.wxerp.entity

import org.babyfish.jimmer.sql.*
import java.math.BigDecimal


/**
 * <p>
 *  销售单表
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@Entity
@Table(name = "wx_sale")
interface Sale : BaseEntity {

    /**
     *  销售单ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long

    /**
     *  员工ID */
    @Column(name = "employee_id")
    val employeeId: Int

    /**
     *  商品ID */
    @Column(name = "product_id")
    val productId: Int

    /**
     *  客户名称 */
    val customer: String

    /**
     *  销售数量 */
    val quantity: Int

    /**
     *  销售金额 */
    val amount: BigDecimal

    /**
     *  状态：0-草稿，1-待审核，2-已审核，-1-审核不通过 */
    val status: Int

}
