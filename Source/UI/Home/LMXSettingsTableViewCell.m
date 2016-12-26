//
//  LMXSettingTableViewCell.m
//  Limitless
//
//  Created on 12/20/16.
//

#import "LMXSettingsTableViewCell.h"
#import "LMXSettingsItem.h"

@interface LMXSettingsTableViewCell ()

@property (nonatomic) UISwitch *cellSwitch;
@property (nonatomic) UITextField *cellInput;

@end

@implementation LMXSettingsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initialSetup];
    }
    
    return self;
    
}

// MARK: - Setup

- (void)initialSetup {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

// MARK: - Lazy Properties

- (UISwitch *)cellSwitch {
    if (_cellSwitch) {
        return _cellSwitch;
    }
    _cellSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    _cellSwitch.onTintColor = [UIColor colorWithRed:0.68
                                              green:0.41 blue:0.99 alpha:1.00];
    [_cellSwitch addTarget:self
                    action:@selector(switchToggled:)
          forControlEvents:UIControlEventValueChanged];
    return _cellSwitch;
}

- (UITextField *)cellInput {
    if (_cellInput) {
        return _cellInput;
    }
    _cellInput = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    _cellInput.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _cellInput.textAlignment = NSTextAlignmentLeft;
    _cellInput.returnKeyType = UIReturnKeyDone;
    _cellInput.delegate = self;
    
    return _cellInput;
    
}

// MARK: - Updating

- (void)setItem:(LMXSettingsItem *)item {
    _item = item;
    self.textLabel.text = item.name;
    
    switch (item.type) {
        case LMXSettingToggle:
            self.accessoryView = self.cellSwitch;
            [self updateSwitchToCurrentSettingsValue];
            break;
        case LMXSettingNumericValue:
            self.accessoryView = self.cellInput;
            [self updateInputToCurrentSettingsValue];
            break;
    }
}

- (void)updateSwitchToCurrentSettingsValue {
    NSString *settingKey = self.item.key;
    BOOL isOn = [[NSUserDefaults standardUserDefaults] boolForKey:settingKey];
    [self.cellSwitch setOn:isOn animated:FALSE];
}

- (void)updateInputToCurrentSettingsValue {
    id defaultValue = self.item.defaultValue;
    
    if ([defaultValue respondsToSelector:@selector(description)]) {
        self.cellInput.placeholder = [defaultValue description];
    }
    
    NSString *settingKey = self.item.key;
    id currentValue = [[NSUserDefaults standardUserDefaults] objectForKey:settingKey];
    
    if ([currentValue respondsToSelector:@selector(description)]) {
        self.cellInput.text = [defaultValue description];
    }
}

// MARK: - Value Events

- (void)switchToggled:(UISwitch *)sender {
    NSString *settingKey = self.item.key;
    
    [[NSUserDefaults standardUserDefaults] setBool:sender.isOn
                                            forKey:settingKey];
}

// MARK: - Input Delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    return TRUE;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return TRUE;
}

@end
