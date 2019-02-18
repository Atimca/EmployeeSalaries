//
//  EmployeeViewState.m
//  EmployeeSalaries
//
//  Created by Smirnov Maksim on 18/02/2019.
//  Copyright © 2019 ms. All rights reserved.
//

#import "EmployeeViewState.h"
#import "Employee.h"

@implementation EmployeeViewState

- (instancetype)initWithEmployee:(Employee *) employee {
    self = [super init];
    if (self) {
        self.name = [NSString stringWithFormat: @"Name: %@", employee.name];
        self.birth = [NSString stringWithFormat: @"Birth: %lu", (unsigned long)employee.birthYear];
        self.salary = [NSString stringWithFormat: @"Salary: %@", employee.formatedSalary];
    }
    return self;
}

@end
