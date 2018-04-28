//
//  ViewController.h
//  InstaKilo
//
//  Created by ruijia lin on 4/24/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstakiloCollectionViewCell.h"
#import "PhotoModel.h"
#import "Photo.h"
#import "PhotoHeaderView.h"

@interface ViewController : UIViewController

@property (nonatomic) PhotoModel *photoModel;
@property (nonatomic) Photo *photo;

@end

