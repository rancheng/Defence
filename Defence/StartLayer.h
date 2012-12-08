//
//  StartScene.h
//  Defence
//  功能：主菜单
//   开始游戏／继续游戏
//   排行榜
//   选项
//   说明
//   关于我们
//  Created by  亓庆国 on 12-11-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface StartLayer : CCLayer 
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(void)start:(id)sender;
-(void)option:(id)sender;
-(void)aboutUs:(id)sender;
-(void)exitGame:(id)sender;
@end