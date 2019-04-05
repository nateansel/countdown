//
//  DateChangeButton.m
//  Countdown
//
//  Created by Nathan Ansel on 11/27/18.
//  Copyright © 2018 Nathan Ansel. All rights reserved.
//

#import "DateChangeButton.h"

@interface DateChangeButton ()

@property (strong, nonatomic, nonnull) NSDateFormatter *dateFormatter;

@end

@implementation DateChangeButton

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self commonInit];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if (self) {
		[self commonInit];
	}
	return self;
}

- (void)commonInit {
	[self.titleLabel setFont:[UIFont systemFontOfSize:18]];
	[self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
	[self setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
	[self setContentEdgeInsets:UIEdgeInsetsMake(8, 16, 8, 16)];
	[self.layer setShadowOffset:CGSizeZero];
	[self.layer setShadowColor:[[UIColor blackColor] CGColor]];
	[self.layer setShadowRadius:3];
	[self.layer setShadowOpacity:0.35];
	
	self.dateFormatter = [[NSDateFormatter alloc] init];
	[self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[self.dateFormatter setTimeStyle:NSDateFormatterShortStyle];
}

- (void)setDate:(NSDate *)date {
	[self setTitle:[self.dateFormatter stringFromDate:date] forState:UIControlStateNormal];
}

@end
