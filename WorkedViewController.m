//
//  WorkedViewController.m
//  HoursTracker
//
//  Created by Nagendra on 28/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WorkedViewController.h"

@implementation WorkedViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(DoneBtnClicked:)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(CancelBtnClicked:)];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterFullStyle;
    [df setDateFormat:@"hh:mm"];
    text1.text = [NSString stringWithFormat:@"%@ ",[df stringFromDate:datePicker.date]];
    [df release];
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 180, 325, 250)];
    datePicker.datePickerMode = UIDatePickerModeCountDownTimer; 
    [datePicker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    [datePicker release];
}
-(void)DoneBtnClicked:(id)sender
{
   NSString *str=[[NSString alloc]initWithString:text1.text]; 
    [delegate didReceiveMessage3:str];
    [self.navigationController popViewControllerAnimated:YES];
}
//- (id)dateByAddingTimeInterval:(NSTimeInterval)seconds 
//{
//    NSDate *mydate = [[NSDate date]initWithString:];
//    NSLog(@"my date is %@",mydate);
//    int hours =[[NSNumber numberWithInt:variable] stringValue];
//    NSTimeInterval hoursInSeconds = hours * 60 * 60;
//    NSDate *dateAfterAddingHours = [mydate dateByAddingTimeInterval:hoursInSeconds];
//        [btn2 setTitle:[dateAfterAddingHours ]  forState:UIControlStateNormal];
//}
//
-(void)changeDate:(id)sender
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterFullStyle;
    [df setDateFormat:@"hh:mm"];
     text1.text = [NSString stringWithFormat:@"%@ ",[df stringFromDate:datePicker.date]];
    [df release];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)CancelBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
