//
//  DetailDeviceVC.h
//  CoreData Demo
//
//  Created by phuocdai on 7/17/15.
//  Copyright (c) 2015 phuocdai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DetailDeviceVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *versionTextField;
@property (strong) NSManagedObject *device;
- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)saveButtonPressed:(id)sender;


@end
