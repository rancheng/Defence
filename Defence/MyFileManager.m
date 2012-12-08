//
//  MyFileManager.m
//  Defence
//
//  Created by Nick Liu on 12-12-8.
//
//

#import "MyFileManager.h"

@implementation MyFileManager

-(id)init
{
    fileManager = [NSFileManager defaultManager];
    return self;
}



///read from disk, do this only when it opens at first
-(BOOL) readFromDisk
{
    NSMutableArray *data;
    
    if ([data count]==NumInRank)
    {
        //update the data in record list
        for (int ix = 0; ix < NumInRank; ix++)
        {
            RankList[ix] = [data objectAtIndex:ix] ;
        }
        
        
        return true;
    }
    //
    //new a storage file and initialize it.
    return false;
}

//save to disk

-(BOOL)saveToDisk
{
    
    //NSMutableArray * dataSaver;
    
    for (int ix = 0; ix < NumInRank ; ix++)
    {
        
        [NSKeyedArchiver archiveRootObject: RankList[ix] toFile: @"myData.archive"];
        //[dataSaver addObject:   firstPlace[ix]];/////////how can I add this object without warnnings?
    }
    
    if(false)/////useless
    {
        NSLog(@"Save to file failde!");
        return false;
    };
    return true;
}


@end
