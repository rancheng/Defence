//
//  GameLayer.h
//  Defence
//
//  Created by  亓庆国 on 12-11-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TouchLayer.h"

@interface GameLayer : CCLayer {
    TouchLayer *touchLayer;
    
}
+(CCScene*)scene;
@end
