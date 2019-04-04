//
//  PresentTimeChangeViewControllerAnimatedTransitioning.m
//  Countdown
//
//  Created by Nathan Ansel on 4/4/19.
//  Copyright © 2019 Nathan Ansel. All rights reserved.
//

#import "PresentTimeChangeViewControllerAnimatedTransitioning.h"

@implementation PresentTimeChangeViewControllerAnimatedTransitioning

@end

@implementation PresentTimeChangeViewControllerAnimatedTransitioning (UIViewControllerAnimatedTransitioning)

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
	#warning Add animation
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
	return 0.5;
}

@end
