//
//  PhotoModel.m
//  InstaKilo
//
//  Created by ruijia lin on 4/25/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "PhotoModel.h"

@implementation PhotoModel

+ (instancetype)sharedInstance
{
    static PhotoModel *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PhotoModel alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.defaultArray = [NSMutableArray new];
        self.categoryArray = [NSMutableArray new];
        self.locationArray = [NSMutableArray new];
        self.sectionArray = [NSMutableArray new];

        
        self.photo = [Photo new];
        self.photo.imageName = @"corgi0";
        self.photo.category = @"canine";
        self.photo.location = @"vancouver";
        self.photo.uid = 0;
        [self.defaultArray addObject:self.photo];
        
        self.photo = [Photo new];
        self.photo.imageName = @"corgi1";
        self.photo.category = @"canine";
        self.photo.location = @"vancouver";
        self.photo.uid = 1;
        [self.defaultArray addObject:self.photo];
        
        self.photo = [Photo new];
        self.photo.imageName = @"corgi2";
        self.photo.category = @"canine";
        self.photo.location = @"newyork";
        self.photo.uid = 2;
        [self.defaultArray addObject:self.photo];
        
        self.photo = [Photo new];
        self.photo.imageName = @"corgi3";
        self.photo.category = @"canine";
        self.photo.location = @"newyork";
        self.photo.uid = 3;
        [self.defaultArray addObject:self.photo];
        
        self.photo = [Photo new];
        self.photo.imageName = @"corgi4";
        self.photo.category = @"feline";
        self.photo.location = @"vancouver";
        self.photo.uid = 4;
        [self.defaultArray addObject:self.photo];
        
        self.photo = [Photo new];
        self.photo.imageName = @"corgi5";
        self.photo.category = @"feline";
        self.photo.location = @"toronto";
        self.photo.uid = 5;
        [self.defaultArray addObject:self.photo];
        
        self.photo = [Photo new];
        self.photo.imageName = @"corgi6";
        self.photo.category = @"human";
        self.photo.location = @"toronto";
        self.photo.uid = 6;
        [self.defaultArray addObject:self.photo];
        
        self.photo = [Photo new];
        self.photo.imageName = @"corgi7";
        self.photo.category = @"human";
        self.photo.location = @"vancouver";
        self.photo.uid = 7;
        [self.defaultArray addObject:self.photo];
        
        self.photo = [Photo new];
        self.photo.imageName = @"corgi8";
        self.photo.category = @"mammal";
        self.photo.location = @"vancouver";
        self.photo.uid = 8;
        [self.defaultArray addObject:self.photo];
        
        self.photo = [Photo new];
        self.photo.imageName = @"corgi9";
        self.photo.category = @"mammal";
        self.photo.location = @"seattle";
        self.photo.uid = 9;
        [self.defaultArray addObject:self.photo];
        
        //        self.photoArray = @[@"corgi0.png",
        //                            @"corgi1",
        //                            @"corgi2",
        //                            @"corgi3",
        //                            @"corgi4",
        //                            @"corgi5",
        //                            @"corgi6",
        //                            @"corgi7",
        //                            @"corgi8",
        //                            @"corgi9"];
    }
    return self;
}

@end
