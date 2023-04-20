package io.github.mellivorines.wxerp.common

enum class ResultCode(private val code: Int, private val desc: String) {
    SUCCESS(200, "成功"),
    ERROR(-1, "系统错误"),
    DATA_IS_NULL(-2, "数据为空");

    fun desc(): String {
        return desc
    }

    fun code(): Int {
        return this.code
    }
}
