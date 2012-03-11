//
//  Country.h
//
//  Created by Rana Hammad Hussain on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ITEM_NAME		@"Name"
#define ITEM_INITIAL	@"Initial"

@interface Country : NSObject 
{
	NSString *strName;
	NSString *strInitial;
	
	NSMutableArray *pCurrencies;
}

@property (nonatomic, retain) NSString *strName;
@property (nonatomic, retain) NSString *strInitial;
@property (nonatomic, retain) NSMutableArray *pCurrencies;

-(void) loadCurrencies;

-(id) initWithDictionary:(NSDictionary*)pDictionary;
@end
