//
//  main.m
//  Lesson_3_HW
//
//  Created by Andrey Proskurin on 16.08.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const carColorKey = @"carColor";
static NSString *const carPriceKey = @"carPrice";
static NSString *const carModelNameKey = @"carModelName";
static NSString *const carParametersKey = @"carParameters";

NSArray *carModels() {
    
    NSArray *toyotaModels = @[@"Camry", @"Prius", @"RAV4", @"Corolla", @"Land Cruiser"];
    NSArray *porscheModels = @[@"Panamera", @"Cayman", @"Carrera", @"911 Turbo"];
    NSArray *nissanModels = @[@"Qashqai", @"Sentra", @"GT-R", @"Juke", @"X-Trail"];
    NSArray *mercedesModels = @[@"A-Class", @"B-Class", @"C-Class", @"S-Class", @"CLS"];
    NSArray *hondaModels = @[@"Civic", @"Accord", @"CR-V", @"Pilot", @"Odyssey"];
    NSArray *audiModels = @[@"R8", @"TT", @"A6", @"S7", @"Q2"];
    NSArray *lexusModels = @[@"GS F", @"GS 200t", @"LS 460", @"LFA", @"CT 200h"];
    
    NSArray *carModelsByShops = @[toyotaModels, porscheModels, nissanModels, mercedesModels, hondaModels, audiModels, lexusModels];
    
    return carModelsByShops;
    
}
NSDictionary *createParametersForModel() {
    
    NSArray *carColors = @[@"Black", @"White", @"Blue", @"Silver", @"Red", @"Yellow"];
    
    NSUInteger carPrice = (100 + (CGFloat)(arc4random() % 200)) * 100;
    NSInteger randomColor = arc4random() % (carColors.count - 1);
    NSString *color = [carColors objectAtIndex:randomColor];
    
    NSDictionary *colorAndPrice = @{carColorKey : color, carPriceKey : @(carPrice)};
    
    return colorAndPrice;
}
NSDictionary *createModelsForShop() {
    
    NSArray *carShops = @[@"Toyota", @"Porsche", @"Nissan", @"Mercedes", @"Honda", @"Audi", @"Lexus"];
    
    NSMutableDictionary *modelsForShop = [NSMutableDictionary dictionary];
    
    for (NSInteger i = 0; i < carModels().count; i++)
    {
        NSArray *carModelsArray = [carModels() objectAtIndex:i];
        NSMutableArray *carModelsWithParameters = [NSMutableArray arrayWithArray:[carModelsArray mutableCopy]];
        
        for (NSInteger carModelIndex = 0; carModelIndex < carModelsWithParameters.count; carModelIndex++)
        {
            NSDictionary *carParameters = createParametersForModel();
            NSString *carModelName = (NSString*)[carModelsWithParameters objectAtIndex:carModelIndex];
            
            NSDictionary *carModel = @{carModelNameKey : carModelName,
                                       carParametersKey : carParameters};
            
            [carModelsWithParameters replaceObjectAtIndex:carModelIndex withObject:carModel];
        }
        
        [modelsForShop setObject:carModelsWithParameters forKey:[carShops objectAtIndex:i]];
    }
    
    return modelsForShop;
}
void createShopsForCity() {
    
    NSArray *cityNames = @[@"Kiev", @"Kharkov", @"Lviv", @"Zaporozhye", @"Poltava", @"Vinnitsa", @"Sumy"];
    
    NSMutableDictionary *shopsForCity = [NSMutableDictionary dictionary];
    
    for (NSInteger i = 0; i < cityNames.count; i++)
    {
        [shopsForCity setObject:createModelsForShop() forKey:[cityNames objectAtIndex:i]];
    }
    
    NSLog(@"%@", shopsForCity);
    
}
int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        createShopsForCity();
    }
    return 0;
}


