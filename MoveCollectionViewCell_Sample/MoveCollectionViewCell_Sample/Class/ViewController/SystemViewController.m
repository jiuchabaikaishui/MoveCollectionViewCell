//
//  SystemViewController.m
//  MovedItemsView_Simple
//
//  Created by QSP on 2018/8/7.
//  Copyright © 2018年 Jingbeijinrong. All rights reserved.
//

#import "SystemViewController.h"
#import "CommonDefine.h"
#import "ItemModel.h"
#import "CollectionViewCell.h"

@interface SystemViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic, readonly) NSMutableArray *dataArr;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SystemViewController
@synthesize dataArr = _dataArr;

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        NSArray *arr = @[
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"0").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"1").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"2").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"3").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"4").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"5").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"6").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"7").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"8").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"9").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"10").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"11").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"12").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"13").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"14").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"15").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"16").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"17").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"18").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"19").colorSet(K_Random_Color);
                        }],
                        [ItemModel modelCreat:^(ItemModel *model) {
                            model.titleSet(@"20").colorSet(K_Random_Color);
                        }]
                    ];
        
        _dataArr = [NSMutableArray arrayWithArray:arr];
    }
    
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width = (K_Screen_Width - 50)/3.0;
    layout.itemSize = CGSizeMake(width, width);
    layout.minimumLineSpacing = 10.0;
    layout.minimumInteritemSpacing = 10.0;
    layout.sectionInset = UIEdgeInsetsMake(15.0, 15.0, 15.0, 15.0);
    [self.collectionView setCollectionViewLayout:layout];
    [self.collectionView registerClass:CollectionViewCell.class forCellWithReuseIdentifier:K_CollectionViewCell_ID];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    [self.collectionView addGestureRecognizer:longPress];
}

#pragma mark - 触摸点击事件
- (void)longPressAction:(UILongPressGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            [self.collectionView updateInteractiveMovementTargetPosition:point];
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            [self.collectionView endInteractiveMovement];
            break;
        }
        case UIGestureRecognizerStateCancelled:
        {
            [self.collectionView cancelInteractiveMovement];
            break;
        }
            
        default:
            break;
    }
}

#pragma mark - <UICollectionViewDataSource, UICollectionViewDelegate> 代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [CollectionViewCell cellWithCollectionView:collectionView indexPath:indexPath andModel:[self.dataArr objectAtIndex:indexPath.row]];
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    ItemModel *model = [self.dataArr objectAtIndex:sourceIndexPath.row];
    [self.dataArr removeObjectAtIndex:sourceIndexPath.row];
    [self.dataArr insertObject:model atIndex:destinationIndexPath.row];
}

@end
