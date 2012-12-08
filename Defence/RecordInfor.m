//
//  RecordInfor.m
//  Defence
//
//  Created by Nick Liu on 12-12-7.
//
//

#import "RecordInfor.h"

@implementation RecordInfor


@synthesize isEmpty;
@synthesize score, time;
@synthesize userName;


////////set content
-(void) setScore:(NSString *)newUserName create: (int)newScore andTime:(int)completeTime
{
    score = newScore;
    time = completeTime;
    
    userName = newUserName;
}

//////initial method 
-(RecordInfor* )init
{
    self = [super init];
    
    score = 3;
    userName = @"Nobody";
    time = 0;
    isEmpty = true;
    
    return self;
}

///////clear method
-(void)clear
{
    score = 0;
    userName = @"Nobody";
    time = 0;
    isEmpty = true;
}


//////compare
-(BOOL)isNewRecordHigher:(int)newScore
{
    if(newScore > score)
    {
        return true;
    }

    return false;
}

-(void) encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInt32:score forKey:@"score"];
    [encoder encodeInt32: time forKey:@"time"];
    
    [encoder encodeBool:isEmpty forKey:@"isEmpty"];

    [encoder encodeObject:userName forKey:@"userName"];
}

-(id) initWithCoder: (NSCoder * )decoder
{
    score = [decoder decodeInt32ForKey:@"score"];
    time = [decoder decodeInt32ForKey:@"time"];
    
    isEmpty = [decoder decodeBoolForKey:@"isEmpty"];
    
    userName = [[decoder decodeObjectForKey:@"userName"] retain];
    
    
    return self;
}


@end
