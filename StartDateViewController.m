//
//  StartDateViewController.m
//  HoursTracker
//
//  Created by Nagendra on 28/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StartDateViewController.h"
#import "DesignViewController.h"
@implementation StartDateViewController
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
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(DoneBtnClicked:)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(CancelBtnClicked:)];

    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 180, 325, 250)];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime; 
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterFullStyle;
    [df setDateFormat:@"EEE dd MMM yyyy hh:mm a"];
    text.text = [NSString stringWithFormat:@"%@ ",
                 [df stringFromDate:datePicker.date]];
    [df release];

    [datePicker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    [datePicker release];
}
-(void)changeDate:(id)sender
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterFullStyle;
    [df setDateFormat:@"EEE dd MMM yyyy hh:mm a"];
    	text.text = [NSString stringWithFormat:@"%@ ",
                      [df stringFromDate:datePicker.date]];
    	[df release];
}
-(void)CancelBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)DoneBtnClicked:(id)sender
{
    NSString *str=[[NSString alloc]initWithString:text.text]; 
    [delegate didReceiveMessage1:str];
    [self.navigationController popViewControllerAnimated:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
