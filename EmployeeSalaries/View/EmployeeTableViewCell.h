//
//  EmployeeTableViewCell.h
//  EmployeeSalaries
//
//  Created by Smirnov Maksim on 18/02/2019.
//  Copyright © 2019 ms. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EmployeeTableViewCell : UITableViewCell
- (void)renderWith:(NSString *)name birthYear:(NSString *) year andSalary:(NSString *) salary;
@end

NS_ASSUME_NONNULL_END
