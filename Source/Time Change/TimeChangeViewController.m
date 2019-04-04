//
//  TimeChangeViewController.m
//  Countdown
//
//  Created by Nathan Ansel on 12/4/18.
//  Copyright © 2018 Nathan Ansel. All rights reserved.
//

#import "TimeChangeViewController.h"

@interface TimeChangeViewController ()

@end

@implementation TimeChangeViewController

- (void)loadView {
	self.view = [[TimeChangeView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
