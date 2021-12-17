//
//  LoginViewController.m
//  MinGitHubTest
//
//  Created by bytedance on 2021/12/10.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "../BarController.h"
@interface LoginViewController ()<LoginPushDelegate>
@property(nonatomic,strong)LoginView *loginView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initSubViews];
}
-(void)_initSubViews{
    [self.view addSubview:self.loginView];
}
-(LoginView *)loginView{
    if (_loginView == nil) {
        _loginView = [[LoginView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _loginView.delegate = self;
    }
    return _loginView;
}
-(void)clickAction{
    BarController *bar = [[BarController alloc]init];
    [self.navigationController pushViewController:bar animated:YES];
}
@end
