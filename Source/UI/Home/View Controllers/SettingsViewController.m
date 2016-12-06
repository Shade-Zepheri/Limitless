//
//  SettingsController.m
//  Limitless
//
//  Created by Shade Zepheri on 12/5/16.
//  Copyright © 2016 Limitless. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (strong, nonatomic) UITableViewCell *nightModeCell;
@property (strong, nonatomic) UISwitch *nightMode;


@end

@implementation SettingsViewController

- (void)loadView {
    [super loadView];
    self.title = @"Settings";
    
    self.nightModeCell = [[UITableViewCell alloc] init];
    self.nightModeCell.backgroundColor = [UIColor grayColor];
    self.nightModeCell.textLabel.text = @"Enabled";
    self.nightMode = [[UISwitch alloc] initWithFrame:CGRectZero];
    self.nightModeCell.accessoryView = self.nightMode;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor redColor];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return 2;
        default: return 0;
    };
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        switch (indexPath.row) {
            case 0: return self.nightModeCell;
        }
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0: return @"Nightmode";
    };
    return nil;
}

@end
