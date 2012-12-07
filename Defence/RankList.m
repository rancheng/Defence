//
//  RankList.m
//  Defence
//
//  Created by Nick Liu on 12-12-7.
//
//
#import "AppDelegate.h"
#import "RankList.h"


@implementation RankList

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	RankList *layer = [RankList node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

+(bool)judgeRecord:(int)marks
{
    return true;
}

-(RecordInfor *)getRankList
{
    return firstPlace[0];
}

-(id) init
{
    if( (self=[super init]) ) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        /////data to be displayed
        
        
        
        for (int ix = 0; ix < 5; ix++)
        {
            firstPlace[ix] = [[RecordInfor alloc] init];
            
            //set score from the storage disk.
            //firstPlace[ix] setScore:<#(NSString *)#> create:<#(int)#> andTime:<#(int)#>
        }
        
        
        /////
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
        
        for (int ix = 0; ix < 5; ix++)
        {
            
            NSString * nameString = [firstPlace[ix] getUserName];
            NSString * highScore = [NSString stringWithFormat:@"%i",[firstPlace[ix] score]];//itoa
            NSString * newTime = [NSString stringWithFormat:@"%i",[firstPlace[ix] time]];
            
            CCLabelTTF * name = [CCLabelTTF labelWithString: nameString fontName:@"Marker Felt" fontSize: 36];
            name.position = ccp(200, size.height/2 -48 * (ix -1));
            [self addChild: name];
            
            CCLabelTTF * score = [CCLabelTTF labelWithString:highScore fontName:@"Marker Felt" fontSize: 36];
            score.position = ccp( size.width/2, size.height/2 - 48 * (ix- 1));
            [self addChild: score];
            
            CCLabelTTF * finishTime = [CCLabelTTF labelWithString:newTime fontName:@"Marker Felt" fontSize: 36];
            finishTime.position = ccp(size.width- 300, size.height/2 - 48 * (ix- 1));
            [self addChild: finishTime];
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



//save to disk

-(BOOL)saveToDisk
{
    if(true//success to save
       )
    {
        return true;
    }
    return false;
}

@end
