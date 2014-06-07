//
//  Movie.m
//  rotten-tomatoes
//
//  Created by Chirag Davé on 6/6/14.
//  Copyright (c) 2014 Chirag Davé. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[@"title"];
        self.poster = dictionary[@"posters"];
        self.synopsis = dictionary[@"synopsis"];
    }
    
    return self;
}

- (NSURL *)getDetailedPosterURL {
    return [[NSURL alloc] initWithString:self.poster[@"detailed"]];
}

- (NSURL *)getProfilePosterURL {
    return [[NSURL alloc] initWithString:self.poster[@"profile"]];
}

+ (NSArray *)moviesWithArray:(NSArray *)array {
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    for (NSDictionary *dictionary in array) {
        Movie *movie = [[Movie alloc] initWithDictionary:dictionary];
        [movies addObject:movie];
    }
    
    return movies;
}

@end
