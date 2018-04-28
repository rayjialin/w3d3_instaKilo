//
//  ViewController.m
//  InstaKilo
//
//  Created by ruijia lin on 4/24/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UISegmentedControl *segmentedControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:true];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // import photo data model - singleton
    self.photoModel = [PhotoModel sharedInstance];
    
    // UI setup
    self.navigationItem.title = @"InstaKilo";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    // collection view
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(self.view.frame.size.width / 4 -25, self.view.frame.size.width / 4 - 25);
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5 );
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 15;
    
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 0.05);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,
                                                                             self.view.frame.size.height * 0.25,
                                                                             self.view.frame.size.width,
                                                                             self.view.frame.size.height * 0.8) collectionViewLayout:layout];
    
    self.collectionView.userInteractionEnabled = YES;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    
    // segment control
    NSArray *segmentArray = [NSArray arrayWithObjects:@"Default", @"Category", @"Location", nil];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentArray];
    self.segmentedControl.frame = CGRectMake(0, 140, self.view.frame.size.width, self.view.frame.size.height * 0.08);
    [self.segmentedControl setSelectedSegmentIndex:0];
    self.segmentedControl.userInteractionEnabled = YES;
    [self.segmentedControl addTarget:self action:@selector(toggleCategories:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.view addSubview:self.segmentedControl];
    [self.view addSubview:self.collectionView];
    
    // setup collection view delegate
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:InstakiloCollectionViewCell.self
            forCellWithReuseIdentifier:@"collectionViewCellId"];
    [self.collectionView registerClass:PhotoHeaderView.self forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyHeaderView"];
    
    
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    InstakiloCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCellId"
                                                                                  forIndexPath:indexPath];
    
    Photo *photo = [self.photoModel.defaultArray objectAtIndex:indexPath.row];
    if (self.photoModel.sectionArray.count != 0){
        if (photo.category == [self.photoModel.sectionArray objectAtIndex:indexPath.section]){
            cell.photoView.image = [UIImage imageNamed:photo.imageName];
        }
        
    }else {
        cell.photoView.image = [UIImage imageNamed:photo.imageName];
    }
//    cell.photoView.image = [UIImage imageNamed:photo.imageName];

    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger occurence = 0;
    
    if (self.photoModel.sectionArray.count == 0){
        return self.photoModel.defaultArray.count;
    }
    
        for (Photo *photo in self.photoModel.defaultArray){
            if ([photo.category isEqualToString:[self.photoModel.sectionArray objectAtIndex:section]] || [photo.location isEqualToString:[self.photoModel.sectionArray objectAtIndex:section]]){
                occurence += 1;
            }
        }
        return occurence;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.frame.size.width * 0.4, self.view.frame.size.height * 0.4);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.photoModel.sectionArray.count != 0){
        return self.photoModel.sectionArray.count;
    }else
    return 1;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    PhotoHeaderView *photoHeaderView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                               withReuseIdentifier:@"MyHeaderView"
                                                                                      forIndexPath:indexPath];
    
    if (self.photoModel.sectionArray.count != 0){
    photoHeaderView.photoLabel.text = [self.photoModel.sectionArray objectAtIndex:indexPath.section];
    }
    return photoHeaderView;
}

-(void)toggleCategories:(UISegmentedControl *)sender{
    NSMutableArray *array = [NSMutableArray new];
    
    if (sender.selectedSegmentIndex == 1){
                for (Photo *photo in self.photoModel.defaultArray){
                    [array addObject:photo.category];
                }
        
    }else if (sender.selectedSegmentIndex == 2){
        for (Photo *photo in self.photoModel.defaultArray){
            [array addObject:photo.location];
        }
    }
    
            NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:array];
            self.photoModel.sectionArray = [NSMutableArray arrayWithArray:orderedSet.array];
    
    [self.collectionView reloadData];
}

@end
