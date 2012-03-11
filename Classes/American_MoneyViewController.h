//
//  American_MoneyViewController.h
//  American Money
//
//  Created by Rana Hammad Hussain on 2/16/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface American_MoneyViewController : UIViewController {
	
	UIImageView *iCreditImageView;
}

@property (nonatomic, retain) IBOutlet UIImageView *iCreditImageView;


-(IBAction) countriesClicked;
-(IBAction) continentsClicked;
-(IBAction) aboutUsClicked;
@end

