//
//  ExploreViewController.m
//  MinGitHubTest
//
//  Created by bytedance on 2021/12/17.
//

#import "ExploreViewController.h"
#import "PageTabView.h"
@interface ExploreViewController ()
@property(nonatomic,strong)PageTabView *pageTabView;
@end

@implementation ExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.pageTabView];
}
- (PageTabView *)pageTabView{
    if (!_pageTabView) {
        _pageTabView = [[PageTabView alloc]initWithFrame:self.view.frame];
    }
    return _pageTabView;
}
@end
