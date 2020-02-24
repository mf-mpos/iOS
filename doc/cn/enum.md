# enum 枚举定义

#### MFEU_MSR_RESP
> 操作结果返回
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_RESP_SUCC | 0x00 | 成功 |
| MF_RESP_FAIL | 0x01 | 失败 |

#### MFEU_MPOS_RESP
> MPOS操作结果返回
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_MPOS_RESP_CANCEL | 0x00 | 用户取消 |
| MF_MPOS_RESP_MAGTEK | 0x01 | 磁条卡交易 |
| MF_MPOS_RESP_ICC | 0x02 | IC卡交易 |
| MF_MPOS_RESP_RFID | 0x03 | 非接交易 |
| MF_MPOS_RESP_FORCE_IC | 0x04 | 强制IC卡 |
| MF_MPOS_RESP_TIMEOVER | 0x05 | 刷卡超时 |
| MF_MPOS_RESP_CARD_FAIL | 0x06 | 读卡失败 |

#### MFEU_CARD_TYPE
> 读卡类型返回
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_CARD_MAG | 0x01 | 磁条卡 |
| MF_CARD_ICC | 0x02 | IC卡 |
| MF_CARD_RF | 0x03 | 非接卡 |

#### MFEU_MSR_REAUTH_RESP
> 二次授权结果返回
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_RESP_REAUTH_UNKNOWN | 0x00 | 未知错误 |
| MF_RESP_REAUTH_ACCEPT | 0x01 | 交易授受 |
| MF_RESP_REAUTH_GACAAC | 0x02 | 交易拒绝 |
| MF_RESP_REAUTH_ONLINE | 0x03 | 联机 |
| MF_RESP_REAUTH_REJECT | 0x04 | 二次授权交易拒绝 |
| MF_RESP_REAUTH_FAIL | 0xFF | 交易失败 |

#### MFEU_MSR_DEVSTAT
> 设备密钥下载状态
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_DEVSTAT_DEFAULT | 0xFF | 默认初始状态 |
| MF_DEVSTAT_WKEYIN | 0x00 | 工作密钥已灌装 |
| MF_DEVSTAT_MKEYIN | 0x01 | 主密钥已灌装 |
| MF_DEVSTAT_KEKMOD | 0x02 | KEK已修改 |

#### MFEU_MSR_KEYTYPE
> 密码输入按键返回
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_KEYTYPE_OK | 0x00 | 确认键 |
| MF_KEYTYPE_TIMEOUT | 0x02 | 取消键 |
| MF_KEYTYPE_CANCEL | 0x06 | 取消键 |

#### MFEU_MSR_INFO
> MPOS交易提示
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_INFO_CUSTOM | 0x00 | 按照自定义内容提示 |
| MF_INFO_WAITCARD | 0x01 | 等待刷卡 |
| MF_INFO_READCARD | 0x02 | 正在读卡 |
| MF_INFO_WAITPIN | 0x03 | 等待用户输入密码 |


#### MFEU_KEY_LENGTH
> 密钥长度
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_LEN_SINGLE | 0x01 | 单倍长 |
| MF_LEN_DOUBLE | 0x02 | 双倍长 |
| MF_LEN_DOUBLEMAG | 0x03 | 双倍长带磁道加密 |

#### MFEU_ENCRYPT_METHOD
> 加密方式
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_ENCRYPT_KEK | 0x00 | KEK加密 |
| MF_ENCRYPT_MAINKEY | 0x01 | 原主钥加密 |
| MF_ENCRYPT_PLAINTEXT | 0x02 | 明文 |

#### MFEU_KEY_INDEX
> 密钥索引号
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_KEY_IND_0 | 0x00 | 索引0 |
| MF_KEY_IND_1 | 0x01 | 索引1 |
| MF_KEY_IND_2 | 0x02 | 索引2 |
| MF_KEY_IND_3 | 0x03 | 索引3 |
| MF_KEY_IND_4 | 0x04 | 索引4 |
| MF_KEY_IND_5 | 0x05 | 索引5 |
| MF_KEY_IND_6 | 0x06 | 索引6 |
| MF_KEY_IND_7 | 0x07 | 索引7 |

#### MFEU_WKEY_TYPE
> 工作密钥类型
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_WKEY_PIN | 0x01 | PIN密钥 |
| MF_WKEY_MAC | 0x02 | MAC密钥 |
| MF_WKEY_TRACK | 0x03 | 磁道密钥 |
} ;

#### MFEU_MAC_ALG
> MAC算法
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_MACALG_UBC | 0x00 | UBC算法 |
| MF_MACALG_X99 | 0x01 | X99/X919 |
| MF_MACALG_EBC | 0x02 | EBC算法 |
| MF_MACALG_ENCRYPT_UPAY | 0x0A | UNIONPAY |
| MF_MACALG_ENCRYPT_X99 | 0x0B | UNIONPAY X99 |
| MF_MACALG_ENCRYPT_X919 | 0x0C | UNIONPAY X919 |
| MF_MACALG_ENCRYPT_XOR | 0x0D | XOR |

#### MFEU_PIN_ENCRYPT
> PIN加密2 - 算法类型
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_PIN_ENCRYPT_TEXT | 0x00 | 明文 |
| MF_PIN_ENCRYPT_XOR | 0x01 | 固定异或 |
| MF_PIN_ENCRYPT_SNXOR | 0x02 | ＳＮ异或 |

#### MFEU_ECASH_TRADE
> 电子现金交易指示器
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_ECASH_FORBIT | 0x00 | 不支持 |
| MF_ECASH_PERMIT | 0x01 | 支持 |

#### MFEU_PBOC_FLOW
> PBOC流程指示
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_PBOC_FULL | 0x06 | 读应用数据 |
| MF_PBOC_PART | 0x01 | 第一次密文生成 |

#### MFEU_IC_ONLINE
> IC卡操作是否联机
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_ONLINE_NO | 0x30 | 不强制联机 |
| MF_ONLINE_YES | 0x31 | 强制联机 |

#### MFEU_ONLINE_RESULT
> 是否联机成功
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_ONLINE_SUCC | 0x00 | 联机成功 |
| MF_ONLINE_FAIL | 0x01 | 联机未成功 |

#### MFEU_PINREQ
> PIN输入指示
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_PINREQ_NO | 0x00 | 不要求输入 |
| MF_PINREQ_YES | 0x01 | 要求输入 |
| MF_PINREQ_AUTO | 0x02 | 免密判断(当小于免密金额时，非接不输密，IC卡需要输密) |

#### MFEU_FAILBACK](MFEU_FAILBACK
> 是否允许降级
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_FAILBACK_NO | 0x00 | 不允许降级 |
| MF_FAILBACK_YES | 0x01 | 允许降级 |

#### MFEU_TRADE_TYPE
> 交易类型
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_FUNC_BALANCE | 0x00 | 查询 |
| MF_FUNC_SALE | 0x01 | 消费 |
| MF_FUNC_PREAUTH | 0x02 | 预授权 |
| MF_FUNC_AUTHSALE | 0x03 | 预授权完成请求 |
| MF_FUNC_AUTHSALEOFF | 0x04 | 预授权完成通知 |
| MF_FUNC_AUTHSETTLE | 0x05 | 预授权结算 |
| MF_FUNC_ADDTO_PREAUTH | 0x06 | 追加预授权 |
| MF_FUNC_REFUND | 0x07 | 退货 |
| MF_FUNC_VOID_SALE | 0x08 | 消费撤销 |
| MF_FUNC_VOID_AUTHSALE | 0x09 | 预授权完成撤销 |
| MF_FUNC_VOID_AUTHSETTLE | 0x0A | 结算撤销 |
| MF_FUNC_VOID_PREAUTH | 0x0B | 预授授权撤销 |
| MF_FUNC_VOID_REFUND | 0x0C | 撤销退货 |
| MF_FUNC_OFFLINE | 0x0D | 离线结算 |
| MF_FUNC_ADJUST | 0x0E | 结算调整 |


#### MFEU_DUKPT_ALG
> DUKPT密钥类型
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_DUKPT_IPEK | 0x00 | IPEK明文 |
| MF_DUKPT_BDK | 0x01 | BDK明文 |
| MF_DUKPT_IPEK_ENC_KEK | 0x02 | IPEK密文 |
| MF_DUKPT_BHK_ENC_KEK | 0x03 | BDK密文 |
| MF_DUKPT_IPEK_ENC_MAK | 0x04 | IPEK密文 |
| MF_DUKPT_BHK_ENC_MAK | 0x05 | BDK密文 |

#### MFEU_DUKPT_TYPE
> DUKPT加密方式
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_DUKPT_DES_KEY_PIN | 0x00 | PIN |
| MF_DUKPT_DES_KEY_MAC1 | 0x01 | MAC1 |
| MF_DUKPT_DES_KEY_MAC2 | 0x02 |  MAC2 |
| MF_DUKPT_DES_KEY_DATA1 | 0x03 | DATA1 |
| MF_DUKPT_DES_KEY_DATA2 | 0x04 | DATA2 |
| MF_DUKPT_DES_KEY_PEK | 0x99 | PEK |

#### MFEU_DUKPT_OPER
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_DUKPT_ENCRYPT | 0x00 | 加密 |
| MF_DUKPT_DECRYPT | 0x01 | 解密 |

#### MFEU_DUKPT_METHOD
> DUKPT DES计算加密方式
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_DUKPT_ECB | 0x00 | ECB |
| MF_DUKPT_CBC | 0x01 | CBC |


#### MFEU_MSR_UPGRADE_STAT
> 升级状态返回
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_UPSTAT_BEGIN | 0x00 | 升级开始 |
| MF_UPSTAT_DOING | 0x00 | 升级中 |
| MF_UPSTAT_END | 0x01 | 升级结束 |

#### MFEU_UPGRADE_REQ
> 升级请求状态
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_UPREQ_START | 0x01 | 升级开始 |
| MF_UPREQ_DOING | 0x02 | 升级中 |
| MF_UPREQ_FINISH | 0x03 | 结束 |







