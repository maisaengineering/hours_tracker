//
//  JobsViewController.h
//  HoursTracker
//
//  Created by Nagendra on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddJobViewController.h"
#import "AppDelegate.h"
#import "DesignViewController.h"
@interface JobsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>
{
    UITableView *tblView;
    AppDelegate *appDelegate;
}

@end
