//
//  fightLayer.h
//  Defence
//  因为分模块化写代码，所以建立这么一个大家都可以用的单件类
//  在这里面进行战斗
//  Created by  亓庆国 on 12-11-24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface FightLayer : CCLayer {
    
    CCArray* enermyShips;
    CCArray* playerLaser;
    //还应该有要保护的那个精灵；
}
-(id)init;
+(id)sharedFightLayer;
@end
  