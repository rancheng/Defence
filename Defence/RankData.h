//
//  RankData.h
//  Defence
//
//  Created by Nick Liu on 12-12-8.
//
//

#import <Foundation/Foundation.h>
#import "RecordInfor.h"

///// the total num of the ranklist elems.
static const int NumInRank = 5;


////// records below

static RecordInfor * RankList[NumInRank];////public leads to failed

@interface RankData : NSObject
{
   
    ////data here
}



+(int) getStoredRecords;

+(int) initialize;

///delete all the records in list
+(void) clear;

/////  give the function a final mark when game is over,
///// the function will return if it is good enough to be in ranklist.
/////  the num returns 0, when it is not good enough.
/////  otherwise it returns the position it is supposed to be inserted in.
+(int) judgeRecord: (int) marks;


////// add a record by this way
////// judge record is usually its first parameter
+(int) addRecord: (int) marks with: (int) position :(RecordInfor *) information;


+(void) loadRecord;
+(void) saveRecord;

////// get the rank list
+(RecordInfor *) getRankList: (int) ix;



@end
