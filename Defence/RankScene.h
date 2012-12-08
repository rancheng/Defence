//
//  RankScene.h
//  Defence
//
//  Created by Nick Liu on 12-12-8.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "StartLayer.h"
#import "RankData.h"

////// records below

@interface RankScene : CCLayer
{
    
}



+(CCScene*)scene;
-(void)start:(id)sender;
-(void)connectToInterNet:(id)sender;
-(void)backToMain:(id)sender;

@end
