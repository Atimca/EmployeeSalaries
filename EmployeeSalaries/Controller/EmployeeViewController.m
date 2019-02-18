//
//  EmployeeViewController.m
//  EmployeeSalaries
//
//  Created by Smirnov Maksim on 18/02/2019.
//  Copyright © 2019 ms. All rights reserved.
//

#import "EmployeeViewController.h"
#import "EmployeeTableViewCell.h"

@interface EmployeeViewController ()

@end

@implementation EmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Employee";
    [self.tableView registerClass: EmployeeTableViewCell.self forCellReuseIdentifier: @"cell"];
}

# pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EmployeeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath: indexPath];
    [cell renderWithName: @"Name" birthYear: @"200" andSalary: @"100"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

@end
