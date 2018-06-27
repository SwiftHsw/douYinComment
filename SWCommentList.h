//
//  ATCommentList.h
//  sportss
//
//  Created by 黄世文 on 2018/6/27.
//  Copyright © 2018年 mac_pro_s. All rights reserved.
//

#import <UIKit/UIKit.h>
 

@interface Config : NSObject
/**
 背景颜色
 */
@property(nonatomic,retain)UIColor * backgroundColor;

/**
 代理对象
 */
@property(nonatomic,assign)id deleagte;

/**
 圆角
 */
@property(nonatomic,assign)CGFloat circular;


/**
 开始的Y值
 */
@property(nonatomic,assign)CGFloat offsetY;


/**
 落地时候的 Y值
 */
@property(nonatomic,assign)CGFloat fallY;
/**
 数据源
 */
@property(nonatomic,strong)NSArray * dataArray;


@end


@interface SWCommentList : UIView

/**
 初始化方法
 
 @param confg 设置对象
 @return CommentList对象
 */
+(SWCommentList*)commentList:(Config*)confg;

/**
 打开
 */
-(void)show;

/**
 关闭
 */
-(void)dismiss;

@end


@interface ListTableView : UITableView

@end

