//
//  Photo.m
//  InstaKilo
//
//  Created by ruijia lin on 4/25/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageName = [NSString new];
        _category = [NSString new];
        _location = [NSString new];
    }
    return self;
}
@end
