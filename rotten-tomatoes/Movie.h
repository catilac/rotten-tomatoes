//
//  Movie.h
//  rotten-tomatoes
//
//  Created by Chirag Davé on 6/6/14.
//  Copyright (c) 2014 Chirag Davé. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSDictionary *poster;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (NSURL *)getProfilePosterURL;
- (NSURL *)getDetailedPosterURL;

+ (NSArray *)moviesWithArray:(NSArray *)array;

@end
