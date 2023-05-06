package io.github.mellivorines.wxerp.config

import io.github.mellivorines.wxerp.entity.BaseEntity
import io.github.mellivorines.wxerp.entity.BaseEntityDraft
import org.babyfish.jimmer.kt.isLoaded
import org.babyfish.jimmer.sql.DraftInterceptor
import org.springframework.stereotype.Component
import java.time.LocalDateTime


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/5/6
 */
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
