//
//  StartScene.m
//  Defence
//
//  Created by  亓庆国 on 12-11-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "StartLayer.h"
#import "GameLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - StartLayer

// StartLayer implementation
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
            background = [CCSprite spriteWithFile:@"blank.jpg"];
        }
        background.position = ccp(size.width/2, size.height/2);
        [self addChild: background];
        
        
        ccColor3B color;
        color.r = 0;color.g = 0; color.b = 0;
        
        
		CCLabelTTF  *label = [CCLabelTTF labelWithString:@"Defence" fontName:@"MarKer Felt" fontSize:64];
		label.position =  ccp( size.width /2 , size.height/2 + 200 );
        label.color = color;
        [self addChild: label];
		
        
        
		[CCMenuItemFont setFontSize:28];

        
		CCMenuItem *start = [CCMenuItemFont itemWithString:@"start" target:self selector:@selector(start:)];
        CCMenuItem *option = [CCMenuItemFont itemWithString:@"option" target:self selector:@selector(option:)];
        CCMenuItem *aboutUs = [CCMenuItemFont itemWithString:@"about us" target:self selector:@selector(aboutUs:)];
      
        
		CCMenu *menu = [CCMenu menuWithItems:start,option,aboutUs, nil];

        
		[menu alignItemsVerticallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
        
		[menu setColor:color];
    
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

-(void) start:(id)sender
{
    [[CCDirector sharedDirector]replaceScene:[GameLayer scene]];
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
