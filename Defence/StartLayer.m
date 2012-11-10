//
//  StartScene.m
//  Defence
//
//  Created by  亓庆国 on 12-11-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "StartLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - StartLayer

// HelloWorldLayer implementation
@implementation StartLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StartLayer *layer = [StartLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
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
        
        
        
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Earth Defence" fontName:@"Marker Felt" fontSize:64];

		label.position =  ccp( size.width /2 , size.height/2 + 200 );
		[self addChild: label];
		
        
        
		[CCMenuItemFont setFontSize:28];
		
		// Achievement Menu Item using blocks
		CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"Achievements" block:^(id sender) {
			
			
			GKAchievementViewController *achivementViewController = [[GKAchievementViewController alloc] init];
			achivementViewController.achievementDelegate = self;
			
			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
			
			[[app navController] presentModalViewController:achivementViewController animated:YES];
			
			[achivementViewController release];
		}
									   ];
        
		// Leaderboard Menu Item using blocks
		CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Leaderboard" block:^(id sender) {
			
			
			GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
			leaderboardViewController.leaderboardDelegate = self;
			
			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
			
			[[app navController] presentModalViewController:leaderboardViewController animated:YES];
			
			[leaderboardViewController release];
		}
									   ];
		CCMenuItem *start = [CCMenuItemFont itemWithString:@"start" target:self selector:@selector(start:)];
        CCMenuItem *option = [CCMenuItemFont itemWithString:@"option" target:self selector:@selector(option:)];
        CCMenuItem *aboutUs = [CCMenuItemFont itemWithString:@"about us" target:self selector:@selector(aboutUs:)];
		CCMenu *menu = [CCMenu menuWithItems:start,option,aboutUs,itemAchievement, itemLeaderboard, nil];
		
		[menu alignItemsVerticallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
-(void) start:(id)sender
{
    NSLog(@"start");
}
-(void) option:(id)sender
{
    NSLog(@"option");
}
-(void) aboutUs:(id)sender
{
    NSLog(@"aboutUs");
}
@end
