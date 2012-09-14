//
//  StartDateViewController.h
//  HoursTracker
//
//  Created by Nagendra on 28/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ModalViewDelegate;

@interface StartDateViewController : UIViewController<UITextFieldDelegate>
{
    id<ModalViewDelegate> delegate;
    IBOutlet UITextField *text;
    UIDatePicker *datePicker;
}
@property(nonatomic,retain) id<ModalViewDelegate> delegate;
@end
