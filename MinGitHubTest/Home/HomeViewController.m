//
//  HomeViewController.m
//  MinGitHubTest
//
//  Created by bytedance on 2021/12/10.
//

#import "HomeViewController.h"
#import "HomeView.h"
@interface HomeViewController ()

@property(nonatomic,strong)HomeView *homeView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.homeView];
}

- (HomeView *)homeView{
    if (!_homeView) {
        _homeView = [[HomeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _homeView.myWorkList = [self _setWorkList];
    }
    return _homeView;
}

- (NSArray *)_setWorkList{
    NSArray *tempArray = [NSArray arrayWithObjects:@{
        @"image":@"issue_icon",
        @"label":@"Issues"
    },@{
        @"image":@"pr_icon",
        @"label":@"Pull Requests"
    },@{
        @"image":@"discussion_icon",
        @"label":@"Discussions"
    },@{
        @"image":@"repo_icon",
        @"label":@"Repositories"
    },@{
        @"image":@"orga_icon",
        @"label":@"Organizations"
    },nil];
    return tempArray;
}
//- (BOOL)prefersStatusBarHidden{
//    return YES;
//}
@end
