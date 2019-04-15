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
	[self.toViewController setCompactLayoutWithFrame:self.startingFrame];
	[UIView animateWithDuration:[self transitionDuration:transitionContext]
						  delay:0
						options:UIViewAnimationOptionCurveEaseInOut
					 animations:^{
						 [self.toViewController setFullLayout];
					 }
					 completion:nil];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
	return 0.5;
}

@end
