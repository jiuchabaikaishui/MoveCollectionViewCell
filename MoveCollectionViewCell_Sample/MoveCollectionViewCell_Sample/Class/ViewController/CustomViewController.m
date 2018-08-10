//
//  CustomViewController.m
//  QSPMovedItemsView_Sample
//
//  Created by QSP on 2018/8/7.
//  Copyright © 2018年 Jingbeijinrong. All rights reserved.
//

#import "CustomViewController.h"
#import "CommonDefine.h"
#import "ItemModel.h"
#import "CollectionViewCell.h"

@interface CustomViewController ()

@property (strong, nonatomic, readonly) NSMutableArray *dataArr;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation CustomViewController
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
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    static UIImageView *imageView;
    static NSIndexPath *sourceIP;
    static NSIndexPath *lastIP;
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            if (cell) {
                UIGraphicsBeginImageContext(cell.bounds.size);
                [cell.layer renderInContext:UIGraphicsGetCurrentContext()];
                UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                imageView = [[UIImageView alloc] initWithImage:image];
                imageView.frame = [self.collectionView convertRect:cell.frame toView:self.view];
                [self.view addSubview:imageView];
                cell.hidden = YES;
                
                [UIView animateWithDuration:0.3 animations:^{
                    imageView.alpha = 0.7;
                    CGPoint p = [sender locationInView:self.view];
                    CGFloat W = imageView.frame.size.width*1.1;
                    CGFloat H = imageView.frame.size.height*1.1;
                    imageView.frame = CGRectMake(p.x - W/2.0, p.y - H/2.0, W, H);
                }];
                sourceIP = indexPath;
                lastIP = indexPath;
            }
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            imageView.center = [sender locationInView:self.view];
            if (cell && imageView && indexPath) {
                if (lastIP.section == indexPath.section && lastIP.row == indexPath.row) {
                    return;
                } else {
                    ItemModel *model = [self.dataArr objectAtIndex:sourceIP.row];
                    [self.dataArr removeObject:model];
                    [self.dataArr insertObject:model atIndex:indexPath.row];
                    [self.collectionView moveItemAtIndexPath:lastIP toIndexPath:indexPath];
                }
                lastIP = indexPath;
            }
            break;
        }
            
        default:
        {
            UICollectionViewCell *lastCell = [self.collectionView cellForItemAtIndexPath:lastIP];
            lastCell.hidden = NO;
            [imageView removeFromSuperview];
            imageView = nil;
            sourceIP = nil;
            lastIP = nil;
            break;
        }
    }
}

#pragma mark - <UICollectionViewDataSource, UICollectionViewDelegate> 代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [CollectionViewCell cellWithCollectionView:collectionView indexPath:indexPath andModel:[self.dataArr objectAtIndex:indexPath.row]];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
}

@end
