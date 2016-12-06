//
//  SettingsController.m
//  Limitless
//
//  Created by Shade Zepheri on 12/5/16.
//  Copyright © 2016 Limitless. All rights reserved.
//

#import "SettingsController.h"
#import "SettingsViewController.h"

@implementation SettingsController

static UIWindow *_window = nil;

+ (void)showSettings {
    _window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    _window.rootViewController = [SettingsViewController new];
    _window.alpha = 0;
    [_window makeKeyAndVisible];
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseIn;
    
    [UIView animateWithDuration:0.45
                          delay:0
         usingSpringWithDamping:0.85
          initialSpringVelocity:1
                        options:animationOptions
                     animations:^{
                         _window.alpha = 1;
                     }
                     completion:nil];
}

@end
