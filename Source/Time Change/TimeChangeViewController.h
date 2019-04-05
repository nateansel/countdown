//
//  TimeChangeViewController.h
//  Countdown
//
//  Created by Nathan Ansel on 12/4/18.
//  Copyright © 2018 Nathan Ansel. All rights reserved.
//

@import UIKit;
#import "TimeChangeView.h"
#import "TimeChangeViewControllerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface TimeChangeViewController : UIViewController

@property (assign) id<TimeChangeViewControllerDelegate> delegate;

- (void)setDate:(NSDate *)date;

@end

@interface TimeChangeViewController (TimeChangeViewDelegate) <TimeChangeViewDelegate>

@end

NS_ASSUME_NONNULL_END
