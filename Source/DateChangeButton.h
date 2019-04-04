//
//  DateChangeButton.h
//  Countdown
//
//  Created by Nathan Ansel on 11/27/18.
//  Copyright © 2018 Nathan Ansel. All rights reserved.
//

@import UIKit;
#import "Push Down Button/PushDownButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface DateChangeButton : PushDownButton

- (void)setDate:(nonnull NSDate*)date;

@end

NS_ASSUME_NONNULL_END
