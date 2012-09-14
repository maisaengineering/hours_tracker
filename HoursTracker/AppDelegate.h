//
//  AppDelegate.h
//  HoursTracker
//
//  Created by Nagendra on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSMutableArray *array1;
    NSInteger index;
    
}
@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,retain) NSMutableArray *array1;
@property(nonatomic,assign)NSInteger index;

@end
