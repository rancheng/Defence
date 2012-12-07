//
//  RankList.h
//  Defence
//
//  Created by Nick Liu on 12-12-7.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "StartLayer.h"
#import "RecordInfor.h"
//@class RecordInfor;

@interface RankList : CCLayer
{
    RecordInfor *  firstPlace[5];
    

    
}
+(bool) judgeRecord: (int) marks;

-(RecordInfor *) getRankList;

+(CCScene*)scene;
-(void)start:(id)sender;
-(void)connectToInterNet:(id)sender;
-(void)backToMain:(id)sender;

-(BOOL) saveToDisk;

@end
