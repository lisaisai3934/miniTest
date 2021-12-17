//
//  BarController.m
//  MinGitHubTest
//
//  Created by bytedance on 2021/12/10.
//

#import "BarController.h"
#import "Home/HomeViewController.h"
#import "Notifications/NotificationsViewController.h"
#import "Explore/ExploreViewController.h"
#import "Profile/ProfileViewController.h"
@interface BarController ()
@end

@implementation BarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self _subViews];
    }
    return self;
}
#pragma 加载tab
-(void)_subViews{
    HomeViewController *home = [[HomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:home];
    home.title = @"Home";
    home.view.backgroundColor = [UIColor whiteColor];
    homeNav.navigationBar.backgroundColor = [UIColor systemPinkColor];
    homeNav.navigationBar.prefersLargeTitles = YES;
    homeNav.tabBarItem.image = [UIImage imageNamed:@"house.fill"];
    
    NotificationsViewController *notifications = [[NotificationsViewController alloc]init];
    UINavigationController *notificationsNav = [[UINavigationController alloc]initWithRootViewController:notifications];
    notifications.title = @"Notifications";
    notifications.view.backgroundColor = [UIColor whiteColor];
    notificationsNav.navigationBar.backgroundColor = [UIColor systemPinkColor];
    notificationsNav.navigationBar.prefersLargeTitles = YES;
    notificationsNav.tabBarItem.image = [UIImage imageNamed:@"bell.fill"];
    
    ExploreViewController *explore = [[ExploreViewController alloc]init];
    UINavigationController *exploreNav = [[UINavigationController alloc]initWithRootViewController:explore];
    explore.title = @"Explore";
    explore.view.backgroundColor = [UIColor whiteColor];
    exploreNav.navigationBar.backgroundColor = [UIColor systemPinkColor];
    exploreNav.tabBarItem.image = [UIImage imageNamed:@"giftcard.fill"];
    
    ProfileViewController *profile = [[ProfileViewController alloc]init];
    UINavigationController *profileNav = [[UINavigationController alloc]initWithRootViewController:profile];
    profile.title = @"Profile";
    profile.view.backgroundColor = [UIColor whiteColor];
    profileNav.navigationBar.backgroundColor = [UIColor systemPinkColor];
    profileNav.tabBarItem.image = [UIImage imageNamed:@"person.fill"];
    
    NSArray *array = [NSArray arrayWithObjects:homeNav,notificationsNav,exploreNav,profileNav, nil];
    [self setViewControllers:array];
}
@end
