//
//  Country.m
//
//  Created by Rana Hammad Hussain on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Country.h"
#import "Currency.h"

@implementation Country
@synthesize strName;
@synthesize strInitial;
@synthesize pCurrencies;

-(id) init
{
	self = [super init];
	if(self)
	{
		strName = nil;
		strInitial = nil;
	
		pCurrencies = [[NSMutableArray alloc] init];
		
		return self;
	}
	return nil;
}


-(void) loadCurrencies
{
	if([pCurrencies count] == 0)
	{
		NSArray *paths = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:nil];
		for (NSString *filename in paths) 
		{
			filename = [[filename componentsSeparatedByString:@"/"] lastObject];
			if ([filename hasPrefix:self.strInitial] && [filename hasSuffix:@"f.jpg"]) 
			{
				Currency *pCurrency = [[Currency alloc] init];
				pCurrency.strFrontImage = [[NSString alloc] initWithString:filename];
				
				NSString *backFileName = [filename stringByReplacingOccurrencesOfString:@"f.jpg" withString:@"r.jpg"];
				pCurrency.strBackImage = [[NSString alloc] initWithString:backFileName];
				
				[pCurrencies addObject:pCurrency];
				[pCurrency release];
			}
		}
	}
}

-(id) initWithDictionary:(NSDictionary*)pDictionary
{
	self = [self init];
	if(self)
	{
		self.strName = [[NSString alloc] initWithString:[pDictionary objectForKey:ITEM_NAME]];
		self.strInitial = [[NSString alloc] initWithString:[pDictionary objectForKey:ITEM_INITIAL]];
		
		return self;
	}
	return nil;
}

-(void) dealloc
{
	if(strName)
	{
		[strName release];
		strName = nil;
	}
	
	if(strInitial)
	{
		[strInitial release];
		strInitial = nil;
	}
	
	[pCurrencies removeAllObjects];
	[pCurrencies release];
	
	[super dealloc];
}

@end
