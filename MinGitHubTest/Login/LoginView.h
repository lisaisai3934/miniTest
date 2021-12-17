//
//  LoginView.h
//  MinGitHubTest
//
//  Created by bytedance on 2021/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol LoginPushDelegate <NSObject>

-(void)clickAction;

@end

@interface LoginView : UIView

@property(nonatomic,weak)id<LoginPushDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
