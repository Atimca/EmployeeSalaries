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
#import "EmployeeViewState.h"

@interface EmployeeViewController()
@property (strong, nonatomic) EmployeeDirectory *directory;
@property (copy, nonatomic) NSArray *employees;
@property (strong, nonatomic) UIActivityIndicatorView *indicator;
@end

@implementation EmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
    [self.indicator hidesWhenStopped];
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView: self.indicator];
    self.navigationItem.leftBarButtonItem = barButton;

    [self.tableView registerClass: EmployeeTableViewCell.self forCellReuseIdentifier: @"cell"];
    self.directory = [EmployeeDirectory new];
    self.employees = [NSArray new];

    self.title = @"Employee";

    [NSNotificationCenter.defaultCenter addObserver: self
                                           selector: @selector(update)
                                               name: kEmployeeDirectoryDidUpdateNotification
                                             object: nil];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemRefresh
                                                                                           target: self
                                                                                           action: @selector(sort)];

    [self.indicator startAnimating];
    [self.directory update];
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver: self];
}

# pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EmployeeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath: indexPath];
    EmployeeViewState *state = self.employees[indexPath.row];
    [cell renderWithViewState: state];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.employees.count;
}

# pragma mark - Private
- (void)update {
    [NSOperationQueue.mainQueue addOperationWithBlock:^{
        [self.indicator stopAnimating];
        NSMutableArray *states = [NSMutableArray new];
        for (Employee *employee in self.directory.employees) {
            [states addObject: [[EmployeeViewState alloc] initWithEmployee: employee]];
        }
        self.employees = states;
        [self.tableView reloadData];
    }];
}

- (void)sort {
    [self.indicator startAnimating];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [NSThread sleepForTimeInterval:2];
        NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey: @"name"  ascending: YES];
        NSSortDescriptor *birthDescriptor = [[NSSortDescriptor alloc] initWithKey: @"birth"  ascending: YES];
        NSSortDescriptor *salaryDescriptor = [[NSSortDescriptor alloc] initWithKey: @"salary"  ascending: YES];
        NSArray *sortedEmployees = [self.employees sortedArrayUsingDescriptors: @[nameDescriptor,
                                                                                  birthDescriptor,
                                                                                  salaryDescriptor]];

        [NSOperationQueue.mainQueue addOperationWithBlock:^{
            self.employees = sortedEmployees;
            [self.tableView reloadData];
            [self.indicator stopAnimating];
        }];
    });
}
@end
