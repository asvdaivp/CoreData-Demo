//
//  DetailDeviceVC.m
//  CoreData Demo
//
//  Created by phuocdai on 7/17/15.
//  Copyright (c) 2015 phuocdai. All rights reserved.
//

#import "DetailDeviceVC.h"
#import <CoreData/CoreData.h>

@implementation DetailDeviceVC
-(void)viewDidLoad{
    [super viewDidLoad];
    if (self.device) {
        self.nameTextField.text = [self.device valueForKey:@"name"];
        [self.versionTextField setText:[self.device valueForKey:@"version"]];
        self.companyTextField.text = [self.device valueForKey:@"company"];
    }
}
-(NSManagedObjectContext *)managedObjectContext{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveButtonPressed:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    if (self.device) {
        [self.device setValue:self.nameTextField.text forKey:@"name"];
        [self.device setValue:self.versionTextField.text forKey:@"version"];
        [self.device setValue:self.companyTextField.text forKey:@"company"];
    } else {
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
        [newDevice setValue:self.nameTextField.text forKey:@"name"];
        [newDevice setValue:self.versionTextField.text forKey:@"version"];
        [newDevice setValue:self.companyTextField.text forKey:@"company"];
    }
    
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"can't save");
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
