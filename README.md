# douYinComment

# 抖音评论效果

## 效果图

![image](https://github.com/SwiftHsw/douYinComment/blob/master/%E6%95%88%E6%9E%9C%E5%9B%BE.gif)   


## 使用

>
 1.导入 #import "SWCommentList.h"
>

>
 2.配置文件Config 初始化后,配置您需要的文件,demo 代码如下
 
   
   ```
    Config * config = [[Config alloc]init];
    config.backgroundColor = [UIColor colorWithRed:40/255.0 green:37/255.0 blue:40/255.0 alpha:1];
    config.circular = 10;
    config.deleagte = [UIApplication sharedApplication].keyWindow;
    config.offsetY = SCREEN_HEIGHT *.4;
    config.fallY = (SCREEN_HEIGHT *.6)/2;
    config.titleString = @"93175";
    config.dataArray = [[NSArray alloc]initWithObjects:@"我吃你家米了吗?一大早叫我看这个",@"我吃你家米了吗?一大早叫我看这个",@"我吃你家米了吗?一大早叫我看这个",@"我吃你家米了吗?一大早叫我看这个",@"我吃你家米了吗?一大早叫我看这个",@"我吃你家米了吗?一大早叫我看这个",@"我吃你家米了吗?一大早叫我看这个",@"我吃你家米了吗?一大早叫我看这个",@"我吃你家米了吗?一大早叫我看这个",@"我吃你家米了吗?一大早叫我看这个",  nil];
    self.commentView = [SWCommentList commentList:config];
   ```
>

>
 3  [self.commentView show]; 显示即可
>  

## 注意: config.deleagte = [UIApplication sharedApplication].keyWindow;  这句代码可以为self;可自行调试,如果对您有用,可否给一颗小心心,有问题随时Issues
