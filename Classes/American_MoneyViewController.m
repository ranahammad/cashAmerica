//
//  American_MoneyViewController.m
//  American Money
//
//  Created by Rana Hammad Hussain on 2/16/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "American_MoneyViewController.h"

#import "ContriesViewClicked.h"
#import "ContinentsViewController.h"
#import "AboutViewController.h"
#import "American_MoneyAppDelegate.h"


@implementation American_MoneyViewController
@synthesize iCreditImageView;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

-(IBAction) countriesClicked
{
	American_MoneyAppDelegate *pDelegate = (American_MoneyAppDelegate*)[[UIApplication sharedApplication] delegate];
	ContriesViewClicked *pController = [[ContriesViewClicked alloc] initWithNibName:@"ContriesViewClicked" bundle:[NSBundle mainBundle]];
	[pController setPSelectedList:[[pDelegate pCountryManager] pCountries]];
	[self presentModalViewController:pController animated:YES];
	[pController release];
}

-(IBAction) continentsClicked
{
	ContinentsViewController *pController = [[ContinentsViewController alloc] initWithNibName:@"ContinentsViewController" bundle:[NSBundle mainBundle]];
	[self presentModalViewController:pController animated:YES];
	[pController release];
}

-(IBAction) aboutUsClicked
{
	AboutViewController *pController = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:[NSBundle mainBundle]];
	[self presentModalViewController:pController animated:YES];
	[pController release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	
	NSArray *pInfoArray = [NSArray arrayWithObjects:
						   [UIImage imageNamed:@"i0000.png"],
						   [UIImage imageNamed:@"i0001.png"],
						   [UIImage imageNamed:@"i0002.png"],
						   [UIImage imageNamed:@"i0003.png"],
						   [UIImage imageNamed:@"i0004.png"],
						   [UIImage imageNamed:@"i0005.png"],
						   [UIImage imageNamed:@"i0006.png"],
						   [UIImage imageNamed:@"i0007.png"],
						   [UIImage imageNamed:@"i0008.png"],
						   [UIImage imageNamed:@"i0009.png"],
						   [UIImage imageNamed:@"i0010.png"],
						   [UIImage imageNamed:@"i0011.png"],
						   [UIImage imageNamed:@"i0012.png"],
						   [UIImage imageNamed:@"i0013.png"],
						   [UIImage imageNamed:@"i0014.png"],
						   [UIImage imageNamed:@"i0015.png"],nil];
	[iCreditImageView setAnimationImages:pInfoArray];
	[iCreditImageView setAnimationDuration:1.0];
	[iCreditImageView setAnimationRepeatCount:0];
	
	[iCreditImageView startAnimating];
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
    [super dealloc];
}

@end
