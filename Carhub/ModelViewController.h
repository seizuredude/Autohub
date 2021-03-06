//
//  ModelViewController.h
//  Carhub
//
//  Created by Christopher Clark on 8/20/14.
//  Copyright (c) 2014 Ham Applications. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "MakeViewController.h"

@interface ModelViewController : UITableViewController <UISearchDisplayDelegate>

@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSMutableArray * appdelmodelArray;
@property (nonatomic, strong) NSArray * ModelArray;
@property (nonatomic, strong) NSArray * searchArray;
@property (nonatomic, strong) NSArray * AlphabeticalArray;
@property (nonatomic, strong) Make * currentMake;
@property (nonatomic, strong) NSString * currentClass;
@property (nonatomic, strong) NSString * currentSubclass;

- (void) getMake:(id)makeObject;
- (void)getSubclass:(id)subclassObject;
- (void)getClass:(id)classObject;

@end
