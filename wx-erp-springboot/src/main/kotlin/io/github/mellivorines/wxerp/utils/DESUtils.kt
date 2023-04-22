package io.github.mellivorines.wxerp.utils

import java.nio.charset.Charset
import java.security.Key
import java.util.*
import javax.crypto.Cipher
import javax.crypto.SecretKeyFactory
import javax.crypto.spec.DESKeySpec
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/4/21
 */
object DESUtils {
    private val key = "12345678"   // 密钥（8字节）
    private var iv = "87654321"    // 初始向量（8字节）

    fun desDecrypt(ciphertext: String) = decryptData(ciphertext, key,iv)


    /**
     * ciphertext: String：密文字符串。
     * key: String：密钥字符串。
     * iv: String：初始向量（iv）字符串。
     */
    fun decryptData(encryptedData: String, key: String, iv: String): String {
        val cipher = Cipher.getInstance("DES/CBC/PKCS5Padding")
        val secretKey = SecretKeySpec(key.toByteArray(), "DES")
        val ivParams = IvParameterSpec(iv.toByteArray())
        cipher.init(Cipher.DECRYPT_MODE, secretKey, ivParams)
        val decryptedData = cipher.doFinal(encryptedData.toByteArray())
        return decryptedData.toString(Charsets.UTF_8)
    }


}