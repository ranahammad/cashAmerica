//
//  Currency.m
//  American Money
//
//  Created by Rana Hammad Hussain on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Currency.h"

@implementation Currency
@synthesize strFrontImage;
@synthesize strBackImage;

-(id) init
{
	if(self = [super init])
	{
		strFrontImage = nil;
		strBackImage = nil;
		return self;
	}
	
	return nil;
}

-(void) dealloc
{
	if(strFrontImage)
	{
		[strFrontImage release];
		strFrontImage = nil;
	}
	
	if(strBackImage)
	{
		[strBackImage release];
		strBackImage = nil;
	}
	
	[super dealloc];
}

@end
