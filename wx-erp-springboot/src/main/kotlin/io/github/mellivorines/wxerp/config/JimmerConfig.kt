package io.github.mellivorines.wxerp.config

import io.github.mellivorines.wxerp.entity.BaseEntity
import io.github.mellivorines.wxerp.entity.BaseEntityDraft
import io.github.mellivorines.wxerp.entity.ENTITY_MANAGER
import org.babyfish.jimmer.kt.isLoaded
import org.babyfish.jimmer.sql.DraftInterceptor
import org.babyfish.jimmer.sql.runtime.EntityManager
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.stereotype.Component
import java.time.LocalDateTime
/**
 * <p>
 *  jimmer相关配置
 * </p>
 *
 * @author lilinxi
 * @date 2023-04-11
 */
@Configuration
class JimmerConfig {

    @Bean
    fun entityManager(): EntityManager = ENTITY_MANAGER
}

@Component
class BaseEntityDraftInterceptor : DraftInterceptor<BaseEntityDraft> {

    override fun beforeSave(draft: BaseEntityDraft, isNew: Boolean) {
        if (!isLoaded(draft, BaseEntity::updateTime)) {
            draft.updateTime = LocalDateTime.now()
        }
        if (isNew && !isLoaded(draft, BaseEntity::createTime)) {
            draft.createTime = LocalDateTime.now()
        }
    }
}


