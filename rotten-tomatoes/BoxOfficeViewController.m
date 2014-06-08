//
//  BoxOfficeViewController.m
//  rotten-tomatoes
//
//  Created by Chirag Davé on 6/8/14.
//  Copyright (c) 2014 Chirag Davé. All rights reserved.
//

#import "BoxOfficeViewController.h"

@interface BoxOfficeViewController ()

@end

@implementation BoxOfficeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Box Office";
        self.apiEndpoint = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=7axwganmenhrsju2wpaxu42s";

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
