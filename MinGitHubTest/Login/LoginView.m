//
//  LoginView.m
//  MinGitHubTest
//
//  Created by bytedance on 2021/12/10.
//

#import "LoginView.h"
#import "Masonry.h"
@interface LoginView ()
//图标视图
@property(nonatomic,strong)UIImageView *iconImageView;
//登录按钮
@property(nonatomic,strong)UIButton *loginButton;
//提示标签
@property(nonatomic,strong)UILabel *tipsLabel;
@end

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.iconImageView];
        [self addSubview:self.loginButton];
        [self addSubview:self.tipsLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-70);
        make.height.mas_equalTo(90);
        make.width.mas_equalTo(90);
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.mas_equalTo(-90);
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.height.mas_equalTo(60);
    }];
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginButton.mas_bottom).offset(12);
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
    }];
}

-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        UIImage *iconImage = [UIImage imageNamed:@"github_icon"];
        _iconImageView = [[UIImageView alloc]initWithImage:iconImage];
    }
    return _iconImageView;
}

-(UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.backgroundColor = [UIColor blackColor];
        [_loginButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [_loginButton setTitle:@"Sign in with GitHub" forState:UIControlStateNormal];
        [_loginButton.layer setCornerRadius:30];
    }
    return _loginButton;
}

-(UILabel *)tipsLabel{
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc]init];
        _tipsLabel.text = @"By signing in you accept out Terms of use and Privacy policy";
        _tipsLabel.numberOfLines = 0;
        _tipsLabel.textAlignment = NSTextAlignmentCenter;
        _tipsLabel.font = [UIFont systemFontOfSize:12];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:_tipsLabel.text];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor systemPinkColor] range:NSMakeRange(29,12)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor systemPinkColor] range:NSMakeRange(46,14)];
        _tipsLabel.attributedText = attributedString;
    }
    return _tipsLabel;
}
-(void)click{
    if ([self.delegate respondsToSelector:@selector(clickAction)]) {
        [self.delegate clickAction];
    }
}
@end
