//
//  CountdownViewController.h
//  Countdown
//
//  Created by Nathan Ansel on 11/20/18.
//  Copyright © 2018 Nathan Ansel. All rights reserved.
//

@import UIKit;
#import "CountdownView.h"
#import "PresentTimeChangeViewControllerAnimatedTransitioning.h"

NS_ASSUME_NONNULL_BEGIN

@interface CountdownViewController : UIViewController

@end

// MARK: - UIViewControllerTransitioningDelegate

@interface CountdownViewController (UIViewControllerTransitioningDelegate) <UIViewControllerTransitioningDelegate>

@end

NS_ASSUME_NONNULL_END
