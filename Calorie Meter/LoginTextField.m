//
//  LoginTextField.m
//  Calorie Meter
//
//  Created by Raj Dhakate on 04/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import "LoginTextField.h"

@implementation LoginTextField

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.layer.cornerRadius = 2;
    
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 10, 8);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}


@end
