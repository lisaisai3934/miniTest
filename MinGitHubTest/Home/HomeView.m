//
//  HomeView.m
//  MinGitHubTest
//
//  Created by bytedance on 2021/12/10.
//

#import "HomeView.h"
#import "MyWorkCell.h"

#define UIColorFromHex(s)[UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >> 8))/255.0 blue:((s & 0xFF))/255.0  alpha:1.0]

@interface HomeView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation HomeView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        self.tableView.backgroundColor = UIColorFromHex(0xEFF0F4);
        [self addSubview:self.tableView];
    }
    return  self;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];//创建对象
        _tableView.delegate = self;//遵循UITableViewDelegate
        _tableView.dataSource = self;//遵循UITableViewDataSource
        _tableView.separatorStyle = UITableViewCellAccessoryNone;
        _tableView.rowHeight = 70;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return _myWorkList.count;
    }else{
        return 2;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *MyWorkID = @"MyWork";
    static NSString *SubScriptionsID = @"SubScriptions";
    if (indexPath.section == 0) {
        MyWorkCell *cell = [tableView dequeueReusableCellWithIdentifier:MyWorkID];
        //如果缓存池中没有ID，创建一个cell，并给它一个重用标示
        if (cell == nil) {
            cell = [[MyWorkCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyWorkID];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageStr = _myWorkList[indexPath.row][@"image"];
        cell.labelStr = _myWorkList[indexPath.row][@"label"];
        return  cell;
    }else{
        MyWorkCell *cell = [tableView dequeueReusableCellWithIdentifier:MyWorkID];
        //如果缓存池中没有ID，创建一个cell，并给它一个重用标示
        if (cell == nil) {
            cell = [[MyWorkCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyWorkID];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageStr = _myWorkList[indexPath.row][@"image"];
        cell.labelStr = _myWorkList[indexPath.row][@"label"];
        return  cell;
    }
}
- (void)setMyWorkList:(NSArray *)myWorkList{
    if (!_myWorkList) {
        _myWorkList = myWorkList;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"My Work";
    }else{
        return @"Subscriptions";
    }
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
        [header.textLabel setTextColor:[UIColor blackColor]];
        [header.textLabel setFont:[UIFont systemFontOfSize:30]];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
        // 圆角角度
      CGFloat radius = 30.f;
      // 设置cell 背景色为透明
      cell.backgroundColor = UIColor.clearColor;
      // 创建两个layer
      CAShapeLayer *normalLayer = [[CAShapeLayer alloc] init];
      CAShapeLayer *selectLayer = [[CAShapeLayer alloc] init];
      // 获取显示区域大小
      CGRect bounds = CGRectInset(cell.bounds, 0, 0);
      // 获取每组行数
      NSInteger rowNum = [tableView numberOfRowsInSection:indexPath.section];
      // 贝塞尔曲线
      UIBezierPath *bezierPath = nil;
    
    if (rowNum == 1) {
        // 一组只有一行（四个角全部为圆角）
        bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                           byRoundingCorners:UIRectCornerAllCorners
                                                 cornerRadii:CGSizeMake(radius, radius)];
    } else {
        if (indexPath.row == 0) {
            // 每组第一行（添加左上和右上的圆角）
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                               byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                                                     cornerRadii:CGSizeMake(radius, radius)];
            
        } else if (indexPath.row == rowNum - 1) {
            // 每组最后一行（添加左下和右下的圆角）
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                               byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                     cornerRadii:CGSizeMake(radius, radius)];
        } else {
            // 每组不是首位的行不设置圆角
            bezierPath = [UIBezierPath bezierPathWithRect:bounds];
        }
    }
    // 把已经绘制好的贝塞尔曲线路径赋值给图层，然后图层根据path进行图像渲染render
    normalLayer.path = bezierPath.CGPath;
    selectLayer.path = bezierPath.CGPath;
    
    
    UIView *nomarBgView = [[UIView alloc] initWithFrame:bounds];
    // 设置填充颜色
    normalLayer.fillColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    // 添加图层到nomarBgView中
    [nomarBgView.layer insertSublayer:normalLayer atIndex:0];
    nomarBgView.backgroundColor = UIColor.clearColor;
    cell.backgroundView = nomarBgView;
    UIView *selectBgView = [[UIView alloc] initWithFrame:bounds];
    selectLayer.fillColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    [selectBgView.layer insertSublayer:selectLayer atIndex:0];
    selectBgView.backgroundColor = UIColor.clearColor;
    cell.selectedBackgroundView = selectBgView;
}
@end
