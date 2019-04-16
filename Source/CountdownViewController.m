//
//  CountdownViewController.m
//  Countdown
//
//  Created by Nathan Ansel on 11/20/18.
//  Copyright © 2018 Nathan Ansel. All rights reserved.
//

#import "CountdownViewController.h"

@interface CountdownViewController ()

@property (weak, nonatomic) CountdownView *countdownView;
@property (strong, nonatomic) NSDate *countdownToDate;

@end

@implementation CountdownViewController

- (void)loadView {
	self.view = [[CountdownView alloc] init];
	self.countdownView = (CountdownView *) self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self setDefinesPresentationContext:YES];
//	[self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
	
	self.countdownToDate = (NSDate *) [[NSUserDefaults standardUserDefaults] objectForKey:@"countdownToDate"];
	if (self.countdownToDate == nil) {
		NSDateComponents *components = [[NSDateComponents alloc] init];
		[components setTimeZone:[[NSTimeZone alloc] initWithName:@"America/Los_Angeles"]];
		[components setYear:2019];
		[components setMonth:06];
		[components setDay:03];
		[components setHour:10];
		[components setMinute:00];
		[components setSecond:00];
		self.countdownToDate = [[NSCalendar currentCalendar] dateFromComponents:components];
	}
	[self.countdownView setCountdownToDate:self.countdownToDate];
	
	NSDate *timerStartDate = [[NSCalendar currentCalendar] dateBySettingUnit:NSCalendarUnitNanosecond value:0 ofDate:[[NSDate alloc] init] options:0];
	NSTimer *timer = [[NSTimer alloc] initWithFireDate:timerStartDate
											  interval:1
												target:self
											  selector:@selector(updateValues:)
											  userInfo:nil
											   repeats:NO];
//											   repeats:YES];
	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
	[self updateValues:nil];
	[self.countdownView hideElementsAnimated:YES withDelay:3];
	[[self.countdownView countdownToDateButton] addTarget:self action:@selector(countdownToDateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)countdownToDateButtonPressed:(DateChangeButton *)sender {
	TimeChangeViewController *vc = [[TimeChangeViewController alloc] init];
	vc.delegate = self;
	[vc setDate:self.countdownToDate];
	[vc setModalPresentationStyle:UIModalPresentationOverCurrentContext];
	vc.transitioningDelegate = self;
	[self presentViewController:vc animated:true completion:nil];
}

- (BOOL)prefersStatusBarHidden {
	return YES;
}

- (void)updateValues:(NSTimer *)timer {
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
																   fromDate:[[NSDate alloc] init]
																	 toDate:self.countdownToDate
																	options:0];
	NSInteger hours = components.hour;
	NSInteger minutes = components.minute;
	NSInteger seconds = components.second;
	[self.countdownView updateHours:hours minutes:minutes seconds:seconds animated:(timer != nil)];
	if (hours <= 0 && minutes <= 0 && seconds <= 0) {
		NSLog(@"Timer done!");
		if (timer) {
			[timer invalidate];
		}
	}
}

@end

@implementation CountdownViewController (UIViewControllerTransitioningDelegate)

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
	PresentTimeChangeViewControllerAnimatedTransitioning *transition = [[PresentTimeChangeViewControllerAnimatedTransitioning alloc] init];
	transition.toViewController = (TimeChangeViewController *) presented;
	transition.startingFrame = self.countdownView.countdownToDateButton.frame;
	return transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
	DismissTimeChangeViewControllerAnimatedTransitioning *transition = [[DismissTimeChangeViewControllerAnimatedTransitioning alloc] init];
	transition.fromViewController = (TimeChangeViewController *) dismissed;
	transition.endingFrame = self.countdownView.countdownToDateButton.frame;
	return transition;
}

@end

// MARK: - TimeChangeViewControllerDelegate

@implementation CountdownViewController (TimeChangeViewControllerDelegate)

- (void)cancelTimeChange {
	[self dismissViewControllerAnimated:true completion:nil];
}

- (void)saveNewCountdownTime:(nonnull NSDate *)date {
	[self setCountdownToDate:date];
	[self.countdownView setCountdownToDate:date];
	[self updateValues:nil];
	[self dismissViewControllerAnimated:true completion:nil];
}

@end
