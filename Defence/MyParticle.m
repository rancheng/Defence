//
//  MyParticle.m
//  Defence
//
//  Created by bryce on 12-12-2.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
#import "MyParticle.h"
#import "CCTextureCache.h"
#import "CCDirector.h"
#import "libs/cocos2d/Support/CGPointExtension.h"

@implementation MyParticle
-(id) init
{
	return [self initWithTotalParticles:1500];
}

-(id) initWithTotalParticles:(NSUInteger)p
{
	if( (self=[super initWithTotalParticles:p]) ) {
		// duration
		duration = 1.5;
        
		// Gravity Mode
		self.emitterMode =kCCParticleModeGravity;

		// Gravity Mode: gravity
		self.gravity = ccp(0,0);
        
		// Gravity Mode:  radial
		self.radialAccel = 0;
		self.radialAccelVar = 0;
        
		//  Gravity Mode: speed of particles
		self.speed = 0;
		self.speedVar = 5;
        
		// emitter position
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		self.position = ccp(winSize.width/2, winSize.height/2);
        
		// angle
		angle = 0;
		angleVar = 5;
        
		// life of particles
		life = 1.4f;
		lifeVar = 0;
        
		// emits per frame
		emissionRate = totalParticles/life;
        
		// color of particles
		startColor.r = 0.7f;
		startColor.g = 0.1f;
		startColor.b = 0.1f;
		startColor.a = 1.0f;
		startColorVar.r = 0.3f;
		startColorVar.g = 0.2f;
		startColorVar.b = 0.1f;
		startColorVar.a = 0.1f;
		endColor.r = 0.8f;
		endColor.g = 0.3f;
		endColor.b = 0.2f;
		endColor.a = 0.5f;
		endColorVar.r = 0.0f;
		endColorVar.g = 0.0f;
		endColorVar.b = 0.0f;
		endColorVar.a = 0.0f;
        
		// size, in pixels
		startSize = 30.0f;
		startSizeVar = 0.0f;
        endSize = 30.0;
     //   endSize = kCCParticleStartSizeEqualToEndSize;
        
		self.texture = [[CCTextureCache sharedTextureCache] addImage: @"fire.png"];
        emissionRate = 30;
		// additive
		self.blendAdditive = YES;
	}
    
	return self;
}
@end

