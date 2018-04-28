//
//  PhotoHeaderView.m
//  InstaKilo
//
//  Created by ruijia lin on 4/25/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "PhotoHeaderView.h"

@implementation PhotoHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _photoLabel = [UILabel new];;
        _photoLabel.backgroundColor = [UIColor redColor];
        self.backgroundColor = [UIColor cyanColor];
        
        _photoLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _photoLabel.text = @"Default";
        
        
        _photoLabel.frame = self.bounds;
        
        [self addSubview:_photoLabel];
//        [self setupView];


    }
    return self;
}

-(void)setupView
{
    
        [self.photoLabel.heightAnchor constraintEqualToConstant:5].active = YES;
        [self.photoLabel.widthAnchor constraintEqualToConstant:5].active = YES;
    
//        [self.photoLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
//        [self.photoLabel.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
//        [self.photoLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
//        [self.photoLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    
    
}

@end
