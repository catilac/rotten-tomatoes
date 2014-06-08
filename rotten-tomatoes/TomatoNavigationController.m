//
//  TomatoNavigationController.m
//  rotten-tomatoes
//
//  Created by Chirag Davé on 6/8/14.
//  Copyright (c) 2014 Chirag Davé. All rights reserved.
//

#import "TomatoNavigationController.h"

@interface TomatoNavigationController ()

@end

@implementation TomatoNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationBar.barTintColor = [UIColor colorWithRed:1.0f green:0.702f blue:0 alpha:0.35f];
        self.navigationBar.tintColor = [UIColor colorWithRed:1.0f green:0 blue:0.298f alpha:1.0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
