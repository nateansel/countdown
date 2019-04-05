//
//  DismissTimeChangeViewControllerAnimatedTransitioning.m
//  Countdown
//
//  Created by Nathan Ansel on 4/5/19.
//  Copyright © 2019 Nathan Ansel. All rights reserved.
//

#import "DismissTimeChangeViewControllerAnimatedTransitioning.h"

@implementation DismissTimeChangeViewControllerAnimatedTransitioning

@end

@implementation DismissTimeChangeViewControllerAnimatedTransitioning (UIViewControllerAnimatedTransitioning)

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
	#warning Add animation
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
	return 0.5;
}

@end
