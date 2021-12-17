//
//  PageTabView.m
//  MinGitHubTest
//
//  Created by bytedance on 2021/12/17.
//

#import "PageTabView.h"
#import "Masonry.h"
#import "TabButtonView.h"
#define UIColorFromHex(s)[UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >> 8))/255.0 blue:((s & 0xFF))/255.0  alpha:1.0]

@interface PageTabView ()<TabChangePageDelegate>
@property(nonatomic,strong)UIView *leftView;
@property(nonatomic,strong)UIView *rightView;
@property(nonatomic,strong)UILabel *leftLabel;
@property(nonatomic,strong)UILabel *rightLabel;
@property(nonatomic,strong)TabButtonView *tabButtonView;
@end

@implementation PageTabView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        self.backgroundColor = UIColorFromHex(0xEFF0F4);
        [self.leftView addSubview:self.leftLabel];
        [self.rightView addSubview:self.rightLabel];
        [self addSubview:self.leftView];
        [self addSubview:self.rightView];
        [self addSubview:self.tabButtonView];
        [self changePageTab];
        self.tabButtonView.delegate = self;
    }
    return  self;
}
#pragma 代理
- (void)clickLeftButton{
    [self displayLeftView];
}
- (void)clickRightButton{
    [self displayRightView];
}
#pragma 手势
-(void)changePageTab{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    pan.cancelsTouchesInView = YES;
    pan.minimumNumberOfTouches = 1;
    [self addGestureRecognizer:pan];
}
-(void)panView:(UIPanGestureRecognizer *)sender{
    //记录起始位置
    CGPoint point = [sender translationInView:self];
    //平移一共两种移动方式
    self.leftView.transform = CGAffineTransformTranslate(self.leftView.transform, point.x, 0);
    self.rightView.transform = CGAffineTransformTranslate(self.rightView.transform, point.x, 0);
    //增量置为o
    [sender setTranslation:CGPointZero inView:self.leftView];
    [sender setTranslation:CGPointZero inView:self.rightView];
    CGPoint speed = [sender velocityInView:self];
    if (sender.state == UIGestureRecognizerStateEnded) {
        if (self.leftView.frame.origin.x < 0 && speed.x >= self.bounds.size.width) {
            [self displayLeftView];
            [self.tabButtonView leftClick];
        }else if(self.leftView.frame.origin.x < 0 && speed.x <= -self.bounds.size.width){
            [self displayRightView];
            [self.tabButtonView rightClick];
        }
        if (self.leftView.frame.origin.x >= -self.bounds.size.width * 0.5) {
            [self displayLeftView];
            [self.tabButtonView leftClick];
        }else{
            [self displayRightView];
            [self.tabButtonView rightClick];
        }
    }
}
-(void)displayLeftView{
    [UIView animateWithDuration:0.3 animations:^{
        self.leftView.frame = self.bounds;
        self.rightView.frame = CGRectMake(self.bounds.origin.x + self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height);
    }];
}
-(void)displayRightView{
    [UIView animateWithDuration:0.3 animations:^{
        self.rightView.frame = self.bounds;
        self.leftView.frame = CGRectMake(self.bounds.origin.x - self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height);
    }];
}
#pragma 布局
- (void)layoutSubviews{
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.rightView);
        make.centerY.equalTo(self.rightView);
        make.width.equalTo(@200);
        make.height.equalTo(@50);
    }];
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.leftView);
        make.centerY.equalTo(self.leftView);
        make.width.equalTo(@200);
        make.height.equalTo(@50);
    }];
}
#pragma UI
- (UIView *)leftView{
    if (!_leftView) {
        _leftView = [[UIView alloc]initWithFrame:self.bounds];
        _leftView.backgroundColor = UIColorFromHex(0xEFF0F4);
    }
    return _leftView;
}
- (UIView *)rightView{
    if (!_rightView) {
        _rightView = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.origin.x + self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
        _rightView.backgroundColor = UIColorFromHex(0xEFF0F4);
    }
    return _rightView;
}
- (UILabel *)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc]init];
        _leftLabel.text = @"For You";
        _leftLabel.textAlignment = NSTextAlignmentCenter;
        _leftLabel.font = [UIFont systemFontOfSize:40];
    }
    return _leftLabel;
}
- (UILabel *)rightLabel{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc]init];
        _rightLabel.text = @"Trending";
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        _rightLabel.font = [UIFont systemFontOfSize:40];
    }
    return _rightLabel;
}
- (TabButtonView *)tabButtonView{
    if (!_tabButtonView) {
        _tabButtonView = [[TabButtonView alloc]initWithFrame:CGRectMake(self.frame.size.width * 0.1, self.frame.size.height * 0.8, self.frame.size.width * 0.8, 50)];
    }
    return _tabButtonView;
}
@end
