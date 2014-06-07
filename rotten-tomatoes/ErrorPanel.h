//
//  ErrorPanel.h
//  rotten-tomatoes
//
//  Created by Chirag Davé on 6/6/14.
//  Copyright (c) 2014 Chirag Davé. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ErrorPanel : UIView

+ (ErrorPanel *)showErrorAddedToWithMessage:(UIView *)view message:(NSString *)message;
- (void)removeError;


@end
