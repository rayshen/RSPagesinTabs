//
//  SamplePagedViewController.h
//  THSegmentedPagerExample
//
//  Created by Hannes Tribus on 25/07/14.
//  Copyright (c) 2014 3Bus. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>
#import "THSegmentedPageViewControllerDelegate.h"

@interface SamplePagedViewController : UIViewController<THSegmentedPageViewControllerDelegate>

@property(nonatomic,strong)NSString *viewTitle;

@end
