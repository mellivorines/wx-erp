package io.github.mellivorines.wxerp.entity

import org.babyfish.jimmer.sql.Column
import org.babyfish.jimmer.sql.Entity
import org.babyfish.jimmer.sql.Id
import org.babyfish.jimmer.sql.Table


/**
 * <p>
 *  库存表
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@Entity
@Table(name = "wx_stock")
interface Stock : BaseEntity {

    /**
     *  商品ID */
    @Id
    @Column(name = "product_id")
    val productId: Int

    /**
     *  库存数量 */
    val quantity: Int
}
