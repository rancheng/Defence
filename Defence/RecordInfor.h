//
//  RecordInfor.h
//  Defence
//
//  Created by Nick Liu on 12-12-7.
//
//

#import <Foundation/Foundation.h>

@interface RecordInfor : NSObject
{
    NSString * userName;
    
    int score;
    
    int time;
    
    bool isEmpty;
}


-(RecordInfor* )init;

@property int score, time;
@property bool isEmpty;
@property NSString* userName;

-(NSString* ) getUserName;

-(void) setScore:(NSString* )newUserName create: (int)newScore andTime:(int) completeTime;

-(BOOL) isNewRecordHigher: (int)newScore;

@end
