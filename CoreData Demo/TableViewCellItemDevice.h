//
//  TableViewCellItemDevice.h
//  CoreData Demo
//
//  Created by phuocdai on 7/17/15.
//  Copyright (c) 2015 phuocdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCellItemDevice : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;

@end
