//
//  ContriesViewClicked.h
//  American Money
//
//  Created by Rana Hammad Hussain on 2/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContriesViewClicked : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
{
	UISearchBar *pSearchBar;
	UITableView *pListTableView;
	
	NSMutableArray *pSearchRecords;
	NSMutableArray *pSelectedList;
	
}

@property (nonatomic, retain) IBOutlet UISearchBar *pSearchBar;
@property (nonatomic, retain) IBOutlet UITableView *pListTableView;
@property (nonatomic, retain) NSMutableArray *pSelectedList;

-(IBAction) menuBtnClicked;

@end
