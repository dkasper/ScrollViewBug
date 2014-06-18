//
//  RootViewController.m
//  ScrollViewBug
//
//  Created by David Kasper on 6/17/14.
//  Copyright (c) 2014 David Kasper. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    scrollView.pagingEnabled = YES;
    scrollView.scrollEnabled = YES;
    scrollView.bounces = YES;
    [self.view addSubview:scrollView];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view1.userInteractionEnabled = YES;
    view1.backgroundColor = [UIColor redColor];
    [scrollView addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(1024, 0, 1024, 768)];
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    view2.userInteractionEnabled = YES;
    view2.backgroundColor = [UIColor blueColor];
    [scrollView addSubview:view2];
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(scrollView, view1, view2);
    NSDictionary *metrics = @{@"width": @(width), @"height": @(height)};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics: 0 views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics: 0 views:viewsDictionary]];
    
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view1(==width)]-0-[view2(==width)]|" options:0 metrics:metrics views:viewsDictionary]];
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view1(==height)]|" options:0 metrics:metrics views:viewsDictionary]];
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view2(==height)]|" options:0 metrics:metrics views:viewsDictionary]];
    
    // This should be unnecessary
    scrollView.contentSize = CGSizeMake(width * 2, height);
}

@end
