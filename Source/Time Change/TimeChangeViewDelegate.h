//
//  TimeChangeViewDelegate.h
//  Countdown
//
//  Created by Nathan Ansel on 4/5/19.
//  Copyright © 2019 Nathan Ansel. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@protocol TimeChangeViewDelegate <NSObject>

- (void)cancelButtonPressed;
- (void)saveButtonPressed;

@end

NS_ASSUME_NONNULL_END
