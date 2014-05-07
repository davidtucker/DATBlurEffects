//
// Created by David Tucker on 1/4/14.
// Copyright (c) 2014 David Tucker. All rights reserved.
//

#import "UIView+BlurImages.h"
#import "UIImage+ImageEffects.h"

@implementation UIView (BlurImages)

- (UIImageView *)DAT_blurredImageView:(DATBlurType)blurType
{
    // Create the image context
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);

    // There he is! The new API method
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];

    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *blurredSnapshotImage = nil;
    
    switch(blurType)
    {
        case DATBlurTypeLight:
            blurredSnapshotImage = [snapshotImage applyLightEffect];
            break;
            
        case DATBlurTypeExtraLight:
            blurredSnapshotImage = [snapshotImage applyExtraLightEffect];
            break;
            
        case DATBlurTypeDark:
        case DATBlurTypeUndefined:
            blurredSnapshotImage = [snapshotImage applyDarkEffect];
            break;
            
        default:
            blurredSnapshotImage = [snapshotImage applyLightEffect];
            break;
    }

    // Be nice and clean your mess up
    UIGraphicsEndImageContext();

    return [[UIImageView alloc] initWithImage:blurredSnapshotImage];
}

@end