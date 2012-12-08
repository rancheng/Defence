//
//  EnemyNumberDef.m
//  Defence
//
//  Created by bryce on 12-12-7.
//
//

#import "EnemyNumberDef.h"

@implementation EnemyNumberDef
-(id)init
{
    if(self = [super init])
    {
        numOfCheng =0;
        numOfXia   = 0;
        numOfYang  = 0;
        numOfQi    = 0;
        numOfLiu   = 0;
    }
    return self;
}
-(int)equal:(EnemyNumberDef *)rhs
{
    if(numOfCheng != rhs.numOfCheng)
        return 1;
    if (numOfXia != rhs.numOfXia)
        return 2;
    if(numOfYang != rhs.numOfYang)
        return 3;
    if(numOfQi != rhs.numOfQi)
        return 4;
    if(numOfLiu != rhs.numOfLiu)
        return 5;
    return 0;
}
-(void)set:(EnemyNumberDef *)rhs
{
    numOfCheng = rhs.numOfCheng;
    numOfXia = rhs.numOfXia;
    numOfYang = rhs.numOfYang;
    numOfQi = rhs.numOfQi;
    numOfLiu = rhs.numOfLiu;
}
@synthesize numOfCheng,numOfLiu,numOfXia,numOfYang,numOfQi;
@end
