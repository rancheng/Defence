//
//  fightLayer.m
//  Defence
//
//  Created by  亓庆国 on 12-11-24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "fightLayer.h"
#import "WarShip.h"

@implementation FightLayer
static FightLayer* fl = NULL;
+(id) sharedFightLayer
{
    if (fl == NULL) {
        fl = [FightLayer new];
    }
    return  fl;
}

-(id)init
{
    if(self = [super init]);
    {
        for (int i = 0; i<10; i++) {
            
        WarShip * w = [[[WarShip alloc]init]autorelease];
        [self addChild:w z:10+i tag:i];
        }
        enermyShips = [[CCArray new]autorelease];
        playerLaser = [[CCArray new]autorelease];
    }
    return self;
}
@end
