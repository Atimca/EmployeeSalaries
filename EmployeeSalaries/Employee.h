//
//  Employee.h
//  EmployeeSalaries
//
//  Created by Smirnov Maksim on 18/02/2019.
//  Copyright © 2019 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Employee : NSObject

@property (readonly, copy) NSString* name;
@property (readonly) NSUInteger birthYear;
@property (readonly, copy) NSDecimalNumber* salary;
- (instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear;

@end
