//
//  Food.h
//  Calorie Meter
//
//  Created by Raj Dhakate on 02/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject

@property NSString *foodName;
@property NSString *foodType;
@property NSString *foodCalories;
@property NSString *foodRecepie;

@property NSString *foodImage;
@property NSString *foodPrepareTime;
@property NSString *foodDetailTime;

- (Food*) initializeFoodListWithData;

@end
