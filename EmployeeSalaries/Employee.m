//
//  Employee.m
//  EmployeeSalaries
//
//  Created by Smirnov Maksim on 18/02/2019.
//  Copyright © 2019 ms. All rights reserved.
//

#import "Employee.h"
static NSUInteger const kStartingSalary = 10000;
NSString* const kSalaryCurrency = @"EUR";
@implementation Employee
- (instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear
{
    self = [super init];
    if(self)
    {
        _name = name;
        _birthYear = birthYear;
        _salary = [[NSDecimalNumber alloc] initWithUnsignedInteger:kStartingSalary];
    }
    return self;
}
@end
