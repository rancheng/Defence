//
//  Ship.h
//  Defence
//
//  Created by  亓庆国 on 12-11-24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Define.h"
#import "Angle.h"

enum EnemyStates
{
    MIN_STATE,
    STATE_STILL,     //静止
    STATE_IDLE,      //闲逛
    STATE_RUNNING,  //发现目标，跑向目标
    STATE_STOPED,   //还清醒
    STATE_FAINT,    //昏迷了
    STATE_DEAD,     //死了
    MAX_STATE
};


@interface Enermy : NSObject {
    
    int savedSpeed;
    int speed;
    int turnSpeed;
    Vec2 outStrength;          //外界作用力
    BOOL haveOuterStrength;  //当前是否受外力影响
    float targetAngle;  
    CGSize divideSize;
    CGSize winSize;
}
//朝向
@property (readonly) Angle* face_;
//当前位置
@property (readwrite) CGPoint pos_;
//视野范围
@property (readwrite) int sightDegree_;
//视距
@property (readwrite) int sightLength_;
//状态
@property (readwrite) int state_;
//生命值
@property (readwrite) int health_;
//存储原始生命值
@property (readwrite) int savedHealth_;
//目的地
@property (readwrite) CGPoint target_;


-(id) init;               //默认生命值1
-(id) initWithLife:(int) h;
-(id) initWithLife:(int)h WithPos:(CGPoint) p;
-(id) initWithLife:(int)h WithPos:(CGPoint) p WithTarget:(CGPoint) t;


-(void) beHitWithdamge:(int) damage;
-(void) beHitWithdamage:(int)damage andBeatback:(Vec2)dir;


-(BOOL) isAlive;
-(void) kill;      //秒杀！！！

-(void) setSpeed:(int )s;
-(int)  getSpeed;
-(void) resetSpeed;
-(void) revive;

-(void) move;


@end
