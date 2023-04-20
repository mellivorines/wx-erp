package io.github.mellivorines.wxerp.entity

import org.babyfish.jimmer.sql.*
import java.math.BigDecimal


/**
 * <p>
 *  采购单表
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@Entity
@Table(name = "wx_purchase")
interface Purchase : BaseEntity {

    /**
     *  采购单ID */
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
     *  供应商 */
    val supplier: String

    /**
     *  采购数量 */
    val quantity: Int

    /**
     *  采购金额 */
    val amount: BigDecimal

    /**
     *  状态：0-草稿，1-待审核，2-已审核，-1-审核不通过 */
    val status: Int
}
