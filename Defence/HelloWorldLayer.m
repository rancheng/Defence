//
//  HelloWorldLayer.m
//  Defence
//
//  Created by  亓庆国 on 12-11-10.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
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
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
		
		UIPinchGestureRecognizer *gestureRecognizer = [[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchFrom:)] autorelease];
        [[[CCDirector sharedDirector] openGLView] addGestureRecognizer:gestureRecognizer];
        
        UIPanGestureRecognizer *gestureRecognizer1 = [[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanFrom:)] autorelease];
        [[[CCDirector sharedDirector] openGLView] addGestureRecognizer:gestureRecognizer1];
        
        backGround = [CCSprite spriteWithFile:@"ground.jpg"];
        
		size = [[CCDirector sharedDirector] winSize];
        
        self.anchorPoint = CGPointZero;
		self.position =  CGPointZero;
        backGround.position = ccp( size.width /2 , size.height/2 );
		
		[self addChild: backGround];
		
		//
		// Leaderboards and Achievements
		//
		
		// Default font size will be 28 points.
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
		
		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
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
#pragma Guesture recognizer
-(CGRect) rectOfPositionAllow
{
    CGRect theRect;
    theRect.origin.x = size.width - self.boundingBox.size.width;
    theRect.origin.y = size.height - self.boundingBox.size.height;
    theRect.size.width = abs(size.width - self.boundingBox.size.width);
    theRect.size.height = abs(size.height - self.boundingBox.size.height);
    return theRect;
}


-(void) handlePinchFrom:(UIPinchGestureRecognizer*)recognizer
{
    if([recognizer state] == UIGestureRecognizerStateBegan)
    {
        lastScale = self.scale;
    }
    float nowScale;
    nowScale = (lastScale - 1) + recognizer.scale;
    nowScale = MIN(nowScale,2);
    nowScale = MAX(nowScale,1);
    
    allowRect = [self rectOfPositionAllow];
    
    if (lastScale > nowScale)
    {
        
        CGPoint newPosition =  ccpSub(self.position, ccpMult ( ccpNormalize(self.position) ,ccpLength(self.position) *(lastScale - nowScale)/(lastScale - 1))) ;
        if (CGRectContainsPoint(allowRect, newPosition))
        {
            self.position = newPosition;
        }
    }
    self.scale = nowScale;
}

- (void)handlePanFrom:(UIPanGestureRecognizer *)recognizer
{
    
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        lastPosition = self.position;
        
    } else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        
        CGPoint translation = [recognizer translationInView:recognizer.view];
        translation = ccp(translation.x, -translation.y);
        translation = ccpMult(translation, 0.7f);
        CGPoint newPos = ccpAdd(lastPosition, translation);
        if (CGRectContainsPoint(allowRect, newPos))
        {
            self.position = newPos;
        }
        
    }
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
@end
