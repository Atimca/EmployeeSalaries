//
//  EmployeeViewState.h
//  EmployeeSalaries
//
//  Created by Smirnov Maksim on 18/02/2019.
//  Copyright © 2019 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Employee;

NS_ASSUME_NONNULL_BEGIN

@interface EmployeeViewState : NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *birth;
@property (copy, nonatomic) NSString *salary;
- (instancetype)initWithEmployee:(Employee *) employee;
@end

NS_ASSUME_NONNULL_END
