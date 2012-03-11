//
//  American_MoneyAppDelegate.h
//  American Money
//
//  Created by Rana Hammad Hussain on 2/16/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryMgr.h"

//#import "FBConnect.h"
//#import "FBSession.h"

@class American_MoneyViewController;

@interface American_MoneyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    American_MoneyViewController *viewController;
	CountryMgr *pCountryManager;
//	FBSession *_session;
	
}
//@property (nonatomic,retain) FBSession *_session;


@property (nonatomic, retain) CountryMgr *pCountryManager;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet American_MoneyViewController *viewController;

@end

