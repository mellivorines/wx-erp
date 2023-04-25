package io.github.mellivorines.wxerp.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 *  菜单表
 * </p>
 *
 * @author mellivorines
 * @date 2023-04-24
 */
@Entity
@Table(name = "wx_menu")
interface Menu {

    /**
     *  员工ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long

    /**
     *  路径 */
    val path: String?

    /**
     *  名称 */
    val name: String?

    /**
     *  组件 */
    val component: String?

    /**
     *  重定向 */
    val redirect: String?


    @OneToOne
    @JoinColumn(name = "meta_id")
    val meta:Meta?

    @Key
    @ManyToOne
    @OnDissociate(DissociateAction.DELETE)
    val parent: Menu?

    @OneToMany(mappedBy = "parent", orderedProps = [OrderedProp("name")])
    val childes: List<Menu>
}
