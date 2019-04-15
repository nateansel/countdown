//
//  TimeChangeView.h
//  Countdown
//
//  Created by Nathan Ansel on 12/4/18.
//  Copyright © 2018 Nathan Ansel. All rights reserved.
//

@import UIKit;
#import "PushDownButton.h"
#import "DateChangeButton.h"
#import "TimeChangeViewDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface TimeChangeView : UIView

@property (assign) id<TimeChangeViewDelegate> delegate;
@property CGRect compactFrame;

- (NSDate *)date;
- (void)setDate:(NSDate *)date;

- (void)setCompactLayoutWithFrame:(CGRect)frame;
- (void)setFullLayout;

@end

NS_ASSUME_NONNULL_END
