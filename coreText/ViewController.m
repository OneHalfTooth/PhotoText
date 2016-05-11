//
//  ViewController.m
//  coreText
//
//  Created by 马少洋 on 16/5/11.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import "ViewController.h"
//#import <CoreText/CoreText.h>
#import "PushViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTextView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupTextView
{
    // 富文本技术：
    // 1.图文混排
    // 2.随意修改文字样式

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求"];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 2)];
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(0, 2)];
//    [string addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(6, 2)];
    [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:24] range:NSMakeRange(6, 2)];
    [string addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(6, 2)];

    // 创建图片图片附件
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"msy"];
    attach.bounds = CGRectMake(0, 0, 60, 60);
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];


    [string appendAttributedString:attachString];

    [string appendAttributedString:[[NSAttributedString alloc] initWithString:@"改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求，改需求"]];

    self.label.attributedText = string;
    
    /**
     iOS 6之前：CoreText,纯C语言,极其蛋疼
     iOS 6开始：NSAttributedString,简单易用
     iOS 7开始：TextKit,功能强大,简单易用
     */
}
- (IBAction)buttonDidCliked:(id)sender {
    PushViewController * push = [[PushViewController alloc]init];
    [self.navigationController pushViewController:push animated:YES];
}

@end
