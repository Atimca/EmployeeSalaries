//
//  EmployeeDirectory.h
//  EmployeeSalaries
//
//  Created by Smirnov Maksim on 18/02/2019.
//  Copyright © 2019 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
// notification posted when the directory finishes updating
extern NSString* const kEmployeeDirectoryDidUpdateNotification;
@interface EmployeeDirectory : NSObject
@property (readonly) NSArray* employees; // returns NSArray of Employee
@property (readonly) BOOL isUpdating;
- (void)update;
@end
