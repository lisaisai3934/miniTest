//
//  MyWorkCell.m
//  MinGitHubTest
//
//  Created by bytedance on 2021/12/10.
//

#import "MyWorkCell.h"

@implementation MyWorkCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
- (void)setFrame:(CGRect)frame{
    frame.origin.x += frame.size.width * 0.05;
    frame.size.width = frame.size.width * 0.9;
    [super setFrame:frame];
}
- (void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    self.imageView.image = [UIImage imageNamed:_imageStr];
}
- (void)setLabelStr:(NSString *)labelStr{
    _labelStr = labelStr;
    self.textLabel.text = self.labelStr;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect rect = self.imageView.frame;
    rect.origin.x += self.imageView.frame.size.width * 0.3;
    rect.origin.y += self.imageView.frame.size.height * 0.05;
    rect.size.width = self.imageView.frame.size.width * 0.9;
    rect.size.height = self.imageView.frame.size.height * 0.9;
    self.imageView.frame = rect;
}
@end
