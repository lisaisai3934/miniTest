//
//  TabButtonView.m
//  MinGitHubTest
//
//  Created by bytedance on 2021/12/17.
//

#import "TabButtonView.h"
#import "Masonry.h"
#define UIColorFromHex(s)[UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >> 8))/255.0 blue:((s & 0xFF))/255.0  alpha:1.0]

@interface TabButtonView ()
@property(nonatomic,strong)UIButton *leftButton;
@property(nonatomic,strong)UIButton *rightButton;
@property(nonatomic,strong)UIView *sliderView;
//@property(nonatomic,assign)BOOL tag;
@end

@implementation TabButtonView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        self.backgroundColor = UIColorFromHex(0xE3E3E3);
        [self.layer setCornerRadius:30];
        [self addSubview:self.sliderView];
        [self addSubview:self.leftButton];
        [self addSubview:self.rightButton];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@0);
        make.width.equalTo(self.mas_width).multipliedBy(0.5);
        make.height.equalTo(self.mas_height);
    }];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@0);
        make.top.equalTo(@0);
        make.width.equalTo(self.mas_width).multipliedBy(0.5);
        make.height.equalTo(self.mas_height);
    }];
//    if(!self.tag) {
//        [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(@0);
//            make.top.equalTo(@0);
//            make.width.equalTo(self.mas_width).multipliedBy(0.5);
//            make.height.equalTo(self.mas_height);
//        }];
//    } else {
//        [self.sliderView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).offset(self.bounds.size.width*0.5);
//        }];
//    }
   
    self.sliderView.frame = CGRectMake(0, 0, self.bounds.size.width*0.5, self.bounds.size.height);
}
#pragma 事件
-(void)leftClick{
    [self leftAnimation];
    [self.leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    if ([self.delegate respondsToSelector:@selector(clickLeftButton)]) {
        [self.delegate clickLeftButton];
    }
}
-(void)rightClick{
    [self rightAnimation];
    [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    if ([self.delegate respondsToSelector:@selector(clickRightButton)]) {
        [self.delegate clickRightButton];
    }
}
#pragma 动画
-(void)leftAnimation{
    [UIView animateWithDuration:0.3 animations:^{
//        self.sliderView.transform = CGAffineTransformMakeTranslation(0,0);
        self.sliderView.frame = CGRectMake(0, 0, self.bounds.size.width * 0.5, self.bounds.size.height);
    }];
//    self.tag = NO;
//    [UIView animateWithDuration:0.25 animations:^{
//        [self setNeedsLayout];
//        [self layoutIfNeeded];
//    }];
}
-(void)rightAnimation{
    [UIView animateWithDuration:0.3 animations:^{
//        self.sliderView.transform = CGAffineTransformMakeTranslation(self.bounds.size.width * 0.5,0);
        self.sliderView.frame = CGRectMake(self.bounds.size.width * 0.5, 0, self.bounds.size.width * 0.5, self.bounds.size.height);
    }];
//    self.tag = YES;
//    [UIView animateWithDuration:0.25 animations:^{
//        [self setNeedsLayout];
//        [self layoutIfNeeded];
//    }];
}
#pragma UI
- (UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.backgroundColor = [UIColor clearColor];
        [_leftButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        [_leftButton setTitle:@"For You" forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [_leftButton.layer setCornerRadius:30];
    }
    return _leftButton;
}
- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.backgroundColor = [UIColor clearColor];
        [_rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton setTitle:@"Trending" forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [_rightButton.layer setCornerRadius:30];
    }
    return _rightButton;
}
- (UIView *)sliderView{
    if (!_sliderView) {
        _sliderView = [[UIView alloc]init];
        _sliderView.backgroundColor =UIColorFromHex(0x2B64CE);
        [_sliderView.layer setCornerRadius:30];
    }
    return _sliderView;
}
@end
