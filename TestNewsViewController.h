//
//  TestNewsViewController.h
//  Carhub
//
//  Created by Christopher Clark on 6/2/15.
//  Copyright (c) 2015 Ham Applications. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface TestNewsViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) IBOutlet UIImageView * loadingWheel;

@property (nonatomic, strong) News * currentnews;

- (void)getNews:(id)newsObject;

- (void)preloadNewsView:(News *)firstNewsObject;

@end
