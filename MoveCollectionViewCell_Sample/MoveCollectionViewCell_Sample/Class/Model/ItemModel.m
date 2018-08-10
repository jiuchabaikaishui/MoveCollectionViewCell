//
//  ItemModel.m
//  QSPMovedItemsView_Sample
//
//  Created by QSP on 2018/8/7.
//  Copyright © 2018年 Jingbeijinrong. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel

+ (instancetype)modelCreat:(void (^)(ItemModel *model))block {
    ItemModel *model = [[ItemModel alloc] init];
    if (block) {
        block(model);
    }
    
    return model;
}
- (ItemModel * (^)(UIColor *color))colorSet {
    return ^(UIColor *color) {
        self.color = color;
        
        return self;
    };
}
- (ItemModel * (^)(NSString *title))titleSet {
    return ^(NSString *title) {
        self.title = title;
        
        return self;
    };
}

@end
