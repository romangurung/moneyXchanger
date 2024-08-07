//
//  Country+CurrencyName.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/10/24.
//

extension Country {
    var currencyName: String {
        switch self {
        case .afghanistan: "Afghan Afghani"
        case .alandIslands: "Euro (Aland Islands)"
        case .albania: "Albanian Lek"
        case .algeria: "Algerian Dinar"
        case .americanSamoa: "US Dollar (American Samoa)"
        case .andorra: "Euro (Andorra)"
        case .angola: "Angolan Kwanza"
        case .anguilla: "East Caribbean Dollar"
        case .antiguaAndBarbuda: "East Caribbean Dollar"
        case .argentina: "Argentine Peso"
        case .armenia: "Armenian Dram"
        case .aruba: "Aruban Florin"
        case .australia: "Australian Dollar"
        case .austria: "Euro (Austria)"
        case .azerbaijan: "Azerbaijani Manat"
        case .bahamas: "Bahamian Dollar"
        case .bahrain: "Bahraini Dinar"
        case .bangladesh: "Bangladeshi Taka"
        case .barbados: "Barbadian Dollar"
        case .belarus: "Belarusian Ruble"
        case .belgium: "Euro (Belgium)"
        case .belize: "Belize Dollar"
        case .benin: "West African CFA Franc"
        case .bermuda: "Bermudian Dollar"
        case .bhutan: "Bhutanese Ngultrum"
        case .bolivia: "Bolivian Boliviano"
        case .bonaire: "US Dollar (Bonaire)"
        case .bosniaAndHerzegovina: "Bosnia-Herzegovina Convertible Mark"
        case .botswana: "Botswana Pula"
        case .bouvetIsland: "Norwegian Krone"
        case .brazil: "Brazilian Real"
        case .britishIndianOceanTerritory: "US Dollar (British Indian Ocean Territory)"
        case .bruneiDarussalam: "Brunei Dollar"
        case .bulgaria: "Bulgarian Lev"
        case .burkinaFaso: "West African CFA Franc"
        case .burundi: "Burundian Franc"
        case .caboVerde: "Cape Verdean Escudo"
        case .cambodia: "Cambodian Riel"
        case .cameroon: "Central African CFA Franc"
        case .canada: "Canadian Dollar"
        case .caymanIslands: "Cayman Islands Dollar"
        case .centralAfricanRepublic: "Central African CFA Franc"
        case .chad: "Central African CFA Franc"
        case .chile: "Chilean Peso"
        case .china: "Chinese Yuan"
        case .christmasIsland: "Australian Dollar (Christmas Island)"
        case .cocosIslands: "Australian Dollar (Cocos Islands)"
        case .colombia: "Colombian Peso"
        case .comoros: "Comorian Franc"
        case .congo: "Congolese Franc"
        case .congoDemocraticRepublic: "Congolese Franc"
        case .cookIslands: "New Zealand Dollar (Cook Islands)"
        case .costaRica: "Costa Rican Colón"
        case .coteDIvoire: "West African CFA Franc"
        case .croatia: "Croatian Kuna"
        case .cuba: "Cuban Peso"
        case .curacao: "Netherlands Antillean Guilder"
        case .cyprus: "Euro (Cyprus)"
        case .czechRepublic: "Czech Republic Koruna"
        case .denmark: "Danish Krone"
        case .djibouti: "Djiboutian Franc"
        case .dominica: "East Caribbean Dollar"
        case .dominicanRepublic: "Dominican Peso"
        case .ecuador: "US Dollar (Ecuador)"
        case .egypt: "Egyptian Pound"
        case .elSalvador: "US Dollar (El Salvador)"
        case .equatorialGuinea: "Central African CFA Franc"
        case .eritrea: "Eritrean Nakfa"
        case .estonia: "Euro (Estonia)"
        case .eswatini: "Swazi Lilangeni"
        case .ethiopia: "Ethiopian Birr"
        case .falklandIslands: "Falkland Islands Pound"
        case .faroeIslands: "Danish Krone"
        case .fiji: "Fijian Dollar"
        case .finland: "Euro (Finland)"
        case .france: "Euro (France)"
        case .frenchGuiana: "Euro (French Guiana)"
        case .frenchPolynesia: "CFP Franc"
        case .frenchSouthernTerritories: "Euro (French Southern Territories)"
        case .gabon: "Central African CFA Franc"
        case .gambia: "Gambian Dalasi"
        case .georgia: "Georgian Lari"
        case .germany: "Euro (Germany)"
        case .ghana: "Ghanaian Cedi"
        case .gibraltar: "Gibraltar Pound"
        case .greece: "Euro (Greece)"
        case .greenland: "Danish Krone"
        case .grenada: "East Caribbean Dollar"
        case .guadeloupe: "Euro (Guadeloupe)"
        case .guam: "US Dollar (Guam)"
        case .guatemala: "Guatemalan Quetzal"
        case .guernsey: "British Pound Sterling (Guernsey)"
        case .guinea: "Guinean Franc"
        case .guineaBissau: "West African CFA Franc"
        case .guyana: "Guyanaese Dollar"
        case .haiti: "Haitian Gourde"
        case .heardIslandAndMcDonaldIslands: "Australian Dollar (Heard Island And McDonald Islands)"
        case .holySee: "Euro (Holy See)"
        case .honduras: "Honduran Lempira"
        case .hongKong: "Hong Kong Dollar"
        case .hungary: "Hungarian Forint"
        case .iceland: "Icelandic Króna"
        case .india: "Indian Rupee"
        case .indonesia: "Indonesian Rupiah"
        case .iran: "Iranian Rial"
        case .iraq: "Iraqi Dinar"
        case .ireland: "Euro (Ireland)"
        case .isleOfMan: "British Pound Sterling (Isle Of Man)"
        case .israel: "Israeli New Sheqel"
        case .italy: "Euro (Italy)"
        case .jamaica: "Jamaican Dollar"
        case .japan: "Japanese Yen"
        case .jersey: "British Pound Sterling (Jersey)"
        case .jordan: "Jordanian Dinar"
        case .kazakhstan: "Kazakhstani Tenge"
        case .kenya: "Kenyan Shilling"
        case .kiribati: "Australian Dollar (Kiribati)"
        case .korea: "South Korean Won"
        case .kuwait: "Kuwaiti Dinar"
        case .kyrgyzstan: "Kyrgystani Som"
        case .laoPeopleSDemocraticRepublic: "Lao Kip"
        case .latvia: "Euro (Latvia)"
        case .lebanon: "Lebanese Pound"
        case .lesotho: "Lesotho Loti"
        case .liberia: "Liberian Dollar"
        case .libya: "Libyan Dinar"
        case .liechtenstein: "Swiss Franc"
        case .lithuania: "Euro (Lithuania)"
        case .luxembourg: "Euro (Luxembourg)"
        case .macao: "Macanese Pataca"
        case .madagascar: "Malagasy Ariary"
        case .malawi: "Malawian Kwacha"
        case .malaysia: "Malaysian Ringgit"
        case .maldives: "Maldivian Rufiyaa"
        case .mali: "West African CFA Franc"
        case .malta: "Euro (Malta)"
        case .marshallIslands: "US Dollar (Marshall Islands)"
        case .martinique: "Euro (Martinique)"
        case .mauritania: "Mauritanian Ouguiya"
        case .mauritius: "Mauritian Rupee"
        case .mayotte: "Euro (Mayotte)"
        case .mexico: "Mexican Peso"
        case .micronesia: "US Dollar (Micronesia)"
        case .moldova: "Moldovan Leu"
        case .monaco: "Euro (Monaco)"
        case .mongolia: "Mongolian Tugrik"
        case .montenegro: "Euro (Montenegro)"
        case .montserrat: "East Caribbean Dollar"
        case .morocco: "Moroccan Dirham"
        case .mozambique: "Mozambican Metical"
        case .myanmar: "Myanma Kyat"
        case .namibia: "Namibian Dollar"
        case .nauru: "Australian Dollar (Nauru)"
        case .nepal: "Nepalese Rupee"
        case .netherlands: "Euro (Netherlands)"
        case .newCaledonia: "CFP Franc"
        case .newZealand: "New Zealand Dollar"
        case .nicaragua: "Nicaraguan Córdoba"
        case .niger: "West African CFA Franc"
        case .nigeria: "Nigerian Naira"
        case .niue: "New Zealand Dollar (Niue)"
        case .norfolkIsland: "Australian Dollar (Norfolk Island)"
        case .northMacedonia: "Macedonian Denar"
        case .northernMarianaIslands: "US Dollar (Northern Mariana Islands)"
        case .norway: "Norwegian Krone"
        case .oman: "Omani Rial"
        case .pakistan: "Pakistani Rupee"
        case .palau: "US Dollar (Palau)"
        case .palestine: "Israeli New Sheqel"
        case .panama: "Panamanian Balboa"
        case .papuaNewGuinea: "Papua New Guinean Kina"
        case .paraguay: "Paraguayan Guarani"
        case .peru: "Peruvian Nuevo Sol"
        case .philippines: "Philippine Peso"
        case .pitcairn: "New Zealand Dollar (Pitcairn)"
        case .poland: "Polish Zloty"
        case .portugal: "Euro (Portugal)"
        case .puertoRico: "US Dollar (Puerto Rico)"
        case .qatar: "Qatari Rial"
        case .reunion: "Euro (Reunion Island)"
        case .romania: "Romanian Leu"
        case .russianFederation: "Russian Ruble"
        case .rwanda: "Rwandan Franc"
        case .saintBarthelemy: "Euro (Saint Barthelemy)"
        case .saintHelena: "Saint Helena Pound"
        case .saintKittsAndNevis: "East Caribbean Dollar"
        case .saintLucia: "East Caribbean Dollar"
        case .saintMartin: "Euro (Saint Martin)"
        case .saintPierreAndMiquelon: "Euro (Saint Pierre And Miquelon)"
        case .saintVincentAndTheGrenadines: "East Caribbean Dollar"
        case .samoa: "Samoan Tala"
        case .sanMarino: "Euro (San Marino)"
        case .saoTomeAndPrincipe: "São Tomé and Príncipe Dobra"
        case .saudiArabia: "Saudi Riyal"
        case .senegal: "West African CFA Franc"
        case .serbia: "Serbian Dinar"
        case .seychelles: "Seychellois Rupee"
        case .sierraLeone: "Sierra Leonean Leone"
        case .singapore: "Singapore Dollar"
        case .sintMaarten: "Netherlands Antillean Guilder"
        case .slovakia: "Euro (Slovakia)"
        case .slovenia: "Euro (Slovenia)"
        case .solomonIslands: "Solomon Islands Dollar"
        case .somalia: "Somali Shilling"
        case .southAfrica: "South African Rand"
        case .southGeorgiaAndTheSouthSandwichIslands: "British Pound Sterling (South Georgia And The South Sandwich Islands)"
        case .southSudan: "South Sudanese Pound"
        case .spain: "Euro (Spain)"
        case .sriLanka: "Sri Lankan Rupee"
        case .sudan: "Sudanese Pound"
        case .suriname: "Surinamese Dollar"
        case .svalbardAndJanMayen: "Norwegian Krone"
        case .sweden: "Swedish Krona"
        case .switzerland: "Swiss Franc"
        case .syrianArabRepublic: "Syrian Pound"
        case .taiwan: "New Taiwan Dollar"
        case .tajikistan: "Tajikistani Somoni"
        case .tanzania: "Tanzanian Shilling"
        case .thailand: "Thai Baht"
        case .timorLeste: "US Dollar (Timor Leste)"
        case .togo: "West African CFA Franc"
        case .tokelau: "New Zealand Dollar (Tokelau)"
        case .tonga: "Tongan Pa'anga"
        case .trinidadAndTobago: "Trinidad and Tobago Dollar"
        case .tunisia: "Tunisian Dinar"
        case .turkey: "Turkish Lira"
        case .turkmenistan: "Turkmenistani Manat"
        case .turksAndCaicosIslands: "US Dollar (Turks And Caicos Islands)"
        case .tuvalu: "Australian Dollar (Tuvalu)"
        case .uganda: "Ugandan Shilling"
        case .ukraine: "Ukrainian Hryvnia"
        case .unitedArabEmirates: "United Arab Emirates Dirham"
        case .unitedKingdom: "British Pound Sterling (UK)"
        case .unitedStates: "US Dollar"
        case .uruguay: "Uruguayan Peso"
        case .uzbekistan: "Uzbekistan Som"
        case .vanuatu: "Vanuatu Vatu"
        case .venezuela: "Venezuelan Bolívar Soberano"
        case .vietNam: "Vietnamese Dong"
        case .virginIslands: "US Dollar (Virgin Islands)"
        case .wallisAndFutuna: "CFP Franc"
        case .westernSahara: "Moroccan Dirham"
        case .yemen: "Yemeni Rial"
        case .zambia: "Zambian Kwacha"
        case .zimbabwe: "Zimbabwean Dollar"
        }
    }
}
