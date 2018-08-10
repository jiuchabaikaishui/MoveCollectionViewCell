//
//  CollectionViewCell.h
//  QSPMovedItemsView_Sample
//
//  Created by QSP on 2018/8/7.
//  Copyright © 2018年 Jingbeijinrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"

@interface CollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) ItemModel *model;

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath andModel:(ItemModel *)model;
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath andModel:(ItemModel *)model;

@end
