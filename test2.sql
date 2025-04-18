--以下两个接口主要用于校验运营中台账户信息管理界面的股东账户和资金账户是否已经配置到了新意结算任务管理系统（E-CTMS）2024年12月19日10:56:52

--新意结算任务管理系统（E-CTMS）股东证券账号配置校验接口
SELECT  PRODUCT_CODE,--产品代码
        TOTAL        --配置数量
FROM
(
	SELECT  'XTCP00000001' PRODUCT_CODE,
	        COUNT(1) TOTAL
	FROM EA_CTMS.BS_TRUST_INV_INFO --证券账户信息 
	WHERE 1 = 1
	AND INV_ACC = 'E080018570' --入参:证券（股东）账号 
	AND MARKET_CODE = '01' --入参:市场代码（上海A股 01 深圳A股 02 北交所及股转系统(人民币) 13) 
 AND SETTLE_ENTITY_ID = '1' --结算主体ID（1 齐鲁证券有限公司） 
 AND PRODUCT_CODE = 'XTCP00000001' --产品代码（管理人外包系列 XTCP00000001 中泰托管产品 XTCP00000003） 
 
	UNION ALL
	SELECT  'XTCP00000003' PRODUCT_CODE,
	        COUNT(1) TOTAL
	FROM EA_CTMS.BS_TRUST_INV_INFO --证券账户信息 
	WHERE 1 = 1
	AND INV_ACC = 'E080018570' --入参:证券（股东）账号 
	AND MARKET_CODE = '01' --入参:市场代码（上海A股 01 深圳A股 02 北交所及股转系统(人民币) 13) 
 AND SETTLE_ENTITY_ID = '1' --结算主体ID（1 齐鲁证券有限公司） 
 AND PRODUCT_CODE = 'XTCP00000003' --产品代码（管理人外包系列 XTCP00000001 中泰托管产品 XTCP00000003） 
 
) 

--新意结算任务管理系统（E-CTMS）股资金账号配置校验接口  
SELECT  PRODUCT_CODE,--产品代码
        TOTAL        --配置数量
FROM
(
	SELECT  'XTCP00000001' PRODUCT_CODE,
	        COUNT(1) TOTAL
	FROM EA_CTMS.BS_TRUST_FUND_ACC_INFO --证券账户信息 
	WHERE 1 = 1
	AND FUND_ACC = '209116001218' --入参:资金账号 
	AND PRODUCT_CODE = 'XTCP00000001' --产品代码（管理人外包系列 XTCP00000001 中泰托管产品 XTCP00000003） 
 
	UNION ALL
	SELECT  'XTCP00000003' PRODUCT_CODE,
	        COUNT(1) TOTAL
	FROM EA_CTMS.BS_TRUST_FUND_ACC_INFO --证券账户信息 
	WHERE 1 = 1
	AND FUND_ACC = '209116001218' --入参:资金账号 
	AND PRODUCT_CODE = 'XTCP00000003' --产品代码（管理人外包系列 XTCP00000001 中泰托管产品 XTCP00000003） 
 
)
