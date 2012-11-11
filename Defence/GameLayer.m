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


@implementation GameLayer
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id)init
{
    if(self = [super init])
    {
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"GameLayer" fontName:@"Marker Felt" fontSize:64];
        CGSize size = [[CCDirector sharedDirector]winSize];
        label.position = CGPointMake(size.width/2, size.height/2+100);
        
        [self addChild:label];
        
        touchLayer = [[TouchLayer alloc]init ];
        [self addChild:touchLayer];
        touchLayer.tag = 2;
                             
    }
    return  self;
}
-(void)dealloc
{
    [touchLayer release];
    [super dealloc];
}
@end
