//
//  MyFileManager.h
//  Defence
//
//  Created by Nick Liu on 12-12-8.
//
//

#import <Foundation/Foundation.h>
#import "RankData.h"

static NSString * defaultPath = @"aaa";

@interface MyFileManager : NSObject

{
    NSFileManager * fileManager;
    
}

-(BOOL) readFromDisk;
-(BOOL) saveToDisk;


@end
