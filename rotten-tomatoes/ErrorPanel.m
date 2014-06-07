//
//  ErrorPanel.m
//  rotten-tomatoes
//
//  Created by Chirag Davé on 6/6/14.
//  Copyright (c) 2014 Chirag Davé. All rights reserved.
//

#import "ErrorPanel.h"

@implementation ErrorPanel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:1.0f green:0.45f blue:0.0f alpha:0.95f];
    }
    return self;
}

+ (ErrorPanel *)showErrorAddedToWithMessage:(UIView *)view message:(NSString *)message {
    ErrorPanel *errPanel = [[self alloc] initWithFrame:CGRectMake(view.frame.origin.x,
                                                                  view.frame.origin.y + 63,
                                                                  view.frame.size.width,
                                                                  view.frame.size.height*0.1)];
    UILabel *label = [[UILabel alloc] initWithFrame:errPanel.bounds];
    label.text = message;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0f];
    label.textAlignment = NSTextAlignmentCenter;
    [errPanel addSubview:label];
    [view addSubview:errPanel];
    
    [errPanel performSelector:@selector(removeError) withObject:nil afterDelay:1.5];
    
    return errPanel;
}

- (void)removeError {
    [self removeFromSuperview];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/*
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
