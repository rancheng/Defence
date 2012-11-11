//
//  TouchLayer.m
//  Defence
//  功能：
//      接受用户的输入，
//      处理用户的各种手势，
//      给用户反馈以绚丽的粒子效果
//      同时通知GameLayer，用户到底想要做什么（在什么位置，向什么方向，发射什么炮弹）
//  Created by  亓庆国 on 12-11-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchLayer.h"


@implementation TouchLayer
-(id)init
{
    if(self = [super init])
    {
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt"     fontSize:64];
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        label.position = CGPointMake(size.width/2, size.height/2);
        [self addChild:label];
        label.tag = 1;			
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
    
    CCParticleSystem* particle = [CCParticleSystemQuad particleWithFile:@"pp.plist"];
    particle.positionType = kCCPositionTypeFree;
    particle.position = where;
    [self addChild:particle z:1];
}
-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
{
    CGPoint where = [self locationFromTouches:touches];
    
    CCParticleSystem* particle = [CCParticleSystemQuad particleWithFile:@"pp.plist"];
    particle.positionType = kCCPositionTypeFree;
    particle.position = where;
    [self addChild:particle z:1];
}
@end
