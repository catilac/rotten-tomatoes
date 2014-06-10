//
//  MoviesViewController.h
//  rotten-tomatoes
//
//  Created by Chirag Davé on 6/5/14.
//  Copyright (c) 2014 Chirag Davé. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, APICall) {
    DVDMovies,
    BoxOfficeMovies,
    SearchMovies
};

@interface MoviesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) APICall apiCall;

@end
