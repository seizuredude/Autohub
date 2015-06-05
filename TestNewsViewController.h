//
//  TestNewsViewController.h
//  Carhub
//
//  Created by Christopher Clark on 6/2/15.
//  Copyright (c) 2015 Ham Applications. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface TestNewsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property(nonatomic, strong) News * currentnews;

- (void)getNews:(id)newsObject;

@end