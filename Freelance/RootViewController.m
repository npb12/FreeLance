//
//  RootViewController.m
//  Freelance
//
//  Created by Neil Ballard on 11/11/16.
//  Copyright © 2016 Neil Ballard. All rights reserved.
//

#import "Includes.h"

@interface RootViewController ()

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;




@property (strong, nonatomic) IBOutlet NSLayoutConstraint *nav_height;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features", @"Bookmark Favorite Tip"];
    //  _pageImages = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png"];
    // Do any additional setup after loading the view.
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    //   MatchViewController *leftViewController = [self matchControllerAtIndex:0];
    ViewControllerTwo *startingViewController = [self twoControllerAtIndex:1];
    //   MatchViewController *rightViewController = [self matchControllerAtIndex:2];
    
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, self.nav_height.constant + 20, self.view.frame.size.width, self.view.frame.size.height);
    
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ViewControllerOne*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    
    if (index == 0) {
        ViewControllerOne *oneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"OneVC"];
        oneVC.pageIndex = index;
        return oneVC;
        
    }else if(index == 1){
        ViewControllerTwo *twoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TwoVC"];
        twoVC.pageIndex = index;
        return twoVC;
    }else{
        
        ViewControllerThree *threeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ThreeVC"];
        threeVC.pageIndex = index;
        return threeVC;
    }
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ViewControllerOne*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    if (index == 0) {
        ViewControllerOne *oneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"OneVC"];
        oneVC.pageIndex = index;
        return oneVC;
        
    }else if(index == 1){
        ViewControllerTwo *twoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TwoVC"];
        twoVC.pageIndex = index;
        return twoVC;
    }else{
        ViewControllerThree *threeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ThreeVC"];
        threeVC.pageIndex = index;
        return threeVC;
    }
}


- (ViewControllerOne *)oneControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0)) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    ViewControllerOne *oneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"OneVC"];
    oneVC.pageIndex = index;
    
    return oneVC;
}

- (ViewControllerTwo *)twoControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0)) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    ViewControllerTwo *twoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TwoVC"];
    twoVC.pageIndex = index;
    
    return twoVC;
}


- (ViewControllerThree *)threeControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0)) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    ViewControllerThree *threeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ThreeVC"];
    threeVC.pageIndex = index;
    
    return threeVC;
}







- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
