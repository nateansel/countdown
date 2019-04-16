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
	UIView *containerView = transitionContext.containerView;
	containerView.frame = UIScreen.mainScreen.bounds;
	[containerView addSubview:self.fromViewController.view];
	[self.fromViewController.view setFrame:containerView.bounds];
	
	[UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
								   delay:0
								 options:UIViewKeyframeAnimationOptionCalculationModeCubic
							  animations:^{
								  [UIView addKeyframeWithRelativeStartTime:0
														  relativeDuration:1
																animations:^{
																	[self.fromViewController setCompactLayoutWithFrame:self.endingFrame];
																}];
								  [UIView addKeyframeWithRelativeStartTime:0.1
														  relativeDuration:0.6
																animations:^{
																	[self.fromViewController hideButtons];
																}];
							  }
							  completion:^(BOOL finished) {
								  [transitionContext completeTransition:YES];
							  }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
	return 0.35;
}

@end
