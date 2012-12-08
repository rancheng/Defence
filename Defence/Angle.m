//
//  Angle.m
//  Defence
//
//  Created by bryce on 12-12-3.
//
//

#import "Angle.h"


@implementation Angle

-(id) init
{
    if (self = [super init]) {
        angle  = 0;
    }
    return self;
}

-(id) initWithFloat:(float)f
{
    if (self = [super init]) {
        angle = f;
    }
    return self;
}
-(void) add:(float)x
{
    angle += x;
    if(angle > 180)
        angle = angle - 360;
}
-(void) sub:(float)x
{
    angle -= x;
    if (angle <= -180) {
        angle += 360;
    }
}

//return value 0 is in same dir
// -1 is anti clock dir
// 1 is clock dir
-(int ) compare:(double) other  //other should within 0 to 360
{
    if (other <= 180) {
        if (angle == other)
            return 0;
        if (angle > other && angle <= other + 180)
            return  1;
        else
            return  -1;
        
    }
    else{
        if (angle == other)
            return 0;
        if (angle > other - 180 && angle < other)
            return -1;
        else
            return 1;
    }
}
@synthesize angle;
@end

