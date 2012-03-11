//
//  CurrencyViewController.m
//  American Money
//
//  Created by Rana Hammad Hussain on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CurrencyViewController.h"
#import "Currency.h"
#import "American_MoneyAppDelegate.h"
#import "FacebookAgent.h"

@implementation CurrencyViewController
@synthesize pSelectedImageView;
@synthesize pTitleBar;
@synthesize pToolBar;
@synthesize iSelectedIdx;
@synthesize pSelectedList;
@synthesize strTitle;
@synthesize pLeftBtn;
@synthesize pRightBtn;

#pragma mark FacebookAgent related methods
-(void) sendToFacebook
{
	fbAgent.shouldResumeSession = YES;
	NSData* myData = UIImagePNGRepresentation(pSelectedImageView.image);

	[fbAgent uploadPhotoAsData:myData
				  withStatus:nil
					 caption:@"I am sharing this currency note via 'Cash America' developed by Azosh & Co. (www.azosh.net)"
					 toAlbum:nil];
	
}

- (void) facebookAgent:(FacebookAgent*)agent requestFaild:(NSString*) message{
	fbAgent.shouldResumeSession = NO;
	//[fbAgent setStatus:@"status from iPhone demo 1 2"];
}

- (void) facebookAgent:(FacebookAgent*)agent photoUploaded:(NSString*) pid
{
	agent.shouldResumeSession = FALSE;
}

- (void) facebookAgent:(FacebookAgent*)agent statusChanged:(BOOL) success{
}

- (void) facebookAgent:(FacebookAgent*)agent loginStatus:(BOOL) loggedIn{
}

#pragma mark view related methods
-(void) showCurrentImage:(BOOL)bFromFlipped
{
	Currency *pCurrency = [pSelectedList objectAtIndex:iSelectedIdx];
	UIImage *pCurrImage = nil;
	if(bShowFront)
	{
		pCurrImage = [UIImage imageNamed:[pCurrency strFrontImage]];
	}
	else 
	{
		pCurrImage = [UIImage imageNamed:[pCurrency strBackImage]];
	}
	
	if(bFromFlipped)
	{
		[UIView beginAnimations:@"flipping view" context:nil];
		[UIView setAnimationDuration:1];
		//[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		if(bShowFront)
			[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:pSelectedImageView cache:YES];
		else
			[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:pSelectedImageView cache:YES];
		
		[pSelectedImageView setImage:pCurrImage];
		[UIView commitAnimations];
	}
	else
	{
		[pSelectedImageView setImage:nil];
		[UIView beginAnimations:@"flipping view" context:nil];
		[UIView setAnimationDuration:1];
		if(bFromLeft)
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:FALSE];
		else
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:FALSE];
		
		[UIView commitAnimations];
		[pSelectedImageView setImage:pCurrImage];
	}
}

- (void) imageSavingComplete
{
	UIAlertView *pAlert = [[UIAlertView alloc] initWithTitle:@"CashAmerica" message:@"Image saved to photo album successfully." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[pAlert show];
	[pAlert release];
}

-(IBAction) saveImageToAlbum
{
	
	Currency *pCurrency = [pSelectedList objectAtIndex:iSelectedIdx];
	UIImage *pCurrImage = nil;
	if(bShowFront)
	{
		pCurrImage = [UIImage imageNamed:[pCurrency strFrontImage]];
	}
	else 
	{
		pCurrImage = [UIImage imageNamed:[pCurrency strBackImage]];
	}
//	NSData* myData = UIImagePNGRepresentation(pSelectedImageView.image);
//	UIImage *image = [UIImage imageWithData:myData];
//	
	UIImageWriteToSavedPhotosAlbum(pCurrImage, self, @selector(imageSavedToPhotosAlbum: didFinishSavingWithError: contextInfo:), nil);  	
}
//
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//	
//
//	if(buttonIndex == 1)
//	{
//		// save to photo album
//	}
//	else if(buttonIndex == 2)
//	{
//		[self sendToFacebook];
//	}
//}
//
- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {  
    NSString *message;  
    NSString *title;  
    if (!error) {  
        title = NSLocalizedString(@"Saving Image", @"");  
        message = NSLocalizedString(@"Image successfully saved.", @"");  
    } else {  
        title = NSLocalizedString(@"Saving Image", @"");  
        message = [error description];  
	}  
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title  
													message:message  
												   delegate:nil  
										  cancelButtonTitle:NSLocalizedString(@"OK", @"")  
										  otherButtonTitles:nil];  
	[alert show];  
	[alert release];  
	
}

-(IBAction) actionBtnClicked
{
	[self sendToFacebook];
//	UIAlertView *pAlert = [[UIAlertView alloc] initWithTitle:@"CashAmerica" 
//													 message:nil
//													delegate:self
//										   cancelButtonTitle:@"Cancel"
//										   otherButtonTitles:@"Save to Photo Album",
//														   @"Share on Facebook",
//														   nil];
//	[pAlert show];
//	[pAlert release];
}

-(IBAction) menuBtnClicked
{
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction) backBtnClicked//move left
{
	pRightBtn.enabled = TRUE;
	pLeftBtn.enabled = TRUE;
	bFromLeft = TRUE;
	
	int iTempIndex = iSelectedIdx;
	
	if(iSelectedIdx > 0)
		iSelectedIdx--;
	
	if(iSelectedIdx==0)
		pLeftBtn.enabled = FALSE;
		// disable
	if(iTempIndex!=iSelectedIdx)
		[self showCurrentImage:NO];
}

-(IBAction) nextBtnClicked//move right
{
	pRightBtn.enabled = TRUE;
	pLeftBtn.enabled = TRUE;
	bFromLeft = FALSE;

	int iTempIndex = iSelectedIdx;

	if(iSelectedIdx < [pSelectedList count]-1)
		iSelectedIdx++;
	
	if(iSelectedIdx == [pSelectedList count]-1)
		pRightBtn.enabled = FALSE;
	
	if(iTempIndex!=iSelectedIdx)
		[self showCurrentImage:NO];	
}

-(IBAction) flipBtnClicked
{
	bShowFront = !bShowFront;
	[self showCurrentImage:TRUE];
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		
		[self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
		
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	
	fbAgent = [[FacebookAgent alloc] initWithApiKey:@"8a404b70f91d3ff3857ffb414fa82d71" 
										  ApiSecret:@"ad7d3b5a06a831c3f1539e7de608bbe1" 
										   ApiProxy:nil];
	fbAgent.delegate = self;
	
	[pTitleBar.topItem setTitle:strTitle];

	bShowFront = TRUE;
	bFromLeft = TRUE;
	
	[self showCurrentImage:NO];
	pLeftBtn = [[pToolBar items] objectAtIndex:0];
	pRightBtn = [[pToolBar items] objectAtIndex:6];
	[self backBtnClicked];
	
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	
    return YES;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {

    [super dealloc];
}

-(void) toggleToolbars
{
	pTitleBar.hidden = !pTitleBar.hidden;
	pToolBar.hidden = !pToolBar.hidden;
	//bannerView.hidden = !bannerView.hidden;
	
//	if(pTitleBar.hidden)
//	{
//		[bannerView setCenter:CGPointMake(bannerView.center.x, bannerView.frame.size.height/2)];
//	}
//	else
//	{
//		[bannerView setCenter:CGPointMake(bannerView.center.x, pTitleBar.frame.size.height + bannerView.frame.size.height/2)];
//	}

}

#pragma mark Touches handling
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSSet *allTouches = [event allTouches];
	UITouch *pTouch = [allTouches anyObject];

	CGPoint pTouch_2;
	switch ([allTouches count])
	{
		case 1:
			pTouch_2 = [pTouch locationInView:pSelectedImageView];
			
			if(abs(pTouch_2.x - pTouchPoint_1.x)>20)
			{
				if(pTouch_2.x > pTouchPoint_1.x)
					[self backBtnClicked];
				else
					[self nextBtnClicked];
			}
			break;
	}
}

//- (void)touchesMoved: (NSSet *)touches withEvent: (UIEvent *)event{
//	
////	NSSet *allTouches = [event allTouches];
////	UITouch *pTouch = [allTouches anyObject];
//
////	CGPoint pTouch1, pTouch2;
//	switch ([allTouches count])
//	{
//		case 1: 
//		{
////			pTouch1 = [pTouch previousLocationInView:pSelectedImageView];
////			pTouch2 = [pTouch locationInView:pSelectedImageView];
////
////			if(pTouch1.x - pTouch2.x < 10)
////			{
////				// move right
////				[self nextBtnClicked];
////			}
////			else if(pTouch2.x - pTouch1.x < 10)
////			{
////				// move left
////				[self backBtnClicked];
////			}
//
//			
////			UITouch *pTouch = [allTouches anyObject];
////			
////			if(m_pSelectedImageView == nil)
////				return;	
////			
////			CGPoint pTouchPt = [pTouch locationInView:[self view]];	
////			float x = pTouchPt.x - firstTouch.x;
////			float y = pTouchPt.y - firstTouch.y;
////			
////			firstTouch = pTouchPt;
////			
////			CGPoint pCenter = CGPointMake(m_pSelectedImageView.center.x + x, m_pSelectedImageView.center.y + y);
////			[m_pSelectedImageView setCenter:pCenter];
//			//[m_pSelectionFrameImageView setCenter:pCenter];
//		} 
//			break;
//		case 2: 
//		{
////			UITouch *touch1 = [[allTouches allObjects] objectAtIndex:0];
////			UITouch *touch2 = [[allTouches allObjects] objectAtIndex:1];
////			m_pSelectedImageView.transform = CGAffineTransformWithTouches(m_pSelectedImageView.transform, touch1, touch2);
//			//The image is being zoomed in or out.
//			/*
//			 
//			 
//			 //Calculate the distance between the two fingers.
//			 
//			 
//			 finalDistance = [self distanceBetweenTwoPoints:[touch1 locationInView:[self view]]
//			 toPoint:[touch2 locationInView:[self view]]];
//			 
//			 CGSize pSize = [m_pSelectedImageView frame].size;
//			 CGPoint pCenter = m_pSelectedImageView.center;
//			 CGRect pFinalRect;
//			 //Check if zoom in or zoom out.
//			 
//			 
//			 
//			 if(initialDistance > finalDistance) 
//			 {
//			 pSize = CGSizeMake(pSize.width - 2, pSize.height - 2);
//			 NSLog(@"Zoom Out");
//			 
//			 }
//			 else 
//			 {
//			 pSize = CGSizeMake(pSize.width + 2, pSize.height + 2);
//			 NSLog(@"Zoom In");
//			 }
//			 pFinalRect = CGRectMake( 0, 0, pSize.width, pSize.height);
//			 
//			 
//			 
//			 //[m_pSelectedImageView setTransform:transform];
//			 [m_pSelectedImageView setFrame:pFinalRect];
//			 [m_pSelectedImageView setCenter:pCenter];
//			 
//			 //[m_pSelectionFrameImageView setFrame:[m_pSelectedImageView frame]];
//			 initialDistance = finalDistance;
//			 */
//		} break;
//	}	
//}

- (void)touchesBegan: (NSSet *)touches withEvent: (UIEvent *)event{
	NSSet *allTouches = [event allTouches];
	switch ([allTouches count]) 
	{
		case 1: { //Single touch
			
			//Get the first touch.
			UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
			
			switch ([touch tapCount])
			{
				case 1: //Single Tap.
					pTouchPoint_1 = [touch locationInView:pSelectedImageView];
//				{
//					if([m_pCensorImagesArray count] == 0)
//					{
//						//	[m_pSelectionFrameImageView setHidden:TRUE];
//						[m_pDeleteCensorButton setEnabled:FALSE];
//						return;
//					}
//					
//					firstTouch = [touch locationInView:[self view]];
//					m_pSelectedImageView = nil;
//					
//					for(int i=[m_pCensorImagesArray count]-1; i>=0; i--)
//					{
//						UIImageView* pImageView = [m_pCensorImagesArray objectAtIndex:i];
//						if(CGRectContainsPoint([pImageView frame], firstTouch))
//						{
//							m_pSelectedImageView = pImageView;
//							//[m_pSelectionFrameImageView setFrame:[m_pSelectedImageView frame]];
//							//[self.view bringSubviewToFront:m_pSelectionFrameImageView];
//							//[m_pSelectionFrameImageView setHidden:FALSE];
//							[m_pDeleteCensorButton setEnabled:TRUE];
//							break;
//						}
//					}
//					
//					if(m_pSelectedImageView)
//						[self touchesMoved:touches withEvent:event];
//					else
//					{
//						//[m_pSelectionFrameImageView setHidden:TRUE];
//						[m_pDeleteCensorButton setEnabled:FALSE];
//					}
//				} 
					break;
					
				case 2: 
				{//Double tap.
					[self toggleToolbars];
				} break;
			}
		}
			break;
		case 2: 
		{ //Double Touch
//			
//			//Track the initial distance between two fingers.
//			UITouch *touch1 = [[allTouches allObjects] objectAtIndex:0];
//			UITouch *touch2 = [[allTouches allObjects] objectAtIndex:1];
//			
//			initialDistance = [self distanceBetweenTwoPoints:[touch1 locationInView:[self view]]
//													 toPoint:[touch2 locationInView:[self view]]];
			
		}
			break;
		default:
			break;
	}
}

@end
