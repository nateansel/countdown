//
//  CountdownView.m
//  Thanksgiving
//
//  Created by Nathan Ansel on 11/20/18.
//  Copyright © 2018 Nathan Ansel. All rights reserved.
//

#import "CountdownView.h"

// MARK: - Private Properties

@interface CountdownView ()

// MARK: Labels

@property (strong, nonatomic) UILabel *hoursFirstDigitLabel;
@property (strong, nonatomic) UILabel *hoursSecondDigitLabel;
@property (strong, nonatomic) UILabel *minutesFirstDigitLabel;
@property (strong, nonatomic) UILabel *minutesSecondDigitLabel;
@property (strong, nonatomic) UILabel *secondsFirstDigitLabel;
@property (strong, nonatomic) UILabel *secondsSecondDigitLabel;
@property (strong, nonatomic) UILabel *separatorOneLabel;
@property (strong, nonatomic) UILabel *separatorTwoLabel;
@property (strong, nonatomic) UILabel *countdownToDateTitleLabel;
@property (strong, nonatomic) DateChangeButton *countdownToDateButton;

// MARK: Other

@property (strong, nonatomic) NSNumberFormatter *numberFormatter;
@property (strong, nonatomic) NSDate *countdownDate;

@end

// MARK: - Methods

@implementation CountdownView

// MARK: Inits

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self commonInit];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self commonInit];
	}
	return self;
}

- (void)commonInit {
	[self setBackgroundColor:[UIColor whiteColor]];
	
	self.hoursFirstDigitLabel = [[UILabel alloc] init];
	self.hoursSecondDigitLabel = [[UILabel alloc] init];
	self.minutesFirstDigitLabel = [[UILabel alloc] init];
	self.minutesSecondDigitLabel = [[UILabel alloc] init];
	self.secondsFirstDigitLabel = [[UILabel alloc] init];
	self.secondsSecondDigitLabel = [[UILabel alloc] init];
	self.separatorOneLabel = [[UILabel alloc] init];
	self.separatorTwoLabel = [[UILabel alloc] init];
	self.countdownToDateTitleLabel = [[UILabel alloc] init];
	self.countdownToDateButton = [[DateChangeButton alloc] init];
	self.numberFormatter = [[NSNumberFormatter alloc] init];
	self.countdownDate = [[NSDate alloc] init];
	
	// Setup labels
	for (UILabel *label in @[
			self.hoursFirstDigitLabel,
			self.hoursSecondDigitLabel,
			self.minutesFirstDigitLabel,
			self.minutesSecondDigitLabel,
			self.secondsFirstDigitLabel,
			self.secondsSecondDigitLabel,
			self.separatorOneLabel,
			self.separatorTwoLabel]) {
		[label setFont:[UIFont monospacedDigitSystemFontOfSize:60 weight:UIFontWeightBold]];
		[label setTextColor:[UIColor blackColor]];
	}
	
	[self.countdownToDateTitleLabel setFont:[UIFont systemFontOfSize:16]];
	[self.countdownToDateTitleLabel setTextColor:[UIColor darkGrayColor]];
	[self.countdownToDateTitleLabel setText:@"Counting down to"];
	
	[self.hoursFirstDigitLabel setText:@"-"];
	[self.hoursSecondDigitLabel setText:@"-"];
	[self.separatorOneLabel setText:@":"];
	[self.minutesFirstDigitLabel setText:@"-"];
	[self.minutesSecondDigitLabel setText:@"-"];
	[self.separatorTwoLabel setText:@":"];
	[self.secondsFirstDigitLabel setText:@"-"];
	[self.secondsSecondDigitLabel setText:@"-"];
	
	// Setup stackview
	
	UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[
		 self.hoursFirstDigitLabel,
		 self.hoursSecondDigitLabel,
		 self.separatorOneLabel,
		 self.minutesFirstDigitLabel,
		 self.minutesSecondDigitLabel,
		 self.separatorTwoLabel,
		 self.secondsFirstDigitLabel,
		 self.secondsSecondDigitLabel]];
	[stackView setAxis:UILayoutConstraintAxisHorizontal];
	[stackView setSpacing:0];
	[stackView setDistribution:UIStackViewDistributionEqualSpacing];
	[stackView setAlignment:UIStackViewAlignmentCenter];
	
	[stackView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[self addSubview:stackView];
	[self.countdownToDateTitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
	[self addSubview:self.countdownToDateTitleLabel];
	[self.countdownToDateButton setTranslatesAutoresizingMaskIntoConstraints:NO];
	[self addSubview:self.countdownToDateButton];
	
	// Add constraints
	[NSLayoutConstraint activateConstraints:@[
		[self.countdownToDateTitleLabel.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:4],
		[self.countdownToDateTitleLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
		
		[self.countdownToDateButton.topAnchor constraintEqualToAnchor:self.countdownToDateTitleLabel.bottomAnchor constant:4],
		[self.countdownToDateButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
											  
		[stackView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
		[stackView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor]]];
	
	// Setup formatters
	[self.numberFormatter setAllowsFloats:NO];
	[self.numberFormatter setAlwaysShowsDecimalSeparator:NO];
	[self.numberFormatter setMinimumIntegerDigits:2];
}

// MARK: Interface

- (void)layoutSubviews {
	[super layoutSubviews];
	[self.countdownToDateButton.layer setCornerRadius:self.countdownToDateButton.bounds.size.height / 2];
}

- (void)updateHours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds {
	[self updateHours:hours minutes:minutes seconds:seconds animated:YES];
}

- (void)updateHours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds animated:(BOOL)animated {
	NSString *hourString = [self.numberFormatter stringFromNumber:[[NSNumber alloc] initWithInteger:hours]];
	NSString *minuteString = [self.numberFormatter stringFromNumber:[[NSNumber alloc] initWithInteger:minutes]];
	NSString *secondString = [self.numberFormatter stringFromNumber:[[NSNumber alloc] initWithInteger:seconds]];
	
	NSString *hourFirstDigit = [hourString substringToIndex:1];
	NSString *hourSecondDigit = [hourString substringFromIndex:1];
	NSString *minuteFirstDigit = [minuteString substringToIndex:1];
	NSString *minuteSecondDigit = [minuteString substringFromIndex:1];
	NSString *secondFirstDigit = [secondString substringToIndex:1];
	NSString *secondSecondDigit = [secondString substringFromIndex:1];
	
	if (![hourFirstDigit isEqualToString:self.hoursFirstDigitLabel.text]) {
		if (animated) {
			[self pushTransitionForView:self.hoursFirstDigitLabel withDuration:0.3];
		}
		[self.hoursFirstDigitLabel setText:hourFirstDigit];
	}
	if (![hourSecondDigit isEqualToString:self.hoursSecondDigitLabel.text]) {
		if (animated) {
			[self pushTransitionForView:self.hoursSecondDigitLabel withDuration:0.3];
		}
		[self.hoursSecondDigitLabel setText:hourSecondDigit];
	}
	if (![minuteFirstDigit isEqualToString:self.minutesFirstDigitLabel.text]) {
		if (animated) {
			[self pushTransitionForView:self.minutesFirstDigitLabel withDuration:0.3];
		}
		[self.minutesFirstDigitLabel setText:minuteFirstDigit];
	}
	if (![minuteSecondDigit isEqualToString:self.minutesSecondDigitLabel.text]) {
		if (animated) {
			[self pushTransitionForView:self.minutesSecondDigitLabel withDuration:0.3];
		}
		[self.minutesSecondDigitLabel setText:minuteSecondDigit];
	}
	if (![secondFirstDigit isEqualToString:self.secondsFirstDigitLabel.text]) {
		if (animated) {
			[self pushTransitionForView:self.secondsFirstDigitLabel withDuration:0.3];
		}
		[self.secondsFirstDigitLabel setText:secondFirstDigit];
	}
	if (![secondSecondDigit isEqualToString:self.secondsSecondDigitLabel.text]) {
		if (animated) {
			[self pushTransitionForView:self.secondsSecondDigitLabel withDuration:0.3];
//			[UIView transitionWithView:self.secondsSecondDigitLabel
//							  duration:0.3
//							   options:UIViewAnimationOptionTransitionFlipFromRight
//							animations:^{
//								[self.secondsSecondDigitLabel setText:secondSecondDigit];
//							}
//							completion:nil];
		}
		[self.secondsSecondDigitLabel setText:secondSecondDigit];
	}
}

// MARK: Countdown Date

- (void)setCountdownToDate:(nonnull NSDate *)date {
	self.countdownDate = date;
	[self.countdownToDateButton setDate:date];
}

- (nonnull NSDate *)countdownToDate {
	return self.countdownDate;
}

// MARK: Set display of elements

// Show

- (void)showElements {
	[self.countdownToDateTitleLabel setAlpha:1];
}

- (void)showElementsAnimated:(bool)animated {
	[self showElementsAnimated:animated withDelay:0];
}

- (void)showElementsAnimated:(bool)animated withDelay:(NSTimeInterval)delay {
	if (animated) {
		__weak typeof(self) weakSelf = self;
		[UIView animateWithDuration:0.5
							  delay:delay
							options:UIViewAnimationOptionCurveEaseInOut
						 animations:^{
							 __strong typeof(self) strongSelf = weakSelf;
							 if (strongSelf) {
								 [strongSelf showElements];
							 }
						 }
						 completion:nil];
	} else {
		[self showElements];
	}
}

// Hide

- (void)hideElements {
	[self.countdownToDateTitleLabel setAlpha:0];
}

- (void)hideElementsAnimated:(bool)animated {
	[self hideElementsAnimated:animated withDelay:0];
}

- (void)hideElementsAnimated:(bool)animated withDelay:(NSTimeInterval)delay {
	if (animated) {
		__weak typeof(self) weakSelf = self;
		[UIView animateWithDuration:0.5
							  delay:delay
							options:UIViewAnimationOptionCurveEaseInOut
						 animations:^{
							 __strong typeof(self) strongSelf = weakSelf;
							 if (strongSelf) {
								 [strongSelf hideElements];
							 }
						 }
						 completion:nil];
	} else {
		[self hideElements];
	}
}

// MARK: Animations

- (void)pushTransitionForView:(UIView *)view withDuration:(CFTimeInterval)duration {
	CATransition *animation = [[CATransition alloc] init];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFromTop];
	[animation setDuration:duration];
	[view.layer addAnimation:animation forKey:kCATransitionPush];
}

@end
