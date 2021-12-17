//
//  TabButtonView.h
//  MinGitHubTest
//
//  Created by bytedance on 2021/12/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TabChangePageDelegate <NSObject>

-(void)clickLeftButton;
-(void)clickRightButton;

@end

@interface TabButtonView : UIView

@property(nonatomic,weak)id<TabChangePageDelegate>delegate;
-(void)leftClick;
-(void)rightClick;
@end

NS_ASSUME_NONNULL_END
