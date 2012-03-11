//
//  CountryMgr.m
//
//  Created by Rana Hammad Hussain on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CountryMgr.h"
#import "Country.h"

@implementation CountryMgr

@synthesize pCountries;

-(id) init
{
	self = [super init];
	if(self)
	{
		pCountries = [[NSMutableArray alloc] init];

		return self;
	}
	
	return nil;
}

-(void) dealloc
{

	[pCountries removeAllObjects];
	[pCountries release];
	
	[super dealloc];
}


-(void) loadCountries
{
	NSString *path = [[NSBundle mainBundle] pathForResource:PLIST_NAME
													 ofType:@"plist"];
	
	NSArray *pArray = [[NSArray alloc] initWithContentsOfFile:path];
	
	for (int i=0; i < [pArray count] ; i++)
	{
		Country *pCountry = [[Country alloc] initWithDictionary:[pArray objectAtIndex:i]];
		[pCountries addObject:pCountry];
		[pCountry release];
	}
	
	[pArray release];

//	return pAllWords;
}

@end
