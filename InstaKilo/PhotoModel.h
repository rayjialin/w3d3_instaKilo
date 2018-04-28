//
//  PhotoModel.h
//  InstaKilo
//
//  Created by ruijia lin on 4/25/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"

@interface PhotoModel : NSObject

@property (nonatomic) NSMutableArray *defaultArray;
@property (nonatomic) NSMutableArray *locationArray;
@property (nonatomic) NSMutableArray *categoryArray;
@property (nonatomic) NSMutableArray *sectionArray;

@property (nonatomic) Photo *photo;
+ (instancetype)sharedInstance;
@end
