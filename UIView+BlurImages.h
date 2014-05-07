//
// Created by David Tucker on 1/4/14.
// Copyright (c) 2014 David Tucker. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    DATBlurTypeUndefined = 0,
    DATBlurTypeLight = 1,
    DATBlurTypeExtraLight = 2,
    DATBlurTypeDark = 3
} DATBlurType;

@interface UIView (BlurImages)

- (UIImageView *)DAT_blurredImageView:(DATBlurType)blurType;

@end