//
//  ShipsLayer.m
//  Defence
//  处理外星飞船的生成
//  Created by  亓庆国 on 12-11-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ShipsLayer.h"
#import "WarShip.h"

@implementation ShipsLayer

-(id)init
{
    if(self = [super init ])
    {
        enemyDef = [[EnemyNumberDef alloc ]init];
        hardLevel = 0;
        enemyArray = [[CCArray alloc]init];
        
       [self scheduleUpdate];
    }
    return self;
}

-(void)setEnemyNumber:(EnemyNumberDef *)set
{
    [enemyDef set:set];
    if([enemyArray count] == 0)
    {
        for(int j=0;j<enemyDef.numOfCheng;j++)
            [enemyArray addObject:[[Cheng alloc]init]];
        for(int j=0;j<enemyDef.numOfXia;j++)
            [enemyArray addObject:[[Xia alloc]init]];
        for(int j=0;j<enemyDef.numOfYang;j++)
            [enemyArray addObject:[[Yang alloc]init]];
        for(int j=0;j<enemyDef.numOfQi;j++)
            [enemyArray addObject:[[Qi alloc]init]];
        for(int j=0;j<enemyDef.numOfLiu;j++)
            [enemyArray addObject:[[Liu alloc]init]];
        for(int j=0;j<enemyArray.count;j++)
           ( (WarShip*)[enemyArray accessibilityElementAtIndex:j]).enemy.state_ = STATE_IDLE;
    }
}

-(void)setHardLevel:(int)level
{
    hardLevel   =    level;
}
-(void)update:(ccTime)dt
{
    for(int j=0;j<enemyArray.count;j++)
        [( (WarShip*)[enemyArray objectAtIndex:j]) move];
}
/////////////////////////////////////////////////
-(void)start
{
    //周期性调用draw
}
-(void)pause
{
    //停止调用draw
}
-(void)restart
{
}
@end
