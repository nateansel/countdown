//
//  DismissTimeChangeViewControllerAnimatedTransitioning.h
//  Countdown
//
//  Created by Nathan Ansel on 4/5/19.
//  Copyright © 2019 Nathan Ansel. All rights reserved.
//

@import UIKit;
#import "TimeChangeViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DismissTimeChangeViewControllerAnimatedTransitioning : NSObject

@end

// MARK: - UIViewControllerAnimatedTransitioning

@interface DismissTimeChangeViewControllerAnimatedTransitioning  (UIViewControllerAnimatedTransitioning) <UIViewControllerAnimatedTransitioning>

@end

NS_ASSUME_NONNULL_END
