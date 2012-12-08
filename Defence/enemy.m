//
//  Ship.m
//  Defence
//
//  Created by  亓庆国 on 12-11-24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
#import "Enemy.h"

const int ERROR_ARRANGE = 20;  //移动误差范围；
const float BEAT_ARRAGE = 0.0001;
@implementation Enermy
-(id)init
{
    if(self = [super init] )
    {
        [self initWithLife:1 WithPos:ccp(0, 0)];
        
    }
    return self;
}
-(id) initWithLife:(int)h
{
    if(self = [super init])
    {
        [self initWithLife:h WithPos:ccp(0, 0)];
    }
    return self;
}
-(id) initWithLife:(int)h WithPos:(CGPoint)p
{
    if(h<0)
        h = 1;
    if(self = [super init])
    {
        pos_     = p;
        health_ = h;
        savedHealth_ = h;
        face_   = [[Angle alloc]init];
        sightDegree_ = 180;
        sightLength_ = 50;
        state_ = STATE_IDLE;
        savedSpeed =  speed = 3;
        turnSpeed = 1;
        winSize = [[CCDirector sharedDirector]winSize];
        divideSize.width = winSize.width / 3;
        divideSize.height = winSize.height /3;
    }
    return self;
}
-(id) initWithLife:(int)h WithPos:(CGPoint)p WithTarget:(CGPoint)t
{
    if(self = [super init])
    {
        [self initWithLife:h WithPos:p];
        target_ = t;
    }
    return self;
}
//控制生死
-(void) beHitWithdamge:(int)damage
{
    health_ = health_ - damage;
    if(health_ < 0)
    {
        health_ = 0;
        state_ = STATE_DEAD;
    }
}
-(void) beHitWithdamage:(int)damage andBeatback:(Vec2)dir
{
    [self beHitWithdamge:damage];
    outStrength = dir;
    haveOuterStrength  =  YES;
}
-(BOOL)isAlive
{
    return YES;
}
-(void)kill
{
    health_ = 0;
    state_ = STATE_DEAD;
}
-(void) revive
{
    health_ = savedHealth_;
    state_ = STATE_STILL;
}
//当设置了速度之后同样要赋值给svaedSpeed，因为从减速状态中回复过来的时候需要知道原来是什么样子
-(void) setSpeed:(int)s
{
    speed = s;
    savedSpeed = s;
}
-(int ) getSpeed
{
    return speed;
}
-(void) resetSpeed
{
    speed = savedSpeed;
}

//当前是idle状态时，从屏幕的
//0  1  0
//1  2  1    中随机选择一个位置
//0  1  0
-(void) makeRandromTarget
{
    srand(time(NULL));
    float  x  = CCRANDOM_0_1();
    float  y  = CCRANDOM_0_1();
    
    int xx = x*4;
    int yy = y*4;
    
    float posx,posy;
    
    switch (xx) {
        case 0:
            posx = divideSize.width*x;
            break;
        case 1:
        case 2:
            posx = divideSize.width *(1 + x) ;
            break;
        case 3:
            posx = divideSize.width *(2 + x);
            break;
        default:
            CCLOG(@"target compute error %d",xx);
            posx = 0;
            break;
    }
    
    if(xx == 0)
    {
        posy = divideSize.height * (1+y);
    }
    else if(xx == 3)
    {
        posy = divideSize.height * (1+y);
    }
    else
    {
        switch (yy){
            case 0:
                posy = divideSize.height * y;
                break;
            case 1:
            case 2:
                posy = divideSize.height * (1+y);
                break;
            case 3:
                posy = divideSize.height * (2+y);
                break;
            default:
                posy = 0;
                CCLOG(@"target compute error %d",yy);
                break;
        }
    }
    target_ = ccp(posx, posy);
}
-(void) moveToTarget
{
    float h = target_.y-pos_.y;
    float w = target_.x - pos_.x;
    targetAngle  = atan2(h, w);  //-pi~pi
    targetAngle  = 57.295779f * targetAngle;
    
    //转向
    float tmp = targetAngle - face_.angle;
    if( tmp > turnSpeed || tmp < -turnSpeed)  //不加这一句会有抖动的现象，可以用来模拟有腿的生物
    {
        int _rotateToWhichDir = [face_ compare:targetAngle];
        if (_rotateToWhichDir > 0) {
            [face_ sub:turnSpeed];
        }
        else if(_rotateToWhichDir < 0)
            [face_ add:turnSpeed];
    }
    
    //急转弯加速
    if(tmp > 90 || tmp < -90)
    {
        turnSpeed = 8;
    }
    else
    {
        turnSpeed = 1;
    }
    //设置新的位置
    float vx = cos(kmDegreesToRadians( face_.angle) )*speed;
    float vy = sin(kmDegreesToRadians( face_.angle) )*speed;
    
    //如果受外力影响的话，需要计算位置的偏移
    if (haveOuterStrength) {
        vx += outStrength.x_*0.25;
        vy += outStrength.y_*0.25;
        outStrength.x_ *= 0.75;
        outStrength.y_ *= 0.75;
        if (outStrength.x_ > -BEAT_ARRAGE && outStrength.x_ < BEAT_ARRAGE
            && outStrength.y_ > -BEAT_ARRAGE && outStrength.y_ < BEAT_ARRAGE)
            haveOuterStrength = NO;
    }
    pos_ = ccp(pos_.x + vx, pos_.y + vy);
}
-(void) move
{
    if (state_ == STATE_IDLE)
    {
        if(pos_.x <= target_.x+ERROR_ARRANGE && pos_.x >= target_.x -ERROR_ARRANGE
            && pos_.y <= target_.y +ERROR_ARRANGE && pos_.y >=target_.y-ERROR_ARRANGE)
        {
            [self makeRandromTarget];
        }//endif
        
        [self moveToTarget ];
    }
    //有目标，可以是自己的，也可以是小队中确定的
    else if(state_ == STATE_RUNNING)  
    {
        if(pos_.x >= target_.x+ERROR_ARRANGE && pos_.x <= target_.x -ERROR_ARRANGE
           && pos_.y >= target_.y +ERROR_ARRANGE && pos_.y <=target_.y-ERROR_ARRANGE)
        {
             [self moveToTarget];
        }
    }
    else if(state_ == STATE_STOPED)
    {
        //this time speed should be zero
        NSAssert(speed == 0, @"in stop mod speed should be 0");
        [self moveToTarget];
    }
}
//控制行为
@synthesize health_,savedHealth_ ,pos_,sightDegree_,sightLength_,face_,state_,target_;
@end