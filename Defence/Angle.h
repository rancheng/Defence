//
//  Angle.h
//  Defence
//
//  Created by bryce on 12-12-3.
//
//

#import <Foundation/Foundation.h>

@interface Angle:NSObject
{
    float angle;
}
@property float angle;
-(id)init;
-(id) initWithFloat:(float)f;
-(void) setAngle:(float) f;
-(void) add:(float) x;
-(void) sub:(float) x;
-(int ) compare:(double)other;
@end
