//
//  Macros_Web_Api.h
//  IHFnurse
//
//  Created by ihefelocal001 on 16/3/6.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//


/*******************
 
 服务器相关IP地址：
 内网测试IP:    http://192.168.10.206:8080
 外网测试IP:    
 本地IP：
 
 *******************/



/*
 * 定义和当前项目相关的 WebApi接口
 */

#ifndef SS_Macros_Web_Api_h
#define SS_Macros_Web_Api_h

#ifdef DEBUG
    #if 1
        //内网测试IP:
        #define SS_NetWork_Web_Api @"http://192.168.10.206:8080/m_pharmacy"
    #else
        //本地IP：
        #define SS_NetWork_Web_Api @"http://192.168.20.54:7070/m_pharmacy"
    #endif
#else
    #define SS_NetWork_Web_Api [NSString stringWithFormat:@"%@/m_pharmacy/", [[NSUserDefaults standardUserDefaults] objectForKey:@"MedicineServerIP"]]
#endif

/****************** Web_Api 接口 ******************/

//临时获取 token
#define UC_Token    @"uc/token"

//注册
#define Registered  @"uc/registered"

//登录验证
#define CheckLogin @"uc/login" 






/*************************************************/

/**
 *  分类列表
 */
#define CategoryList(zCode) [NSString stringWithFormat:@"dc/async/list/%@",zCode];



/**
 *  搜索药品
 */
#define SearchMedic @"drug/search/list"
/**
 *  搜索药品说明书
 */
#define SearchMedicInstruction @"drug/children/list"
/**
 *
 */
#define IndexMedic @"drug/node/list"


/**
 *  修改药品说明书
 */
#define ModifyMedicInstrucyion  @"drug/update/desc"
/**
 *  规则分类
 */
#define RuleCategary @"rule/type/list"
/**
 *  字段分类列表
 */
#define CharacterCategaryList @"field/class/list"
/**
 *  获取字段值
 */
#define GetCharacterValue @"field/content"
/**
 *  获取子字段值
 */
#define GetCharacterChildValue @"field/node/list"
/**
 *  查看某个药品下某个规则分类下的配置规则--规则配置
 */
#define LookUpRule  @"rule/show"
/**
 *  保存规则
 */
#define RuleSave  @"rule/save"
/**
 *  修改规则
 */
#define RuleChange @"rule/update"
/**
 *  删除规则
 */
#define RuleDelte(id,flag,zCode)  [NSString stringWithFormat:@"rule/delete/%@/%@/%@",id,flag,zCode]
/**
 *  搜索规则节点
 */
#define RuleSearch @"field/search"
/**
 *  保存搜索记录
 */
#define SaveSearchList @"rule/save/log"

/**
 *  获取历史搜索列表
 */
#define ObtainSearchHistoryList @"rule/log/list" 
/**
 *  清除搜索历史搜索记录
 */
#define ClearAllHistorySearchList @"rule/log/delete"
/**
 *  删除一条历史记录
 */
#define DeletOneSearchList(slId) [NSString stringWithFormat:@"/rule/log/delete/%@",slId]


#endif /* Macros_Web_Api_h */










