//
//  ShipsLayer.h
//  Defence
//      控制多艘飞船的出生，移动，各种动画，
//  Created by  亓庆国 on 12-11-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//  决定难度的方面：敌舰的数量，敌舰的种类，敌舰的飞行速度（应该由飞船自身决定），AI寻路算法
//想法是让gamelayer定制shipsLayer，让gamelayer从繁重的工作中解脱出来
//确定种类，数量，位置
#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "EnemyNumberDef.h"

@interface ShipsLayer :CCLayer{
    
    //难度
    int hardLevel;
    //存储船的数组
    CCArray* enemyArray;
    //每种船有多少
    EnemyNumberDef * enemyDef;
}
-(id)init;
-(void)setEnemyNumber:(EnemyNumberDef*)set;   //write parament later
-(void)setHardLevel:(int)level;
-(void)start;
-(void)pause;


@end
