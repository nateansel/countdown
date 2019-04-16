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
	UIView *containerView = transitionContext.containerView;
	containerView.frame = UIScreen.mainScreen.bounds;
	[containerView addSubview:self.toViewController.view];
	[self.toViewController.view setFrame:containerView.bounds];
	
	[self.toViewController setCompactLayoutWithFrame:self.startingFrame];
	[self.toViewController hideButtons];
	[UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
								   delay:0
								 options:UIViewKeyframeAnimationOptionCalculationModeCubic
							  animations:^{
								  [UIView addKeyframeWithRelativeStartTime:0
														  relativeDuration:1
																animations:^{
																	[self.toViewController setFullLayout];
																}];
								  [UIView addKeyframeWithRelativeStartTime:0.3
														  relativeDuration:0.6
																animations:^{
																	[self.toViewController displayButtons];
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
