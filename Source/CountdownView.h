//
//  CountdownView.h
//  Countdown
//
//  Created by Nathan Ansel on 11/20/18.
//  Copyright © 2018 Nathan Ansel. All rights reserved.
//

@import UIKit;
#import "DateChangeButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface CountdownView : UIView

- (void)updateHours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds;
- (void)updateHours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds animated:(BOOL)animated;

- (void)setCountdownToDate:(nonnull NSDate *)date;
- (nonnull NSDate *)countdownToDate;

- (void)showElements;
- (void)showElementsAnimated:(bool)animated;
- (void)showElementsAnimated:(bool)animated withDelay:(NSTimeInterval)delay;
- (void)hideElements;
- (void)hideElementsAnimated:(bool)animated;
- (void)hideElementsAnimated:(bool)animated withDelay:(NSTimeInterval)delay;

@end

NS_ASSUME_NONNULL_END
