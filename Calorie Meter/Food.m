//
//  Food.m
//  Calorie Meter
//
//  Created by Raj Dhakate on 02/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import "Food.h"

@implementation Food

- (Food*) initializeFoodListWithData
{
    Food *foodItem = [[Food alloc]init];
    
    foodItem.foodName = @"Omlete";
    foodItem.foodType = @"Breakfast";
    foodItem.foodCalories = @"270kcal";
    foodItem.foodPrepareTime = @"15";
    foodItem.foodDetailTime = @"Minutes";
    foodItem.foodRecepie = @"";
    
    return foodItem;
}

@end
