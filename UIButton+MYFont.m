//
//  UIButton+MYFont.m
//  XXFontAdaptation
//
//  Created by xiangxx on 16/6/7.
//  Copyright © 2016年 xiangxx. All rights reserved.
//

#import "UIButton+MYFont.h"

#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SizeScale ((IPHONE_HEIGHT > 568) ? IPHONE_HEIGHT/568 : 1)

@implementation UIButton (MYFont)

@end

@implementation UIButton(myFont)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder *)aDecode{

    [self myInitWithCoder:aDecode];
    if (self) {
        // 部分不想改变字体的 把tag值设置成555跳过
        if (self.titleLabel.tag != 555) {
            CGFloat fontSize = self.titleLabel.font.pointSize;
            self.titleLabel.font = [UIFont systemFontOfSize:fontSize * SizeScale];
        }
    }
    return self;
}

@end

@implementation UILabel(myFont)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder *)aDecode{
    
    [self myInitWithCoder:aDecode];
    if (self) {
        // 部分不想改变字体的 把tag值设置成555跳过
        if (self.tag != 555) {
            CGFloat fontSize = self.font.pointSize;
            self.font = [UIFont systemFontOfSize:fontSize * SizeScale];
        }
    }
    return self;
}

@end

