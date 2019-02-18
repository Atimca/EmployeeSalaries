//
//  EmployeeViewController.m
//  EmployeeSalaries
//
//  Created by Smirnov Maksim on 18/02/2019.
//  Copyright © 2019 ms. All rights reserved.
//

#import "Employee.h"
#import "EmployeeDirectory.h"
#import "EmployeeTableViewCell.h"
#import "EmployeeViewController.h"

@interface EmployeeViewController()
@property (strong, nonatomic) EmployeeDirectory *directory;
@property (copy, nonatomic) NSArray *employees;
@end

@implementation EmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass: EmployeeTableViewCell.self forCellReuseIdentifier: @"cell"];
    self.directory = [EmployeeDirectory new];
    self.employees = [NSArray new];

    self.title = @"Employee";

    [NSNotificationCenter.defaultCenter addObserver: self
                                           selector: @selector(update)
                                               name: kEmployeeDirectoryDidUpdateNotification
                                             object: nil];
    [self.directory update];
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver: self];
}

# pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EmployeeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath: indexPath];
    Employee *employee = self.employees[indexPath.row];
    [cell renderWithName: employee.name
               birthYear: [NSString stringWithFormat: @"%lu", (unsigned long)employee.birthYear]
               andSalary: employee.formatedSalary];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.employees.count;
}

- (void)update {
    [NSOperationQueue.mainQueue addOperationWithBlock:^{
        self.employees = self.directory.employees;
        [self.tableView reloadData];
    }];
}

@end
