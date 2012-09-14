//
//  JobsViewController.m
//  HoursTracker
//
//  Created by Nagendra on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JobsViewController.h"

@implementation JobsViewController
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
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"array is %@",appDelegate.array1);

    tblView=(UITableView*)[self.view viewWithTag:111];

    [tblView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    appDelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Addjob" style:UIBarButtonItemStyleBordered target:self action:@selector(addjobBtnClicked:)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Tools" style:UIBarButtonItemStyleBordered target:self action:@selector(ToolsBtnClicked:)];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section 
{
    // Return the number of rows in the section.
    return [appDelegate.array1 count];
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
    NSDictionary *dict=[appDelegate.array1 objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"jobname"];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;   
    
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"logo-icon.png"]];
    //cell.selectedBackgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo-icon.png"]];
    //tblView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"images.jpeg"]];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    appDelegate.index=indexPath.row;
    UIActionSheet *actionsheet=[[UIActionSheet alloc]initWithTitle:@"Details" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"ManualEntry",@"ClockinNow",@"StartClockAt",@"ViewDetails",nil];
    [actionsheet showInView:self.view];
    [actionsheet release];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    DesignViewController *design=[[DesignViewController alloc]initWithNibName:@"DesignViewController" bundle:nil];
    [self.navigationController pushViewController:design animated:YES];
}
-(void)addjobBtnClicked:(id)sender
{
    AddJobViewController *job=[[AddJobViewController alloc]initWithNibName:@"AddJobViewController" bundle:nil];
    [self.navigationController pushViewController:job animated:YES];
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
