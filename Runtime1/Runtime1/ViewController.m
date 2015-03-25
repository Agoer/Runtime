//
//  ViewController.m
//  Runtime1
//
//  Created by 李蝉 on 15/3/23.
//  Copyright (c) 2015年 宜信-宜定盈. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self sendMessageAction:@"OC语句" number:111];
    NSLog(@"--------------");
    SEL sel = @selector(sendMessageAction:number:);
    objc_msgSend(self,sel,@"Runtime语句",111);
    
    NSString *returnString = objc_msgSend(self, @selector(sendMessageReturnStringAction:number:),@"return String Runtime",123);
    
    NSLog(@"有返回的 runtime %@",returnString);
    
//    objc_msgSend_stret      //（返回值是结构体）
//    objc_msgSend_fpret      //（返回值是浮点型）
//    objc_msgSendSuper       //（调用父类方法）
//    objc_msgSendSuper_stret //（调用父类方法，返回值是结构体）
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)sendMessageAction:(NSString *)param1 number:(NSInteger)i
{
    NSLog(@"您输入的内容为%@,%ld",param1,(long)i);
}

- (NSString *)sendMessageReturnStringAction:(NSString *)param1 number:(NSInteger)i
{
     return [NSString stringWithFormat:@"您输入的内容为%@,%ld",param1,(long)i];
}

@end
