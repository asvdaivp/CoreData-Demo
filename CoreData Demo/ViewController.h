//
//  ViewController.h
//  CoreData Demo
//
//  Created by phuocdai on 7/17/15.
//  Copyright (c) 2015 phuocdai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailDeviceVC.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong) NSMutableArray *devices;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

