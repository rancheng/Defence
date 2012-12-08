//
//  RankScene.m
//  Defence
//
//  Created by Nick Liu on 12-12-8.
//
//

#import "RankScene.h"

@implementation RankScene


+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	RankScene *layer = [RankScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


-(id) init
{
    if( (self=[super init]) ) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *background;
        if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
            background = [CCSprite spriteWithFile:@"Default.png"];
            background.rotation = 90;
        } else {
            background = [CCSprite spriteWithFile:@"mainBackground.jpg"];
        }
        background.position = ccp(size.width/2, size.height/2);
        [self addChild: background];
        
        
        ///head title
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Accomplishment List" fontName:@"Marker Felt" fontSize:64];
        
		label.position =  ccp( size.width /2 , size.height/2 + 300 );
		[self addChild: label];
		
        
        //head line
        CCLabelTTF * name = [CCLabelTTF labelWithString:@"Name" fontName:@"Marker Felt" fontSize: 48];
        name.position = ccp(200, size.height/2 +150);
        [self addChild: name];
        
        CCLabelTTF * score = [CCLabelTTF labelWithString:@"Score" fontName:@"Marker Felt" fontSize: 48];
        score.position = ccp( size.width/2, size.height/2 +150);
        [self addChild: score];
        
        CCLabelTTF * finishTime = [CCLabelTTF labelWithString:@"finishTime" fontName:@"Marker Felt" fontSize: 48];
        finishTime.position = ccp(size.width- 300, size.height/2 +150);
        [self addChild: finishTime];
       
        ///data below
        
        for (int ix = 0; ix < NumInRank; ix++)
        {
            
            NSString * nameString = [[RankData getRankList: ix] userName];
            NSString * highScore = [NSString stringWithFormat:@"%i",[[RankData getRankList: ix] score]];//itoa
            NSString * newTime = [NSString stringWithFormat:@"%i",[[RankData getRankList: ix] time]];
            
           CCLabelTTF * nameInfor = [CCLabelTTF labelWithString: nameString fontName:@"Marker Felt" fontSize: 36];
            nameInfor.position = ccp(200, size.height/2 -48 * (ix -1));
            [self addChild: nameInfor];
        
            CCLabelTTF * scoreInfor = [CCLabelTTF labelWithString: highScore fontName:@"Marker Felt" fontSize: 36];
            scoreInfor.position = ccp( size.width/2, size.height/2 - 48 * (ix- 1));
            [self addChild: scoreInfor];
            
            CCLabelTTF * timeInfor = [CCLabelTTF labelWithString: newTime fontName:@"Marker Felt" fontSize: 36];
            timeInfor.position = ccp(size.width- 300, size.height/2 - 48 * (ix- 1));
            [self addChild: timeInfor];
         
        }
        
        
        ///menu about back to main and so on....
		[CCMenuItemFont setFontSize:28];
		
        
        CCMenuItem *backToMain = [CCMenuItemFont itemWithString:@"Main Menu" target:self selector:@selector(backToMain:)];
		CCMenu *menu = [CCMenu menuWithItems:backToMain, nil];
		
        //something left unused just for more extensions.
        
        
        
		[menu alignItemsVerticallyWithPadding:20];
		[menu setPosition:ccp( 100, 100)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
	}
	return self;
}


-(void) start:(id)sender
{
    NSLog(@"hahahahah");
}
-(void) connectToInterNet:(id)sender
{
    NSLog(@"ehehheheheh");
}
-(void) backToMain:(id)sender
{
    NSLog(@"yayayayayay");
    [[CCDirector sharedDirector] replaceScene:[StartLayer scene]];
}


@end
