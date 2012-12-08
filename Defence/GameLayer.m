//
//  GameLayer.m
//  Defence
//     游戏实现类，
//     集成TouchLayer，ShipsLayer于一体，
//     把从touchLayer得到的信息传递给ShipsLayer，
//     实现游戏的统计功能
//  Created by  亓庆国 on 12-11-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"
#import "fightLayer.h"
#import "WarShip.h"
#import "CCParticleExamples.h"
#import "TouchLayer.h"
#import "ShipsLayer.h"
@implementation GameLayer
static GameLayer* sharedGameLayer = NULL;
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	 sharedGameLayer = [GameLayer node];
	
	// add layer as a child to scene
	[scene addChild: sharedGameLayer];
	
    
	// return the scene
	return scene;
}

//因为gameLayer是先于调用此方法的类创建，所以if应该永远是假的
+(GameLayer*)shardGameLayer
{
    if (sharedGameLayer == NULL) {
        sharedGameLayer  =  [GameLayer node];
        CCLOG(@"shardGamelayer NULL error!!");
    }
    return sharedGameLayer;
}
-(CGSize)mapSize
{
    //我先用这个代替，程冉到时候改成自己想要的
    return [[CCDirector sharedDirector]winSize];
}
-(id)init
{
    if(self = [super init])
    {
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
        background.position = ccp(size.width/2, size.height/2);
       [self addChild: background];
    
        ccColor3B color;
        color.r = 0;color.g = 0; color.b = 0;
    
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"GameLayer" fontName:@"Marker Felt" fontSize:30];
        label.color = color;
        label.position = CGPointMake(size.width/2, size.height/2+100);
        [self addChild:label];
        
        //战斗层
        [self addChild:[FightLayer sharedFightLayer]];
        
        //ships
        ShipsLayer * ships = [[ShipsLayer alloc]init];
        EnemyNumberDef* enemy = [[EnemyNumberDef alloc]init];
        enemy.numOfCheng = 2;
        enemy.numOfXia = 2;
        enemy.numOfYang = 2;
        enemy.numOfQi = 2;
        enemy.numOfLiu = 2;
        [ships setEnemyNumber:enemy];
        [self addChild:ships];   //only for update run
        

        
        //touch
        touchLayer = [TouchLayer node];
        [self addChild:touchLayer];
        touchLayer.tag = 2;
        
        
        
        //particle
        CCParticleFlower *p = [[[CCParticleFlower alloc]init]autorelease];  //好看
        [self addChild:p];
        
        
                              
    }
    return  self;
}
@end
