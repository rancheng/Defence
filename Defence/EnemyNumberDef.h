//
//  EnemyNumberDef.h
//  Defence
//
//  Created by bryce on 12-12-7.
//
//

#import <Foundation/Foundation.h>

@interface EnemyNumberDef : NSObject
{
    
}
@property int numOfCheng;
@property int numOfXia;
@property int numOfYang;
@property int numOfQi;
@property int numOfLiu;
-(id) init;
-(int)equal:(EnemyNumberDef*)rhs;
-(void)set:(EnemyNumberDef*)rhs;
@end
