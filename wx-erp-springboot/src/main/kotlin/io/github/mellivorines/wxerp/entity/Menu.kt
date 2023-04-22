package io.github.mellivorines.wxerp.entity

import org.babyfish.jimmer.sql.*


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/4/22
 */
@Entity
@Table(name = "wx_menu")
interface Menu {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long

    val path: String

    @Key
    val name: String

    val component: String?

    @OneToOne
    val myMeta: Meta

    val redirect: String?

    @Key
    @ManyToOne
    @OnDissociate(DissociateAction.DELETE)
    val parent: Menu?

    @OneToMany(mappedBy = "parent", orderedProps = [OrderedProp("name")])
    val childNodes: List<Menu>?
}
