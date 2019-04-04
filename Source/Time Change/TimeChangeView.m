//
//  TimeChangeView.m
//  Countdown
//
//  Created by Nathan Ansel on 12/4/18.
//  Copyright © 2018 Nathan Ansel. All rights reserved.
//

#import "TimeChangeView.h"

@interface TimeChangeView ()

@property (nonatomic, strong, nonnull) DateChangeButton *dateButton;
@property (nonatomic, strong, nonnull) UILabel *countingDownLabel;

@end

@implementation TimeChangeView

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self commonTimeChangeViewInit];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if (self) {
		[self commonTimeChangeViewInit];
	}
	return self;
}

- (void)commonTimeChangeViewInit {
	for (UIView *view in @[self.dateButton,
						   self.countingDownLabel]) {
		[view setTranslatesAutoresizingMaskIntoConstraints:NO];
		[self addSubview:view];
	}
	
}

@end
