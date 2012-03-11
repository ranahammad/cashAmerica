//
//  CountryMgr.h
//  GRE
//
//  Created by Rana Hammad Hussain on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PLIST_NAME	@"America_Countries"

@interface CountryMgr : NSObject 
{
	NSMutableArray *pCountries;
}

@property (nonatomic, retain) NSMutableArray *pCountries;

-(void) loadCountries;

@end
