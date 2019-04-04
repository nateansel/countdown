//
//  PushDownButton.m
//  Countdown
//
//  Created by Nathan Ansel on 11/27/18.
//  Copyright © 2018 Nathan Ansel. All rights reserved.
//

#import "PushDownButton.h"

@interface PushDownButton ()

@property bool isPushedDown;
@property bool isAnimating;
@property CGFloat originalShadowRadius;
@property (nonatomic, copy, nullable) void (^animationsToComplete)(void);

@end

@implementation PushDownButton

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self pushDownCommonInit];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if (self) {
		[self pushDownCommonInit];
	}
	return self;
}

- (void)pushDownCommonInit {
	self.isPushedDown = NO;
	self.isAnimating = NO;
	self.originalShadowRadius = 0;
	[self addTarget:self action:@selector(animatePushDown) forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
	[self addTarget:self action:@selector(animateRelease) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchCancel | UIControlEventTouchDragExit];
}

- (void)animatePushDown {
	if (!self.isAnimating) {
		[self tapDown];
		self.isAnimating = YES;
		self.originalShadowRadius = self.layer.shadowRadius;
		[UIView animateWithDuration:0.1
							  delay:0
							options:UIViewAnimationOptionCurveEaseInOut
						 animations:^{
							 [self setTransform:CGAffineTransformMakeScale(0.985, 0.985)];
							 CABasicAnimation *animation = [[CABasicAnimation alloc] init];
							 [animation setKeyPath:@"shadowRadius"];
							 [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
							 [animation setFromValue:[[NSNumber alloc] initWithFloat:self.layer.shadowRadius]];
							 [animation setToValue:[[NSNumber alloc] initWithFloat:0]];
							 [animation setDuration:0.1];
							 [self.layer addAnimation:animation forKey:[animation keyPath]];
							 [self.layer setShadowRadius:0];
						 }
						 completion:^(BOOL finished) {
							 self.isAnimating = NO;
							 if (self.animationsToComplete) {
								 self.animationsToComplete();
								 self.animationsToComplete = nil;
							 }
						 }];
	} else {
		__weak typeof(self) weakSelf = self;
		self.animationsToComplete = ^{
			__strong typeof(self) strongSelf = weakSelf;
			if (strongSelf) {
				[strongSelf animatePushDown];
			}
		};
	}
}

- (void)animateRelease {
	if (!self.isAnimating) {
		self.isAnimating = YES;
		[UIView animateWithDuration:0.1
							  delay:0
							options:UIViewAnimationOptionCurveEaseInOut
						 animations:^{
							 [self setTransform:CGAffineTransformIdentity];
							 CABasicAnimation *animation = [[CABasicAnimation alloc] init];
							 [animation setKeyPath:@"shadowRadius"];
							 [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
							 [animation setFromValue:[[NSNumber alloc] initWithFloat:self.layer.shadowRadius]];
							 [animation setToValue:[[NSNumber alloc] initWithFloat:self.originalShadowRadius]];
							 [animation setDuration:0.1];
							 [self.layer addAnimation:animation forKey:[animation keyPath]];
							 [self.layer setShadowRadius:self.originalShadowRadius];
						 }
						 completion:^(BOOL finished) {
							 self.isAnimating = NO;
							 if (self.animationsToComplete) {
								 self.animationsToComplete();
								 self.animationsToComplete = nil;
							 }
						 }];
	} else {
		__weak typeof(self) weakSelf = self;
		self.animationsToComplete = ^{
			__strong typeof(self) strongSelf = weakSelf;
			if (strongSelf) {
				[strongSelf animateRelease];
			}
		};
	}
}

- (void)tapDown {
	UISelectionFeedbackGenerator *feedbackGenerator = [[UISelectionFeedbackGenerator alloc] init];
	[feedbackGenerator selectionChanged];
}

- (void)tapRelease {
	UISelectionFeedbackGenerator *feedbackGenerator = [[UISelectionFeedbackGenerator alloc] init];
	[feedbackGenerator selectionChanged];
}

@end
