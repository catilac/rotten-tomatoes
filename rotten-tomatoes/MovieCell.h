//
//  MovieCell.h
//  rotten-tomatoes
//
//  Created by Chirag Davé on 6/5/14.
//  Copyright (c) 2014 Chirag Davé. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterImageView.h"

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet PosterImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end
