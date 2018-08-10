//
//  CollectionViewCell.m
//  QSPMovedItemsView_Sample
//
//  Created by QSP on 2018/8/7.
//  Copyright © 2018年 Jingbeijinrong. All rights reserved.
//

#import "CollectionViewCell.h"
#import "CommonDefine.h"

@interface CollectionViewCell ()

@property (weak, nonatomic) UILabel *label;

@end

@implementation CollectionViewCell

- (void)setModel:(ItemModel *)model {
    _model = model;
    self.contentView.backgroundColor = model.color;
    self.label.text = model.title;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self settingUi];
    }
    
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self settingUi];
    }
    
    return self;
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath andModel:(ItemModel *)model {
    return [[self alloc] initWithCollectionView:collectionView indexPath:indexPath andModel:model];
}
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath andModel:(ItemModel *)model {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:K_CollectionViewCell_ID forIndexPath:indexPath];
    cell.model = model;
    
    return cell;
}

- (void)settingUi {
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:label];
    self.label = label;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.label.frame = self.contentView.frame;
}

@end
