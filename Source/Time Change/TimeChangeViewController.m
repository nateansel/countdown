//
//  TimeChangeViewController.m
//  Countdown
//
//  Created by Nathan Ansel on 12/4/18.
//  Copyright © 2018 Nathan Ansel. All rights reserved.
//

#import "TimeChangeViewController.h"

@interface TimeChangeViewController ()

@property (weak, nullable) TimeChangeView *timeChangeView;
@property (weak, nullable) NSDate *timeChangeDate;

@end

@implementation TimeChangeViewController

- (UIModalTransitionStyle)modalTransitionStyle {
	return UIModalTransitionStyleCoverVertical;
}

- (UIModalPresentationStyle)modalPresentationStyle {
	return UIModalPresentationOverCurrentContext;
}

- (void)loadView {
	self.view = [[TimeChangeView alloc] init];
	self.timeChangeView = (TimeChangeView *) self.view;
	self.timeChangeView.delegate = self;
	[self.timeChangeView setDate:self.timeChangeDate];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view setNeedsLayout];
	[self.view layoutIfNeeded];
}

- (void)setDate:(NSDate *)date {
	self.timeChangeDate = date;
	[self.timeChangeView setDate:date];
}

- (void)hideButtons {
	[self.timeChangeView hideButtons];
}

- (void)displayButtons {
	[self.timeChangeView displayButtons];
}

- (void)setCompactLayoutWithFrame:(CGRect)frame {
	[self.timeChangeView setCompactLayoutWithFrame:frame];
}

- (void)setFullLayout {
	[self.timeChangeView setFullLayout];
}

@end

// MARK: - TimeChangeViewDelegate

@implementation TimeChangeViewController (TimeChangeViewDelegate)

- (void)cancelButtonPressed {
	[self.delegate cancelTimeChange];
}

- (void)saveButtonPressed {
	[self.delegate saveNewCountdownTime:[self.timeChangeView date]];
}

@end
