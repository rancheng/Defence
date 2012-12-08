//
//  RankData.m
//  Defence
//
//  Created by Nick Liu on 12-12-8.
//
//

#import "RankData.h"

@implementation RankData

///// delete all the items in ranklist
+(void)clear
{
    for (int ix = 0;ix < NumInRank;ix++)
    {
        [RankList[ix] clear];
    }
}

////// init

+(int)initialize
{
    for (int ix = 0; ix < NumInRank; ix++) {
        
        RankList[ix] = [[RecordInfor alloc] init];
        //////////I hate bugs!!!
        
    }
    return 0;
}




+(int)getStoredRecords
{
    //////get the stored records if there is ,
    //////else create a new one.
    
    /////usually used at the initialization of the program.
        
    return 0;
}


+(int)judgeRecord:(int)marks
{
    int countNum = 0;
    for (int ix = NumInRank- 1; ix >= 0; ix--) {
        BOOL myFlag = false;
        myFlag = [ RankList[ix] isNewRecordHigher:marks];
        
        if(myFlag)
        {
            countNum++;
        }
        else{
            break;
        }
    }
    
    return countNum;///if n = 0, it failed to be a new record.
}

+(int)addRecord:(int)marks with:(int)position:(RecordInfor *) information
{
    int iNumber = NumInRank -1;
    ///judge if the index is available
    if(position > NumInRank ||position < 1)
    {
        return -1;
    }
    
    //////what does position means?
    position = NumInRank - position;
    
    //remove the last one.
    ///move others if there's a neccessary.
    for (int ix = NumInRank -1 ; ix > position; ix--) {
        
        RankList[ix] = RankList[ix-1];
        iNumber = ix -1;
    }
    
    [RankList[iNumber] setScore:[information userName] create:[information score] andTime: [information time]];
    
    return 0;
}

+(RecordInfor* )getRankList: (int) ix
{
    return RankList[ix];
}

////save and load
+ (void)loadRecord
{
 //////if there is a record file , read it.
    
    /////else create a new store file with nothing.
    
    
    
}
+(void)saveRecord
{
    
}



@end
