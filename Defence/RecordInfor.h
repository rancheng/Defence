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


-(void) clear;

-(void) setScore:(NSString* )newUserName create: (int)newScore andTime:(int) completeTime;

-(void) encodeWithCoder:(NSCoder * )encoder;
-(void) initWithCoder:(NSCoder * )decoder;

-(BOOL) isNewRecordHigher: (int)newScore;

@end
