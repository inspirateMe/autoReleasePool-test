//
//  ViewController.m
//  自动释放池的笔试题
//
//  Created by 李宁 on 16/7/2.
//  Copyright © 2016年 lining. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    long largeNumber = 1000000;
    
    for (int i = 0; i < largeNumber; ++i) {
        // 相当于创建一次就销毁一次,保证了内存平衡
        NSString *str = @"Hello World";
        str = [str stringByAppendingFormat:@" - %d", i];
        str = [str uppercaseString];
    }
    
    /*
     1.内存瞬间暴涨
     2.因为for循环的速度非常快,CPU来不及处理内存
     3.解决办法 : 在for循环的开始就创建自动释放池
     4.原理 : 出了自动释放池的作用域里面的对象就销毁了
     */
    for (int i = 0; i < largeNumber; ++i) {
        
        // 相当于创建一次就销毁一次,保证了内存平衡
        @autoreleasepool {
            NSString *str = @"Hello World";
            str = [str stringByAppendingFormat:@" - %d", i];
            str = [str uppercaseString];
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
