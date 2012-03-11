//
//  Currency.h
//  American Money
//
//  Created by Rana Hammad Hussain on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Currency : NSObject 
{
	//UIImage *pFrontImage;
	//UIImage *pBackImage;
	NSString *strFrontImage;
	NSString *strBackImage;
}

//@property (nonatomic, retain) UIImage *pFrontImage;
//@property (nonatomic, retain) UIImage *pBackImage;

@property (nonatomic, retain) NSString *strFrontImage;
@property (nonatomic, retain) NSString *strBackImage;
@end
