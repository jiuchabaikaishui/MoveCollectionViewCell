//
//  ItemModel.h
//  QSPMovedItemsView_Sample
//
//  Created by QSP on 2018/8/7.
//  Copyright © 2018年 Jingbeijinrong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^Block)(id model);

@interface ItemModel : NSObject

@property (strong, nonatomic) UIColor *color;
@property (copy, nonatomic) NSString *title;

+ (instancetype)modelCreat:(void (^)(ItemModel *model))block;
- (ItemModel * (^)(UIColor *color))colorSet;
- (ItemModel * (^)(NSString *title))titleSet;

@end
