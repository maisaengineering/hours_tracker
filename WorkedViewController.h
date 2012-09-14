//
//  WorkedViewController.h
//  HoursTracker
//
//  Created by Nagendra on 28/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DesignViewController.h"
@protocol ModalViewDelegate;


@interface WorkedViewController : UIViewController{
    id<ModalViewDelegate> delegate;

    UIDatePicker *datePicker;
    IBOutlet UITextField *text1;

}
@property (nonatomic, assign) id<ModalViewDelegate> delegate;

@end
