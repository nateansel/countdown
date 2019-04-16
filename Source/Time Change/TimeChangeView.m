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
@property (nonatomic, strong, nonnull) UIView *backgroundView;
@property (nonatomic, strong, nonnull) PushDownButton *cancelButton;
@property (nonatomic, strong, nonnull) PushDownButton *saveButton;
@property bool shouldDisplayCompact;

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
	self.compactFrame = CGRectZero;
	self.shouldDisplayCompact = NO;
	self.dateButton = [[DateChangeButton alloc] init];
	self.countingDownLabel = [[UILabel alloc] init];
	self.backgroundView = [[UIView alloc] init];
	self.cancelButton = [[PushDownButton alloc] init];
	self.saveButton = [[PushDownButton alloc] init];
	
	[self addSubview:self.backgroundView];
	[self.backgroundView addSubview:self.cancelButton];
	[self.backgroundView addSubview:self.saveButton];
	[self.backgroundView addSubview:self.dateButton];
	
	// This view
	[self setBackgroundColor:[UIColor clearColor]];
	
	// Background view
	[self.backgroundView setClipsToBounds:YES];
	[self.backgroundView setBackgroundColor:self.dateButton.backgroundColor];
	[self.backgroundView.layer setShadowColor:self.dateButton.layer.shadowColor];
	[self.backgroundView.layer setShadowOffset:self.dateButton.layer.shadowOffset];
	[self.backgroundView.layer setShadowRadius:self.dateButton.layer.shadowRadius];
	[self.backgroundView.layer setShadowOpacity:self.dateButton.layer.shadowOpacity];
	[self.backgroundView.layer setCornerRadius:self.dateButton.layer.cornerRadius];
	
	[self.dateButton.layer setShadowOpacity:0];
	[self.dateButton setUserInteractionEnabled:NO];
	[self.dateButton setTranslatesAutoresizingMaskIntoConstraints:NO];
	[NSLayoutConstraint activateConstraints:@[[self.dateButton.topAnchor constraintEqualToAnchor:self.backgroundView.topAnchor],
											  [self.dateButton.centerXAnchor constraintEqualToAnchor:self.backgroundView.centerXAnchor]]];
	[self.dateButton setDate:[[NSDate alloc] init]];
	[self.dateButton setHidden:YES];
	
	// Cancel & Save buttons
	[self.cancelButton setBackgroundColor:[UIColor colorNamed:@"cancel_button"]];
	[self.cancelButton setTitleColor:[UIColor colorNamed:@"cancel_button_text"] forState:UIControlStateNormal];
	[self.cancelButton.layer setCornerRadius:8];
	[self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
	[self.cancelButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.saveButton setBackgroundColor:[UIColor colorNamed:@"save_button"]];
	[self.saveButton setTitleColor:[UIColor colorNamed:@"save_button_text"] forState:UIControlStateNormal];
	[self.saveButton.layer setCornerRadius:8];
	[self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
	[self.saveButton.titleLabel setFont:[UIFont systemFontOfSize:self.saveButton.titleLabel.font.pointSize weight:UIFontWeightBold]];
	[self.saveButton addTarget:self action:@selector(saveButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	[self layoutBackgroundView];
}

- (void)layoutBackgroundView {
	if (self.shouldDisplayCompact) {
		[self.backgroundView setFrame:self.compactFrame];
//		[self.cancelButton setAlpha:0];
//		[self.saveButton setAlpha:0];
		[self.layer setCornerRadius:self.compactFrame.size.height / 2];
	} else {
		CGRect safeAreaFrame = CGRectMake(self.frame.origin.x + self.safeAreaInsets.left,
										  self.frame.origin.y + self.safeAreaInsets.top,
										  self.frame.size.width - self.safeAreaInsets.left + self.safeAreaInsets.right,
										  self.frame.size.height - self.safeAreaInsets.top + self.safeAreaInsets.bottom);
		CGRect backgroundViewFrame = CGRectMake(safeAreaFrame.origin.x + 24,
												safeAreaFrame.origin.y,
												safeAreaFrame.size.width - (safeAreaFrame.origin.x + 24) - 24,
												safeAreaFrame.size.height - safeAreaFrame.origin.y - 24);
		[self.backgroundView setFrame:backgroundViewFrame];
		[self.backgroundView.layer setCornerRadius:24];
//		[self.cancelButton setAlpha:1];
//		[self.saveButton setAlpha:1];
	}
	self.cancelButton.frame = CGRectMake(16,
										 self.backgroundView.frame.size.height - (42 + 16),
										 (self.backgroundView.frame.size.width / 2) - 16 - 8,
										 42);
	self.saveButton.frame = CGRectMake(self.cancelButton.frame.origin.x + self.cancelButton.frame.size.width + 16,
									   self.cancelButton.frame.origin.y,
									   self.cancelButton.frame.size.width,
									   self.cancelButton.frame.size.height);
}

- (void)cancelButtonPressed:(PushDownButton *)sender {
	[self.delegate cancelButtonPressed];
}

- (void)saveButtonPressed:(PushDownButton *)sender {
	[self.delegate saveButtonPressed];
}

- (NSDate *)date {
	return [[NSDate alloc] init];
}

- (void)setDate:(NSDate *)date {
	[self.dateButton setDate:date];
}

- (void)hideButtons {
	[self.cancelButton setAlpha:0];
	[self.saveButton setAlpha:0];
}

- (void)displayButtons {
	[self.cancelButton setAlpha:1];
	[self.saveButton setAlpha:1];
}

- (void)setCompactLayoutWithFrame:(CGRect)frame {
	self.shouldDisplayCompact = YES;
	self.compactFrame = frame;
	[self layoutBackgroundView];
}

- (void)setFullLayout {
	self.shouldDisplayCompact = NO;
	[self layoutBackgroundView];
}

@end
