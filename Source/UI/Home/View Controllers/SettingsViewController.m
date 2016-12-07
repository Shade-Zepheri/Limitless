//
//  SettingsController.m
//  Limitless
//
//  Created by Shade Zepheri on 12/5/16.
//  Copyright © 2016 Limitless. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

- (NSURL *) navigationURL {
    return [NSURL URLWithString:@"cydia://home/settings"];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return 3;
        case 1: return 1;
        case 2: return 2;
    };
    return 1;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0: return nil;
        case 1: return @"Refresh Settings";
        case 2: return nil;
    };
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch ([indexPath section]) {
        case 0: return _nightModeCell;
    }
    return nil;
}

- (void)loadView {
    [super loadView];
    UIView *view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
    [view setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    [self setView:view];
    
    _table = [[[UITableView alloc] initWithFrame:[[self view] bounds] style:UITableViewStyleGrouped] autorelease];
    [_table setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [(UITableView *) _table setDataSource:self];
    [_table setDelegate:self];
    [view addSubview:_table];
    
    _nightModeSwitch = [[[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 50, 20)] autorelease];
    [_nightModeSwitch setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
    _nightModeSwitch.onTintColor = [UIColor purpleColor];
    [_nightModeSwitch addTarget:self action:@selector(setNightMode:) forControlEvents:UIControlEventValueChanged];
    
    _nightModeCell = [[[UITableViewCell alloc] init] autorelease];
    [[_nightModeCell textLabel] setText:@"Dark Mode"];
    [_nightModeCell setAccessoryView:_nightModeSwitch];
    [_nightModeCell setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Settings"];
}

- (void)viewWillDisappear:(BOOL)animated {
    _nightModeCell = nil;
    _table = nil;
    _nightModeSwitch = nil;
    [super viewWillDisappear:animated];
}

- (void)setNightMode:(id)control {
    BOOL value = [control isOn];
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:@"nightModeEnabled"];
    NSLog(value ? @"Yes" : @"No");
}

@end
