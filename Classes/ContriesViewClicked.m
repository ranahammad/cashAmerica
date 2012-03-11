//
//  ContriesViewClicked.m
//  American Money
//
//  Created by Rana Hammad Hussain on 2/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContriesViewClicked.h"
#import "Country.h"
#import "CurrencyViewController.h"

@implementation ContriesViewClicked
@synthesize pSearchBar;
@synthesize pListTableView;
@synthesize pSelectedList;

-(IBAction) menuBtnClicked
{
	[self dismissModalViewControllerAnimated:YES];
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
- (void)viewDidLoad {
    [super viewDidLoad];
	[pListTableView setBackgroundColor:[UIColor clearColor]];
	pSearchRecords = [[NSMutableArray alloc] init];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark searchbar related methods

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	[pSearchRecords removeAllObjects];
	
	if(searchText && [searchText length] > 0)
	{
		
		for(int i=0; i<[pSelectedList count]; i++)
		{
			Country *pCountry = [pSelectedList objectAtIndex:i];
			if([[pCountry.strName lowercaseString] hasPrefix:[searchText lowercaseString]])
				[pSearchRecords addObject:pCountry];
		}
	}
	[pListTableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar                     // called when keyboard search button pressed
{
	[searchBar resignFirstResponder];
}

#pragma mark tableview related methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	if([pSearchRecords count] == 0)
	{
		return [pSelectedList count];
	}
	
	return [pSearchRecords count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *strIdentifier = @"RowIdentifier";//[NSString stringWithFormat:@"cellIdentifier%d-%d",indexPath.section, indexPath.row];
	
	UITableViewCell *pCell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:strIdentifier];
	if(pCell == nil)
	{
		pCell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:strIdentifier] autorelease];
	}
//	else
//	{
//		for(int i=[[pCell subviews] count] - 1; i>=0; i--)
//		{
//			UIView *pSubView = [[pCell subviews] objectAtIndex:i];
//			if([pSubView isKindOfClass:[UILabel class]])
//				[pSubView removeFromSuperview];
//		}
//	}
//	[pCell.contentView clearsContextBeforeDrawing];
	
	
//	GREWord *pWord;
//	if([pSearchRecords count] == 0)
//	{
//		pWord = [pSelectedList objectAtIndex:indexPath.row];
//	}
//	else 
//	{
//		pWord = [pSearchRecords objectAtIndex:indexPath.row];
//	}
//	
//	[pCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
//	
//	UILabel *pWordLbl = [[UILabel alloc] init];
//	[pWordLbl setFrame:CGRectMake(20, 10, 400, 25)];
//	[pWordLbl setBackgroundColor:[UIColor clearColor]];
//	[pWordLbl setFont:[UIFont boldSystemFontOfSize:20]];
//	[pWordLbl setText:[pWord strWord]];
//	[pCell addSubview:pWordLbl];
//	[pWordLbl release];
//	
//	UILabel *pLabel = [[UILabel alloc] init];
//	[pLabel setFrame:CGRectMake(30, 35, 380, 30)];
//	[pLabel setNumberOfLines:2];
//	[pLabel setBackgroundColor:[UIColor clearColor]];
//	[pLabel setFont:[UIFont italicSystemFontOfSize:14]];
//	[pLabel setText:[pWord strMeaning]];
//	
//	[pCell addSubview:pLabel];
//	[pLabel release];
	
	Country *pCountry;
	if([pSearchRecords count] == 0)
	{
		pCountry = [pSelectedList objectAtIndex:indexPath.row];
	}
	else 
	{
		pCountry = [pSearchRecords objectAtIndex:indexPath.row];
	}	
	pCell.textLabel.text = [pCountry strName];
	
	return pCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	CurrencyViewController *pController = [[CurrencyViewController alloc] initWithNibName:@"CurrencyViewController" bundle:[NSBundle mainBundle]];
	[pController setISelectedIdx:0];
	Country *pCountry;
	if([pSearchRecords count] == 0)
	{
		pCountry = [pSelectedList objectAtIndex:indexPath.row];
	}
	else 
	{
		pCountry = [pSearchRecords objectAtIndex:indexPath.row];
	}
	if(pCountry != nil)
	{
		[pCountry loadCurrencies];
		[pController setPSelectedList:[pCountry pCurrencies]];
		[pController setStrTitle:[pCountry strName]];
		[self presentModalViewController:pController animated:YES];
		[pController release];
	}
}


@end
