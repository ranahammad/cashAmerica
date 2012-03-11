//
//  CurrencyViewController.h
//  American Money
//
//  Created by Rana Hammad Hussain on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FacebookAgent.h"

#define FB_API_KEY		@"8a404b70f91d3ff3857ffb414fa82d71"
#define FB_API_SECRET	@"ad7d3b5a06a831c3f1539e7de608bbe1"

@interface CurrencyViewController : UIViewController<FacebookAgentDelegate> 
{

	UIImageView *pSelectedImageView;
	UINavigationBar *pTitleBar;
	UIToolbar *pToolBar;
	
	int iSelectedIdx;
	NSMutableArray *pSelectedList;
	NSString *strTitle;
	
	BOOL bShowFront;
	BOOL bFromLeft;
	
	CGPoint pTouchPoint_1;
	
	UIBarButtonItem *pLeftBtn;
	UIBarButtonItem *pRightBtn;
	
	FacebookAgent* fbAgent;

}

@property (nonatomic, retain) IBOutlet UIBarButtonItem *pLeftBtn;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *pRightBtn;
@property (nonatomic, retain) IBOutlet UIImageView *pSelectedImageView;
@property (nonatomic, retain) IBOutlet UINavigationBar *pTitleBar;
@property (nonatomic, retain) IBOutlet UIToolbar *pToolBar;

@property (nonatomic) int iSelectedIdx;
@property (nonatomic, retain) NSMutableArray *pSelectedList;
@property (nonatomic, retain) NSString *strTitle;
-(IBAction) actionBtnClicked;
-(IBAction) menuBtnClicked;
-(IBAction) backBtnClicked;
-(IBAction) nextBtnClicked;
-(IBAction) flipBtnClicked;
-(IBAction) saveImageToAlbum;

@end
