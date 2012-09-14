//
//  DesignViewController.h
//  HoursTracker
//
//  Created by Nagendra on 28/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartDateViewController.h"
#import "WorkedViewController.h"
#import "AppDelegate.h"

@protocol ModalViewDelegate
- (void)didReceiveMessage1:(NSString *)message;
- (void)didReceiveMessage3:(NSString *)message;

@end
@interface DesignViewController : UIViewController<ModalViewDelegate>
{
    AppDelegate *appDelegate;

    NSMutableArray *array;
    UIButton *btn1;
    UIButton *btn4;
    UIButton *btn3;
    UIButton *btn2;
    UITableView *table;
    NSString *strEndDate;

}
@property(nonatomic,retain)NSMutableArray *array;
@end
