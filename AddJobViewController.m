//
//  AddJobViewController.m
//  HoursTracker
//
//  Created by Nagendra on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddJobViewController.h"
@implementation AddJobViewController
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
    self.title=@"Name&Rate";
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [txt1 resignFirstResponder];
    return YES;
}
-(void)DoneBtnClicked:(id)sender
{
    NSDictionary *dict=[[NSDictionary alloc]initWithObjectsAndKeys:txt1.text,@"jobname",txt2.text,@"Rate/Hour", nil];
    NSLog(@"dict is %@",dict);
    AppDelegate *appdelegate=(AppDelegate *)[[UIApplication sharedApplication ]delegate];
    [appdelegate.array1 addObject:dict];
    NSLog(@"array is %@",appdelegate.array1);
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
