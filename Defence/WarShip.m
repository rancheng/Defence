//
//  WarShip.m
//  Defence
//    
//  Created by  亓庆国 on 12-11-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "WarShip.h"
#import "fightLayer.h"

@implementation WarShip
-(id)initWithFile:(NSString *)file
{
    if(self = [super init])
    {
        enemy = [[Enermy alloc]init];
        
        image = [CCSprite spriteWithFile:file];
//        if(image != NULL)
//            [self addChild:image];
        [[FightLayer sharedFightLayer]addChild:image];
    }
    return self;
}
-(void) startIdle
{
    if (enemy.state_ != STATE_IDLE) {
        enemy.state_ = STATE_IDLE;
         [self schedule:@selector(posUpdate:) interval:0.04];
    }
}
-(void) endIdleToOtherState:(int)s
{
    if ( s > MIN_STATE && s < MAX_STATE && s!=STATE_IDLE ) {
        enemy.state_ = s;
        [self unschedule:@selector(posUpdate:)];
    }
}
-(void) posUpdate:(ccTime)dt
{
    if (enemy.state_ == STATE_IDLE) {
    
        [enemy move];
        image.position = enemy.pos_;
        image.rotation = -enemy.face_.angle;
    }
}
-(void) move
{
    [enemy move];
    image.position = enemy.pos_;
    image.rotation = -enemy.face_.angle;
}

@synthesize enemy;
@end
//////////////////////////////////////////////////////
@implementation Cheng

-(id)init
{
    if (self = [super initWithFile:@"ship1.png"]) {
        
    }
    return  self;
}

@end
///////////////////////////////////////////////////////
@implementation Xia

-(id)init
{
    if (self = [super initWithFile:@"ship2.png"]) {
        
    }
    return  self;
}
@end
///////////////////////////////////////////////////////
@implementation Yang

-(id)init
{
    if (self = [super initWithFile:@"ship3.png"]) {
        
    }
    return  self;
}

@end
///////////////////////////////////////////////////////
@implementation Qi

-(id)init
{
    if (self = [super initWithFile:@"ship4.png"]) {
        
    }
    return  self;
}

@end
///////////////////////////////////////////////////////
@implementation Liu

-(id)init
{
    if (self = [super initWithFile:@"enermyShip3.png"]) {
        
    }
    return  self;
}

@end