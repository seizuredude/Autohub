//
//  ImageViewController.h
//  Carhub
//
//  Created by Christopher Clark on 7/27/14.
//  Copyright (c) 2014 Ham Applications. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface ImageViewController : UIViewController<UIScrollViewDelegate>{
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIImageView* imageview;
}
@property(nonatomic, strong) Model * currentCar;

- (void)getfirstModel:(id)firstcarObject;
- (void)getsecondModel:(id)secondcarObject;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;

@end
