package io.github.mellivorines.wxerp.repository

import io.github.mellivorines.wxerp.entity.Stock
import org.babyfish.jimmer.spring.repository.KRepository
import org.springframework.stereotype.Repository

/**
 * <p>
 * StockRepository 接口
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@Repository
interface StockRepository : KRepository<Stock, Long> {

}

