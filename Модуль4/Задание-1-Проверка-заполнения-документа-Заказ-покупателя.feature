#language: ru

@tree

Функционал: Проверка заполнения документа Заказ покупателя

Как Тестировщик я хочу
убедиться что документ Заказ покупателя можно корректно заполнить 
чтобы пользователи могли работать с системой  

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Подготовка тестовых данных
	* Заполнение констант
		И я перезаполняю константу "SaasMode" значением "False"
		И я перезаполняю константу "EnableLinkedRowsIntegrity" значением "False"
		И я перезаполняю константу "UseLockDataModification" значением "True"
		И я перезаполняю константу "UseItemKey" значением "True"
		И я перезаполняю константу "UseCompanies" значением "True"
		И я перезаполняю константу "NotFirstStart" значением "False"
		И я перезаполняю константу "DefaultPictureStorageVolume" значением "e1cib/data/Catalog.FileStorageVolumes?ref=b772dbcd8801bc7611ec420177a49496"
	* Заполнение справочников и связанных объектов
		// Справочник.Companies

		И я проверяю или создаю для справочника "Companies" объекты:
			| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'Country'                                                           | 'MainCompany' | 'Partner'                                                          | 'Type'                          | 'OurCompany' | 'Description_en'         | 'Description_hash' | 'Description_ru' | 'Description_tr' |
			| 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7674324a4a2a' | 'False'        | 5      | ''                                                                  | ''            | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794b' | 'Enum.CompanyLegalType.Company' | 'False'      | 'Клиент 1'               | ''                 | ''               | ''               |
			| 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | 'False'        | 1      | 'e1cib/data/Catalog.Countries?ref=b762b13668d0905011eb7663e35d7963' | ''            | ''                                                                 | 'Enum.CompanyLegalType.Company' | 'True'       | 'Собственная компания 1' | ''                 | ''               | ''               |

		И я перезаполняю для объекта табличную часть "Currencies":
			| 'Ref'                                                               | 'MovementType'                                                                                    |
			| 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7968' |
			| 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7969' |
			| 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796a' |

		// Справочник.Countries

		И я проверяю или создаю для справочника "Countries" объекты:
			| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'Currency'                                                           | 'LocalizationCode' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' |
			| 'e1cib/data/Catalog.Countries?ref=b762b13668d0905011eb7663e35d7963' | 'False'        | 1      | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795f' | ''                 | 'Страна 1'       | ''                 | ''               | ''               |

		// Справочник.Currencies

		И я проверяю или создаю для справочника "Currencies" объекты:
			| 'Ref'                                                                | 'DeletionMark' | 'Code' | 'Symbol' | 'NumericCode' | 'REP_Attribute1' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' |
			| 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 'False'        | 'USD'  | '$'      | '840'         | ''               | 'Доллар'         | ''                 | ''               | ''               |
			| 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795f' | 'False'        | 'EUR'  | '€'      | '978'         | ''               | 'Евро'           | ''                 | ''               | ''               |

		// Справочник.IntegrationSettings

		И я проверяю или создаю для справочника "IntegrationSettings" объекты:
			| 'Ref'                                                                         | 'DeletionMark' | 'Code' | 'Description'            | 'ExternalDataProc' | 'IntegrationType'                    | 'ExternalDataProcSettings'              | 'UniqueID'                          |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'False'        | 1      | 'Источник курса валют 1' | ''                 | 'Enum.IntegrationType.CurrencyRates' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | '_8a862d6e657e4386b794c6e29f6a05e0' |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7967' | 'False'        | 2      | 'Источник курса валют 2' | ''                 | 'Enum.IntegrationType.CurrencyRates' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | '_b3fe2453726d4545b3334f227d3a00ba' |

		И я перезаполняю для объекта табличную часть "ConnectionSetting":
			| 'Ref'                                                                         | 'Key'                 | 'Value'     |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'QueryType'           | 'POST'      |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'ResourceAddress'     | ''          |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'Ip'                  | 'localhost' |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'Port'                | '8 080'     |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'User'                | ''          |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'Password'            | ''          |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'Proxy'               | ''          |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'TimeOut'             | '60'        |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'SecureConnection'    | ''          |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'UseOSAuthentication' | 'False'     |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'Headers'             | 'Map'       |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7967' | 'QueryType'           | 'POST'      |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7967' | 'ResourceAddress'     | ''          |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7967' | 'Ip'                  | 'localhost' |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7967' | 'Port'                | '8 080'     |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7967' | 'User'                | ''          |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7967' | 'Password'            | ''          |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7967' | 'Proxy'               | ''          |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7967' | 'TimeOut'             | '60'        |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7967' | 'SecureConnection'    | ''          |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7967' | 'UseOSAuthentication' | 'False'     |
			| 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7967' | 'Headers'             | 'Map'       |

		// Справочник.Partners

		И я проверяю или создаю для справочника "Partners" объекты:
			| 'Ref'                                                              | 'DeletionMark' | 'Parent' | 'Code' | 'Customer' | 'Vendor' | 'Employee' | 'Opponent' | 'ManagerSegment'                                                          | 'Description_en'          | 'Description_hash' | 'Description_ru' | 'Description_tr' |
			| 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794b' | 'False'        | ''       | 1      | 'True'     | 'False'  | 'False'    | 'False'    | 'e1cib/data/Catalog.PartnerSegments?ref=b762b13668d0905011eb7663e35d7955' | 'Клиент 1 (1 соглашение)' | ''                 | ''               | ''               |

		// Справочник.PartnerSegments

		И я проверяю или создаю для справочника "PartnerSegments" объекты:
			| 'Ref'                                                                     | 'DeletionMark' | 'Code' | 'BanOnShipping' | 'Managers' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' |
			| 'e1cib/data/Catalog.PartnerSegments?ref=b762b13668d0905011eb76684b9f6864' | 'False'        | 3      | 'False'         | 'False'    | 'Основной'       | ''                 | ''               | ''               |
			| 'e1cib/data/Catalog.PartnerSegments?ref=b762b13668d0905011eb7663e35d7955' | 'False'        | 1      | 'False'         | 'True'     | 'Менеджер 1'     | ''                 | ''               | ''               |

		// Справочник.PaymentSchedules

		И я проверяю или создаю для справочника "PaymentSchedules" объекты:
			| 'Ref'                                                                      | 'DeletionMark' | 'Code' | 'Description_en'  | 'Description_hash' | 'Description_ru' | 'Description_tr' |
			| 'e1cib/data/Catalog.PaymentSchedules?ref=b762b13668d0905011eb76684b9f686c' | 'False'        | 1      | 'Отсрочка 7 дней' | ''                 | ''               | ''               |

		И я перезаполняю для объекта табличную часть "StagesOfPayment":
			| 'Ref'                                                                      | 'CalculationType'                          | 'ProportionOfPayment' | 'DuePeriod' |
			| 'e1cib/data/Catalog.PaymentSchedules?ref=b762b13668d0905011eb76684b9f686c' | 'Enum.CalculationTypes.PostShipmentCredit' | 100                   | 7           |

		// Справочник.PriceTypes

		И я проверяю или создаю для справочника "PriceTypes" объекты:
			| 'Ref'                                                                | 'DeletionMark' | 'Code' | 'Currency'                                                           | 'ExternalDataProc' | 'ExternalDataProcSettings'              | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' |
			| 'e1cib/data/Catalog.PriceTypes?ref=b762b13668d0905011eb76684b9f6866' | 'False'        | 2      | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | ''                 | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'Опт'            | ''                 | ''               | ''               |

		// Справочник.Stores

		И я проверяю или создаю для справочника "Stores" объекты:
			| 'Ref'                                                            | 'DeletionMark' | 'Code' | 'UseGoodsReceipt' | 'UseShipmentConfirmation' | 'Transit' | 'NegativeStockControl' | 'Description_en'                | 'Description_hash' | 'Description_ru' | 'Description_tr' |
			| 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | 'False'        | 1      | 'True'            | 'True'                    | 'False'   | 'True'                 | 'Склад 1 (с контролем остатка)' | ''                 | ''               | ''               |

		// ПланВидовХарактеристик.CurrencyMovementType

		И я проверяю или создаю для плана видов характеристик "CurrencyMovementType" объекты:
			| 'Ref'                                                                                             | 'DeletionMark' | 'Currency'                                                           | 'Source'                                                                      | 'Type'                        | 'DeferredCalculation' | 'Description_en'            | 'Description_hash' | 'Description_ru' | 'Description_tr' |
			| 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796b' | 'False'        | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'Enum.CurrencyType.Agreement' | 'False'               | 'Валюта соглашения, USD'    | ''                 | ''               | ''               |
			| 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7968' | 'False'        | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'Enum.CurrencyType.Reporting' | 'False'               | 'В валюте отчетности'       | ''                 | ''               | ''               |
			| 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7969' | 'False'        | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795f' | 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7967' | 'Enum.CurrencyType.Budgeting' | 'True'                | 'В валюте бюджетирования'   | ''                 | ''               | ''               |
			| 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796a' | 'False'        | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795f' | 'e1cib/data/Catalog.IntegrationSettings?ref=b762b13668d0905011eb7663e35d7966' | 'Enum.CurrencyType.Legal'     | 'False'               | 'В локальной валюте страны' | ''                 | ''               | ''               |

		И я проверяю или создаю для справочника "ObjectStatuses" объекты:
			| 'Ref'                                                                    | 'DeletionMark' | 'Parent'                                                            | 'IsFolder' | 'Code' | 'SetByDefault' | 'Posting' | 'Description_en'                          | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'UniqueID'                          |
			| 'e1cib/data/Catalog.ObjectStatuses?refName=PhysicalInventory'            | 'False'        | ''                                                                  | 'True'     | 1      | ''             | ''        | 'Инвентаризация товаров'                  | ''                 | ''               | ''               | '_011ff8e30cf94565b46e079f1abb75a6' |
			| 'e1cib/data/Catalog.ObjectStatuses?refName=IncomingPaymentOrder'         | 'False'        | ''                                                                  | 'True'     | 1      | ''             | ''        | 'IncomingPaymentOrder'                    | ''                 | ''               | ''               | '_d74a42dedf1b4837ab902b5246719782' |
			| 'e1cib/data/Catalog.ObjectStatuses?refName=PhysicalCountByLocation'      | 'False'        | ''                                                                  | 'True'     | 2      | ''             | ''        | 'Пересчет товаров'                        | ''                 | ''               | ''               | '_f2caef1fffef41d3b1e506c06265f7cc' |
			| 'e1cib/data/Catalog.ObjectStatuses?refName=ReconciliationStatement'      | 'False'        | ''                                                                  | 'True'     | 4      | ''             | ''        | 'Сверка взаиморасчетов'                   | ''                 | ''               | ''               | '_2bc125ff84c345afb9a379ecf9973f7a' |
			| 'e1cib/data/Catalog.ObjectStatuses?refName=OutgoingPaymentOrder'         | 'False'        | ''                                                                  | 'True'     | 5      | ''             | ''        | 'Заявки на расходование денежных средств' | ''                 | ''               | ''               | '_394edf09b6764e62b535ea75ef2b4720' |
			| 'e1cib/data/Catalog.ObjectStatuses?refName=InventoryTransferOrder'       | 'False'        | ''                                                                  | 'True'     | 6      | ''             | ''        | 'Заказ на перемещение товаров'            | ''                 | ''               | ''               | '_483611bad5e54081a794d036a2346f4a' |
			| 'e1cib/data/Catalog.ObjectStatuses?refName=PurchaseReturnOrder'          | 'False'        | ''                                                                  | 'True'     | 7      | ''             | ''        | 'Заявка на возврат поставщику'            | ''                 | ''               | ''               | '_0c1f63bf35804c1dabcf07d054ff1f70' |
			| 'e1cib/data/Catalog.ObjectStatuses?refName=PurchaseOrder'                | 'False'        | ''                                                                  | 'True'     | 8      | ''             | ''        | 'Возврат поставщику'                      | ''                 | ''               | ''               | '_369503c2c7ba48a3a9301e20bcc5860a' |
			| 'e1cib/data/Catalog.ObjectStatuses?refName=SalesReturnOrder'             | 'False'        | ''                                                                  | 'True'     | 9      | ''             | ''        | 'Заявка на возврат от клиента'            | ''                 | ''               | ''               | '_fa0f6210cc9344dd93c439e04aee6889' |
			| 'e1cib/data/Catalog.ObjectStatuses?refName=SalesOrder'                   | 'False'        | ''                                                                  | 'True'     | 10     | ''             | ''        | 'Заказ клиента'                           | ''                 | ''               | ''               | '_53e7ae4fe81b45e2a261171cf3f73563' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b762b13668d0905011eb766bf96b2788' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=SalesOrder'              | 'False'    | 11     | 'False'        | 'False'   | 'На согласовании'                         | ''                 | ''               | ''               | '_e96c5a6be90a46b499efaef7c6f44ae9' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b762b13668d0905011eb766bf96b2789' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=SalesOrder'              | 'False'    | 12     | 'True'         | 'True'    | 'Согласовано'                             | ''                 | ''               | ''               | '_e0cb85b20091495d9bde24e1a4d1e2cb' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b762b13668d0905011eb766bf96b278a' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=SalesReturnOrder'        | 'False'    | 13     | 'True'         | 'True'    | 'Согласовано'                             | ''                 | ''               | ''               | '_b2376400750e4304b84c237d9f19725c' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b762b13668d0905011eb766bf96b278b' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=PurchaseOrder'           | 'False'    | 14     | 'True'         | 'True'    | 'Согласовано'                             | ''                 | ''               | ''               | '_68b977a1c5c7429a88fac13e225ef169' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b762b13668d0905011eb7674324a4a1c' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=PurchaseReturnOrder'     | 'False'    | 15     | 'True'         | 'True'    | 'Согласовано'                             | ''                 | ''               | ''               | '_df704d8afba34edfb64eaa4c2ae337f0' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b762b13668d0905011eb7674324a4a1d' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=InventoryTransferOrder'  | 'False'    | 16     | 'True'         | 'False'   | 'Подготовлено'                            | ''                 | ''               | ''               | '_dca4228cbfdf4de7acc2a4a19467e93e' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b762b13668d0905011eb7674324a4a1e' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=InventoryTransferOrder'  | 'False'    | 17     | 'False'        | 'True'    | 'Согласовано'                             | ''                 | ''               | ''               | '_ba6e42553f084d648795b9d2e7f28b13' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b762b13668d0905011eb7674324a4a1f' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=OutgoingPaymentOrder'    | 'False'    | 18     | 'True'         | 'False'   | 'На согласовании'                         | ''                 | ''               | ''               | '_04e45f2868b84b18a7bb32cb5d623a18' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b762b13668d0905011eb7674324a4a20' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=OutgoingPaymentOrder'    | 'False'    | 19     | 'False'        | 'False'   | 'Согласовано'                             | ''                 | ''               | ''               | '_ae13b9000d764b8eb50e83eef27451e3' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b762b13668d0905011eb7674324a4a21' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=ReconciliationStatement' | 'False'    | 20     | 'True'         | 'True'    | 'Согласовано'                             | ''                 | ''               | ''               | '_865788d8a36b46df96cfad57a5afe67d' |
			| 'e1cib/data/Catalog.ObjectStatuses?refName=Complete'                     | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=PhysicalCountByLocation' | 'False'    | 21     | 'False'        | 'True'    | 'Завершено'                               | ''                 | ''               | ''               | '_7c7e7273456b4fc594f457fa7d369765' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b762b13668d0905011eb7674324a4a22' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=PhysicalCountByLocation' | 'False'    | 22     | 'True'         | 'False'   | 'Подготовлено'                            | ''                 | ''               | ''               | '_a6dc69ec771a4802820a1578ce0ff11f' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b762b13668d0905011eb7674324a4a23' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=PhysicalInventory'       | 'False'    | 23     | 'True'         | 'False'   | 'Подготовлено'                            | ''                 | ''               | ''               | '_f6a41eee9db84589ad93300ec634c8a3' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b762b13668d0905011eb7674324a4a24' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=PhysicalInventory'       | 'False'    | 24     | 'False'        | 'True'    | 'Завершено'                               | ''                 | ''               | ''               | '_c1209341a53b4023b524b57081157e6a' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b76bafe8d8921be311ebc44d41a46794' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=IncomingPaymentOrder'    | 'False'    | 25     | 'False'        | 'False'   | 'На согласовании'                         | ''                 | ''               | ''               | '_b9335c1f9b0d40a9a77e0c86bdf06260' |
			| 'e1cib/data/Catalog.ObjectStatuses?ref=b76bafe8d8921be311ebc44d41a46795' | 'False'        | 'e1cib/data/Catalog.ObjectStatuses?refName=IncomingPaymentOrder'    | 'False'    | 26     | 'True'         | 'True'    | 'Согласовано'                             | ''                 | ''               | ''               | '_52af65cf7e95432f9414dd8a5f862e13' |

		// Справочник.Agreements

		И я проверяю или создаю для справочника "Agreements" объекты:
			| 'Ref'                                                                | 'DeletionMark' | 'Code' | 'Number' | 'Date'               | 'PartnerSegment'                                                          | 'Partner'                                                          | 'Company'                                                           | 'PriceType'                                                          | 'ItemSegment' | 'StartUsing'         | 'EndOfUse'           | 'ManagerSegment' | 'PriceIncludeTax' | 'DaysBeforeDelivery' | 'Store'                                                          | 'Type'                         | 'LegalName' | 'CurrencyMovementType'                                                                            | 'ApArPostingDetail'                  | 'StandardAgreement' | 'Kind'                        | 'UseCreditLimit' | 'CreditLimitAmount' | 'PaymentTerm'                                                              | 'Description_en'                                                  | 'Description_hash' | 'Description_ru' | 'Description_tr' |
			| 'e1cib/data/Catalog.Agreements?ref=b762b13668d0905011eb76684b9f6867' | 'False'        | 1      | '123456' | '01.01.2021 0:00:00' | 'e1cib/data/Catalog.PartnerSegments?ref=b762b13668d0905011eb76684b9f6864' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794b' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | 'e1cib/data/Catalog.PriceTypes?ref=b762b13668d0905011eb76684b9f6866' | ''            | '01.01.2021 0:00:00' | '01.01.0001 0:00:00' | ''               | 'True'            |                      | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | 'Enum.AgreementTypes.Customer' | ''          | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796b' | 'Enum.ApArPostingDetail.ByDocuments' | ''                  | 'Enum.AgreementKinds.Regular' | 'True'           | 5000                | 'e1cib/data/Catalog.PaymentSchedules?ref=b762b13668d0905011eb76684b9f686c' | 'Соглашение с клиентами (расчет по документам + кредитный лимит)' | ''                 | ''               | ''               |


	


Сценарий: Проверка заполнения полей
	* Открытие формы списка заказов
		И я закрываю все окна клиентского приложения
		И я перехожу по навигационной ссылке "e1cib/list/Document.SalesOrder"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Заказ покупателя (создание)'
	* Проверка наличия полей на форме
		И элемент формы "Контрагент" присутствует на форме
		И элемент формы "Партнер" присутствует на форме
		И элемент формы "Соглашение" присутствует на форме
	* Проверка доступности поля Контрагент в зависимости от заполнености поля Партнер	
		И в поле с именем 'Partner' я ввожу текст ''
		И я перехожу к следующему реквизиту
		И элемент формы с именем "Partner" стал равен ''
		И элемент формы "Контрагент" не доступен
		И я нажимаю кнопку выбора у поля с именем "Partner"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '1'   | 'Клиент 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
		И элемент формы "Партнер" стал равен "Клиент 1 (1 соглашение)" 
		И элемент формы "Контрагент" доступен
	* Заполнение реквизитов Соглашение и Контрагент
		И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
		И я нажимаю кнопку выбора у поля с именем "LegalName"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование' |
			| '5'   | 'Клиент 1'     |
		И в таблице "List" я выбираю текущую строку
		И элемент формы с именем "LegalName" стал равен 'Клиент 1'
		И я нажимаю кнопку выбора у поля с именем "Agreement"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'                                                    | 'Вид'     | 'Вид взаиморасчетов' |
			| '1'   | 'Соглашение с клиентами (расчет по документам + кредитный лимит)' | 'Обычное' | 'По документам'      |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Табличная часть товаров будет обновлена'
		И я нажимаю на кнопку с именем 'FormOK'
		И элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
	* Заполнение поля соглашение после перевыбора контрагента
		И в поле с именем 'Agreement' я ввожу текст ''
		И я нажимаю кнопку выбора у поля с именем "Partner"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '1'   | 'Клиент 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Табличная часть товаров будет обновлена'
		И я нажимаю на кнопку с именем 'FormOK'
		И элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
		