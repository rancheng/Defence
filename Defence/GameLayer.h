//
//  GameLayer.h
//  Defence
//  
//  Created by  亓庆国 on 12-11-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TouchLayer.h"

@interface GameLayer : CCLayer {
    TouchLayer* touchLayer;
    CCSprite *mainship;
}
+(CCScene*)scene;
+(GameLayer*)shardGameLayer;


//以下信息由touchLayer通知GameLayer：先做这么多，后续再添加
-(void)oneFengerDrawLine:(CGPoint)start:(CGPoint)end;
-(void)twoFengerDrawLine:(CGPoint)start:(CGPoint)end;
-(void)oneFengerDrawCycle:(CGPoint)cirlceCenter:(int)radius; //我忘了手指，圆心，半径怎么写了，到时候程冉改回来>_<
-(void)twoFengerDrawCycle:(CGPoint)circleCenter:(int)radius;

//
-(CGSize) mapSize;

@end
