//
//  HelloWorldLayer.h
//  Defence
//
//  Created by  亓庆国 on 12-11-10.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    float lastScale;
    CGPoint lastPosition;
    CCSprite* backGround;
    CGSize size;
    CGRect allowRect;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
//+(CCScene *) scene;
-(CGRect) rectOfPositionAllow;

@end
