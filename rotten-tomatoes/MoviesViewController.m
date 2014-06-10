//
//  MoviesViewController.m
//  rotten-tomatoes
//
//  Created by Chirag Davé on 6/5/14.
//  Copyright (c) 2014 Chirag Davé. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieCell.h"
#import "MovieViewController.h"
#import "Movie.h"
#import "MBProgressHUD.h"
#import "ErrorPanel.h"

@interface MoviesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) NSArray *movies;

@end

@implementation MoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"MoviesViewController" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *) getAPIEndpoint {
    switch (self.apiCall) {
        case DVDMovies:
            return @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=7axwganmenhrsju2wpaxu42s";
            break;
        case BoxOfficeMovies:
            return @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=7axwganmenhrsju2wpaxu42s";
            break;
        case SearchMovies:
            return @"http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=7axwganmenhrsju2wpaxu42s";
            break;
    }
}


- (void)handleRefresh {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self getAPIEndpoint]]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError != nil) {
            [ErrorPanel showErrorAddedToWithMessage:self.view message:@"Network Error"];
        } else {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            if (object[@"error"] != nil) {
                [ErrorPanel showErrorAddedToWithMessage:self.view message:@"Network Error"];
            } else {
                self.movies = [Movie moviesWithArray:object[@"movies"]];
                [self.tableView reloadData];
            }
        }
        
        [self.refreshControl endRefreshing];
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 130;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(handleRefresh) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"];

    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self getAPIEndpoint]]];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError != nil) {
            [hud hide:YES];
            [ErrorPanel showErrorAddedToWithMessage:self.view message:@"Network Error"];
        } else {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", object);
            
            if (object[@"error"] != nil) {
                [ErrorPanel showErrorAddedToWithMessage:self.view message:@"Network Error"];
            } else {
                self.movies = [Movie moviesWithArray:object[@"movies"]];
                [self.tableView reloadData];
            }

            [hud hide:YES];
        }
    }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *movieCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    Movie *movie = self.movies[indexPath.row];

    movieCell.titleLabel.text = movie.title;
    movieCell.synopsisLabel.text = movie.synopsis;
    [movieCell.posterView setImageWithURL:[movie getProfilePosterURL]];
    [movieCell.posterView fadeIn];
    
    return movieCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Movie *movie = self.movies[indexPath.row];
    [self.navigationController pushViewController:[[MovieViewController alloc] initWithMovie:movie] animated:YES];
}



@end
