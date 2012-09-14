//
//  DesignViewController.m
//  HoursTracker
//
//  Created by Nagendra on 28/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DesignViewController.h"
@implementation DesignViewController
@synthesize array;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)didReceiveMessage1:(NSString *)message 
{
    [btn1 setTitle:message forState:UIControlStateNormal];
    
}
- (void)didReceiveMessage3:(NSString *)message 
{
    [btn3 setTitle:message forState:UIControlStateNormal];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self checkForEndDate];

    [table reloadData];
}
-(void)checkForEndDate

{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterFullStyle;
    [df setDateFormat:@"EEE dd MMM yyyy hh:mm a"];
    NSDate *date=[df dateFromString:btn1.titleLabel.text];
       // NSLog(@"my date is %@",mydate);
    NSString *strHours=[NSString stringWithFormat:@"%@",btn3.titleLabel.text];
    int hours =[strHours intValue];
    NSTimeInterval hoursInSeconds = hours * 60 * 60;
    NSDate *dateAfterAddingHours = [date dateByAddingTimeInterval:hoursInSeconds];
    strEndDate=[NSString stringWithFormat:@"%@",[df stringFromDate:dateAfterAddingHours]];
    [btn2 setTitle:strEndDate forState:UIControlStateNormal];

//    NSString *strHours=[NSString stringWithFormat:@"%@",btn3.titleLabel.text];
//    NSArray *arrComponents=[strHours componentsSeparatedByString:@":"];
//   if([arrComponents count]==2)
//    {
//        NSInteger hours=[[arrComponents objectAtIndex:0] integerValue];
//        NSInteger seconds=[[arrComponents objectAtIndex:1] integerValue];
//        
//        NSDateFormatter *df = [[NSDateFormatter alloc] init];
//        df.dateStyle = NSDateFormatterFullStyle;
//        [df setDateFormat:@"EEE dd MMM yyyy HH:mm a"];
//        NSDate *date=[df dateFromString:btn1.titleLabel.text];
//        int intTotalSeconds =hours*60*60+seconds;
//        NSDate *newDate = [date dateByAddingTimeInterval:intTotalSeconds];
//        NSLog(@"new date is %@",[df stringFromDate:newDate]);
//        strEndDate=[NSString stringWithFormat:@"%@",[df stringFromDate:newDate]];
//        [btn2 setTitle:strEndDate forState:UIControlStateNormal];
//    }
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
    appDelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    array=[[NSMutableArray alloc]initWithObjects:@"Start",@"End",@"Worked",@"Rate/hour", nil];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(SaveBtnClicked:)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(CancelBtnClicked:)];
    
}
- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section 
{
    // Return the number of rows in the section.
    return [array count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"CellIdentifier";
    
    // Dequeue or create a cell of the appropriate type.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
        
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];            
    }
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    NSDictionary *dict=[appDelegate.array1 objectAtIndex:0];
    NSLog(@"array is %@",appDelegate.array1);
    btn4.titleLabel.text = [dict objectForKey:@"Rate/Hour"];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;   
    
    if (indexPath.row==0)
    {
        btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame=CGRectMake(80, 6, 220, 40);
        [btn1 setTitle:@"ShowStartDate" forState:UIControlStateNormal];
        [btn1.titleLabel setFont:[UIFont boldSystemFontOfSize:16] ];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(historyButtonPress1:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:btn1];
    }
    else if(indexPath.row==1)
    {
        btn2=[UIButton buttonWithType:UIButtonTypeCustom];
        btn2.frame=CGRectMake(80, 6, 220, 40);
        [btn2 setTitle:@"ShowEndDate" forState:UIControlStateNormal];
        [btn2.titleLabel setFont:[UIFont boldSystemFontOfSize:16] ];
        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cell addSubview:btn2];
        
    }
    else if(indexPath.row==2)
    {
        btn3=[UIButton buttonWithType:UIButtonTypeCustom];
        btn3.frame=CGRectMake(100, 6, 190, 40);
        [btn3 setTitle:@"SelectDuration" forState:UIControlStateNormal];
        [btn3.titleLabel setFont:[UIFont boldSystemFontOfSize:16] ];
        [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn3 addTarget:self action:@selector(historyButtonPress3:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:btn3];
    }
    else if(indexPath.row==3)
    {
        
        btn4=[UIButton buttonWithType:UIButtonTypeCustom];
        btn4.frame=CGRectMake(100, 6, 190, 40);
        [btn4 setTitle:[[appDelegate.array1 objectAtIndex:appDelegate.index] objectForKey:@"Rate/Hour"] forState:UIControlStateNormal];
        [btn4.titleLabel setFont:[UIFont boldSystemFontOfSize:16] ];
        [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cell addSubview:btn4];
        }
         return cell;
}

-(void)historyButtonPress1:(id)sender
{
    StartDateViewController *date=[[StartDateViewController alloc]initWithNibName:@"StartDateViewController" bundle:nil];
    date.delegate = self;
    [self.navigationController pushViewController:date animated:YES];
}
-(void)historyButtonPress3:(id)sender
{
    WorkedViewController *work=[[WorkedViewController alloc]initWithNibName:@"WorkedViewController" bundle:nil];
    work.delegate=self;
    [self.navigationController pushViewController:work animated:YES];
}
-(void)CancelBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)SaveBtnClicked:(id)sender
{
    
    NSDictionary *tableData=[[NSDictionary alloc]initWithObjectsAndKeys:btn1.titleLabel.text,@"TableStartDate",btn2.titleLabel.text,@"TableEndDate",btn3.titleLabel.text,@"Worked",btn4.titleLabel.text,@"TableRate/Hour", nil];
    
    
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
