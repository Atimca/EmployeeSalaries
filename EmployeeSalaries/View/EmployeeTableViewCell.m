//
//  EmployeeTableViewCell.m
//  EmployeeSalaries
//
//  Created by Smirnov Maksim on 18/02/2019.
//  Copyright © 2019 ms. All rights reserved.
//

#import "EmployeeTableViewCell.h"

@interface EmployeeTableViewCell()
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *birthLabel;
@property (strong, nonatomic) UILabel *salaryLabel;
@end

@implementation EmployeeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];

    if (self) {
        self.nameLabel = [UILabel new];
        self.birthLabel = [UILabel new];
        self.salaryLabel = [UILabel new];

        UIStackView *stack = [[UIStackView alloc]
                              initWithArrangedSubviews: @[self.nameLabel,
                                                          self.birthLabel,
                                                          self.salaryLabel]];
        stack.axis = UILayoutConstraintAxisVertical;
        stack.distribution = UIStackViewDistributionFillEqually;
        stack.spacing = 4;

        [self.contentView addSubview: stack];
        stack.translatesAutoresizingMaskIntoConstraints = NO;

        [NSLayoutConstraint
         activateConstraints: @[[stack.topAnchor constraintEqualToAnchor: self.contentView.topAnchor constant: 8],
                                [stack.leadingAnchor constraintEqualToAnchor: self.contentView.leadingAnchor constant: 16],
                                [stack.bottomAnchor constraintEqualToAnchor: self.contentView.bottomAnchor constant: -8],
                                [stack.trailingAnchor constraintEqualToAnchor: self.contentView.trailingAnchor constant: -16]]];
    }

    return self;
}

- (void)renderWithName:(NSString *)name birthYear:(NSString *) year andSalary:(NSString *) salary {
    self.nameLabel.text = [NSString stringWithFormat: @"Name: %@", name];
    self.birthLabel.text = [NSString stringWithFormat: @"Birth: %@", year];
    self.salaryLabel.text = [NSString stringWithFormat: @"Salary: %@", salary];
}
@end
