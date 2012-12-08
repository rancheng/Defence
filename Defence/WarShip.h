//
//  WarShip.h
//  Defence
//     敌人飞船类
//     要有各种各样的敌人飞船，
//     相同之处： 但是子弹不一定相同。目的地都是玩家的母舰。都有自己的生命值，生命为零时爆炸。
//              都可以告诉它怎么绘制自己。遇到玩家的各种攻击时要做出反应。
//              各种属性需要在后期就行大量的调整，所以设计的飞船要便于更改创建时的属性。
//     不同：动画不同，智能不同（寻路，躲避），属性不同（对某一类的攻击具有抗性），
//
//
//  Created by  亓庆国 on 12-11-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Enemy.h"

///////////////////////////////////////////

//基类
@interface WarShip : CCNode
{
    CCSprite* image;
 // CCSprite* shoot ;
//  CCSprite* faint;    //眩晕时要不要有动画呢？
//    CCSprite* bang;
}

//需要在shipLayer中直接操控模型
@property (assign, readwrite ) Enermy* enemy;

-(id) initWithFile:(NSString *)file;
-(void) startIdle;
-(void) endIdleToOtherState:(int)s;
-(void) posUpdate:(ccTime)dt;
-(void) move;
@end


/////////////////////////////////////////////
@interface Cheng : WarShip {
    
}
-(id)init;
@end
////////////////////////////////////////////
@interface Xia : WarShip  {
    
}
-(id)init;
@end
////////////////////////////////////////////
@interface Yang : WarShip {
    
}
-(id)init;
@end
////////////////////////////////////////////
@interface Qi : WarShip {
    
}
-(id)init;
@end
////////////////////////////////////////////
@interface Liu : WarShip {
    
}
-(id)init;
@end
////////////////////////////////////////////
