//
//  TouchLayer.m
//  Defence
//  功能：
//      接受用户的输入，
//      处理用户的各种手势，
//      给用户反馈以绚丽的粒子效果
//      同时通知GameLayer，用户到底想要做什么（在什么位置，向什么方向，发射什么炮弹）
//
//      玩家的动作可以有：
//        单指划一下->          寒冰箭
//        单指划一下，停一小会->   火球术
//        双指划一下->         奥术冲击
//        双指划一下，停一小会-> 奥术飞弹
//        三个手指合拢->        冰霜新星
//        三个手指分开->        冲击波
//
//  Created by  亓庆国 on 12-11-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchLayer.h"
#import "CCParticleExamples.h"
#import "MyParticle.h"
@implementation TouchLayer
-(id)init
{
    if(self = [super init])
    {
        ccColor3B color;
        color.r = 0;color.g = 0; color.b = 0;
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"touch me" fontName:@"Marker Felt"     fontSize:50];
        CGSize size = [[CCDirector sharedDirector] winSize];
        label.color = color;
        label.position = CGPointMake(size.width/2, size.height/2);
        [self addChild:label];
        label.tag = 1;
        
        
        t = [[[CCParticleMeteor alloc]init]autorelease];
        t.gravity = ccp(90, -200);
        
        [self addChild:t];
        self.isTouchEnabled = YES;
    }
    return self;
}

-(CGPoint) locationFromTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:[touch view]];
    return [[CCDirector sharedDirector]convertToGL:touchLocation];
}
-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint where = [self locationFromTouches:touches];
    lastLocation = where;
//    MyParticle * particle = [[[MyParticle alloc]init]autorelease];
//    particle.positionType = kCCPositionTypeFree;
//   particle.position = where;
//    [self addChild:particle z:1];
    
    t.position = where;
}
-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
{
    CGPoint where = [self locationFromTouches:touches];
    CGPoint moveTo = ccpSub(where, lastLocation);
    moveTo = ccpMult(moveTo, 0.1);
 //   CCLabelTTF *label = (CCLabelTTF*)[self getChildByTag:1];
 //   label.position = ccpAdd(label.position, moveTo);
   // CCParticleSystem* particle = [CCParticleSystemQuad particleWithFile:@"pp.plist"];
// MyParticle * particle = [[[MyParticle  alloc]init]autorelease];
    
 //   CCParticleSmoke *particle = [[[CCParticleSmoke alloc]init]autorelease];
 //   particle.positionType = kCCPositionTypeFree;
 //   particle.position = where;
  //  [self addChild:particle z:1];
    
    t.position = where;
}
@end
