//
//  SearchModelController.m
//  Carhub
//
//  Created by Christopher Clark on 9/8/14.
//  Copyright (c) 2014 Ham Applications. All rights reserved.
//

#import "SearchModelController.h"
#import "MakeViewController.h"
#import "Model.h"
#import "CarViewCell.h"
#import "DetailViewController.h"
#import "SearchViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@interface SearchModelController ()

@end

@implementation SearchModelController
@synthesize currentModel, ModelArray, searchArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate setShouldRotate:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorColor = [UIColor clearColor];
    self.title = @"Results";
    if([self.tableView numberOfRowsInSection:0] == 0)
    {
        UILabel *noDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
        noDataLabel.text = @"No Results";
        noDataLabel.textColor = [UIColor blackColor];
        noDataLabel.font = [UIFont fontWithName:@"MavenProRegular" size:18];
        noDataLabel.textAlignment = NSTextAlignmentCenter;
        self.tableView.backgroundView = noDataLabel;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
}

- (void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
    NSPredicate *resultsPredicate = [NSPredicate predicateWithFormat:@"SELF.CarModel contains [search] %@", searchText];
    self.searchArray = [[self.ModelArray filteredArrayUsingPredicate:resultsPredicate]mutableCopy];
    NSLog(@"searchArray %@", searchArray);
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles]objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.searchDisplayController.searchResultsTableView)
    {
        return self.searchArray.count;
    }else{
        return self.ModelArray.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 183;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ModelCell";
    CarViewCell *cell = (CarViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil) {
        cell = [[CarViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell...
    Model * modelObject;
    if(tableView == self.searchDisplayController.searchResultsTableView){
        modelObject = [self.searchArray objectAtIndex:indexPath.row];
        self.searchDisplayController.searchResultsTableView.backgroundColor = [UIColor whiteColor];
        self.searchDisplayController.searchResultsTableView.separatorColor = [UIColor clearColor];
    } else {
        modelObject = [self.ModelArray objectAtIndex:indexPath.row];
    }
    cell.CarName.text = modelObject.CarModel;
    
    [cell setUpCarImageWithModel:modelObject];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"pushDetailView"])
    {
        NSIndexPath * indexPath;
        Model * object;

        if (self.searchDisplayController.active) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            object = [searchArray objectAtIndex:indexPath.row];
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            object = [ModelArray objectAtIndex:indexPath.row];
        }
        [[segue destinationViewController] getModel:object];
    }
}

- (void)getsearcharray:(id)searcharrayObject;
{
    //ModelArray = [[NSMutableArray alloc]init];
    ModelArray = searcharrayObject;
    NSLog(@"CarArraycount: %lu", (unsigned long)ModelArray.count);
    NSLog(@"meow");
}

@end
