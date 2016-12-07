//
//  SettingsController.h
//  Limitless
//
//  Created by Shade Zepheri on 12/5/16.
//  Copyright © 2016 Limitless. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *table;
@property (nonatomic, retain) UISwitch *nightModeSwitch;
@property (nonatomic, retain) UITableViewCell *nightModeCell;

@end
