//
//  InstakiloCollectionViewCell.m
//  InstaKilo
//
//  Created by ruijia lin on 4/24/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "InstakiloCollectionViewCell.h"

@implementation InstakiloCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.photoView = [[UIImageView alloc] initWithFrame: self.bounds];
        self.photoView.translatesAutoresizingMaskIntoConstraints = false;
        self.photoView.contentMode = UIViewContentModeScaleAspectFill;
        //        self.photoView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        self.photoView.clipsToBounds = YES;
        [self addSubview:self.photoView];
    }
    return self;
}


-(void)setupView{
//    [self.photoView.widthAnchor constraintEqualToAnchor:self.widthAnchor].active = YES;
//    [self.photoView.heightAnchor constraintEqualToAnchor:self.heightAnchor].active = YES;
    [self.photoView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.photoView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [self.photoView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [self.photoView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    
}


@end
