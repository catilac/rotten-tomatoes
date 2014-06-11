//
//  MovieViewController.m
//  rotten-tomatoes
//
//  Created by Chirag Davé on 6/6/14.
//  Copyright (c) 2014 Chirag Davé. All rights reserved.
//

#import "MovieViewController.h"
#import "PosterImageView.h"
#import "Movie.h"

@interface MovieViewController ()
@property (weak, nonatomic) IBOutlet PosterImageView *posterImage;
@property (weak, nonatomic) IBOutlet UIScrollView *movieInfo;
@property (strong, nonatomic) UIView *container;
@property (strong, nonatomic) UILabel *movieTitle;
@property (strong, nonatomic) UILabel *movieSynopsis;

@property (nonatomic, weak) Movie *movie;

@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithMovie:(Movie *)movie {
    self = [super init];
    if (self) {
        self.movie = movie;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = self.movie.title;
    

    CGRect scrollViewFrame = self.movieInfo.frame;
    
    self.container = [[UIView alloc] initWithFrame:CGRectMake(0, scrollViewFrame.size.height/2, scrollViewFrame.size.width, scrollViewFrame.size.height*2.1f)];
    [self.container setBackgroundColor:[UIColor colorWithRed:.0f green:.0f blue:.0f alpha:0.5f]];
    
    CGRect movieTitleFrame = CGRectMake(5, 0, scrollViewFrame.size.width, scrollViewFrame.size.height * 0.1);
    self.movieTitle = [[UILabel alloc] initWithFrame:movieTitleFrame];
    self.movieTitle.textColor = [UIColor whiteColor];
    self.movieTitle.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:16];
    self.movieTitle.text = self.movie.title;

    
    CGRect movieSynopsisFrame = CGRectMake(5, 45, scrollViewFrame.size.width, scrollViewFrame.size.height * 0.9);
    self.movieSynopsis = [[UILabel alloc] initWithFrame:movieSynopsisFrame];
    self.movieSynopsis.textColor = [UIColor whiteColor];
    self.movieSynopsis.font = [UIFont fontWithName:@"Helvetica-Neue" size:16];
    self.movieSynopsis.text = self.movie.synopsis;
    self.movieSynopsis.numberOfLines = 0;
    [self.movieSynopsis sizeToFit];

    [self.container addSubview:self.movieTitle];
    [self.container addSubview: self.movieSynopsis];

    
    [self.movieInfo setContentSize:CGSizeMake(self.container.frame.size.width, self.container.frame.size.height)];
    
    [self.movieInfo addSubview:self.container];
    
    [self.posterImage setImageWithURL:[self.movie getProfilePosterURL]];
    [self.posterImage setImageWithURL:[self.movie getDetailedPosterURL] placeholderImage:self.posterImage.image];
    
    [self.posterImage fadeIn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
