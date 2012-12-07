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

//////compare
-(BOOL)isNewRecordHigher:(int)newScore
{
    if(newScore > score)
    {
        return true;
    }

    return false;
}


////
-(NSString* )getUserName
{
    
    return userName;
}



@end
