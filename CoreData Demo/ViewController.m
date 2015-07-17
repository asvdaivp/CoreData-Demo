//
//  ViewController.m
//  CoreData Demo
//
//  Created by phuocdai on 7/17/15.
//  Copyright (c) 2015 phuocdai. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "TableViewCellItemDevice.h"

@interface ViewController ()

@end

@implementation ViewController
-(NSManagedObjectContext *)managedObjectContext{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Device"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    [self.tableView reloadData];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showDetailDevice"]) {
        NSManagedObject *selectedDevice = [self.devices objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        DetailDeviceVC *destVC = segue.destinationViewController;
        destVC.device = selectedDevice;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonPressed:(id)sender {
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const Cell =@"cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    TableViewCellItemDevice *cell = (TableViewCellItemDevice *)[tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell == nil) {
        cell = [[TableViewCellItemDevice alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
    }
    NSManagedObject *device = [self.devices objectAtIndex:indexPath.row];
//    [cell.textLabel setText:[NSString stringWithFormat:@"%@ %@", [device valueForKey:@"name"], [device valueForKey:@"version"]]];
//    [cell.detailTextLabel setText:[device valueForKey:@"company"]];
    cell.nameLabel.text = [device valueForKey:@"name"];
    cell.versionLabel.text = [device valueForKey:@"version"];
    cell.companyLabel.text = [device valueForKey:@"company"];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.devices?[self.devices count] : 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 71;
}
@end
