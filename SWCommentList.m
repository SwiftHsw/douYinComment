//
//  ATCommentList.m
//  sportss
//
//  Created by 黄世文 on 2018/6/27.
//  Copyright © 2018年 mac_pro_s. All rights reserved.
//

#import "SWCommentList.h"
@interface SWCommentList()
<
UITableViewDelegate,
UITableViewDataSource,
UIGestureRecognizerDelegate
>
@property (nonatomic,strong) Config * confg;
@property (nonatomic,strong) ListTableView * tableView;
@property (nonatomic,strong) UIPanGestureRecognizer * panGR;
@property (nonatomic,assign) CGFloat oldY;
@end
@implementation SWCommentList

+(SWCommentList*)commentList:(Config *)confg
{
    SWCommentList * commentView = [[SWCommentList alloc]init];
    commentView.confg = confg;
    [commentView addSuperView];
    return commentView;
}
/**
 添加到父视图,设置参数
 */
-(void)addSuperView
{
    self.backgroundColor = self.confg.backgroundColor;
    self.frame=CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-self.confg.offsetY);
    if (self.confg.deleagte == [UIApplication sharedApplication].keyWindow) {
        [self.confg.deleagte addSubview:self];
    }else{
        UIViewController * superContro = (UIViewController*)self.confg.deleagte;
        [superContro.view addSubview:self];
    }
   
    
    [self creatSubViews];
}

/**
 创建子控件
 */
-(void)creatSubViews
{
    //评论内容的表格
    _tableView = [[ListTableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.backgroundColor = self.confg.backgroundColor;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self addSubview:_tableView];
    
    
    //拖拽手势
    _panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGRAct:)];
    _panGR.delegate = self;
    [_tableView addGestureRecognizer:_panGR];
    
}
#pragma mark tableView的协议方法和数据源方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.confg.dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.confg.dataArray[indexPath.row];
    cell.backgroundColor =  [UIColor colorWithRed:40/255.0 green:37/255.0 blue:40/255.0 alpha:1];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"小瘪三，点我干啥？？？");
}

/**
 绑定拖拽手势
 
 @param tap UIPanGestureRecognizer
 */
-(void)panGRAct:(UIPanGestureRecognizer*)tap
{
    
    CGFloat scrollY = [self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]].origin.y;
    
    if (self.tableView.contentOffset.y <= scrollY){
        self.tableView.scrollEnabled = NO;
        CGPoint translationPoint = [_panGR translationInView:self.tableView];
        CGRect rect = self.frame;
        rect.origin.y +=translationPoint.y;
        
        if (rect.origin.y<=self.confg.offsetY) {
            rect.origin.y = self.confg.offsetY;
        }
        self.frame=rect;
        [tap setTranslation:CGPointZero inView:self.tableView];
        
    }
    
    if (tap.state==UIGestureRecognizerStateEnded) {
        CGFloat endY = self.frame.origin.y;
        if (endY>=(self.confg.offsetY +self.confg.fallY)) {
            [self dismiss];
            
        }else{
            [self show];
        }
    }
    
    
}

/**
 弹出方法
 */
-(void)show
{
    self.tableView.scrollEnabled = YES;
    [UIView animateWithDuration:0.2 animations:^{
        self.frame=CGRectMake(0, self.confg.offsetY, SCREEN_WIDTH, SCREEN_HEIGHT-self.confg.offsetY);
    }];
}

/**
 关闭方法
 */
-(void)dismiss
{
    self.tableView.scrollEnabled = YES;
    [UIView animateWithDuration:0.2 animations:^{
        self.frame=CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-self.confg.offsetY);
    }];
}

@end

@implementation Config

@end

@implementation ListTableView

//允许接受多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    return YES;
}

@end
