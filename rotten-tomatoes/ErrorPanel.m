//
//  ErrorPanel.m
//  rotten-tomatoes
//
//  Created by Chirag Davé on 6/6/14.
//  Copyright (c) 2014 Chirag Davé. All rights reserved.
//

#import "ErrorPanel.h"

@interface ErrorPanel ()

@property (nonatomic, strong) UILabel *msgLabel;

@end

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
                                                                  view.frame.size.height * 0.1f)];
    errPanel.transform = CGAffineTransformMakeScale(1,0);
    [errPanel setMessage:message];
    [view addSubview:errPanel];
    [UIView animateWithDuration:0.25f animations:^{
        errPanel.transform = CGAffineTransformIdentity;
    }];
    
    [errPanel performSelector:@selector(removeError) withObject:nil afterDelay:1.5];
    
    return errPanel;
}

- (void)setMessage:(NSString *)message {
    self.msgLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.msgLabel.text = message;
    self.msgLabel.backgroundColor = [UIColor clearColor];
    self.msgLabel.textColor = [UIColor whiteColor];
    self.msgLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0f];
    self.msgLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.msgLabel];

}

- (void)removeError {
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    [UIView animateWithDuration:0.25f animations:^{
        self.alpha = 0.0f;
        self.transform = CGAffineTransformMakeTranslation(-width, 0);
    }
    completion:^(BOOL completed){
        if (completed) {
            [self removeFromSuperview];
        }
    }];
    

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
