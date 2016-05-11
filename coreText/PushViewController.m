//
//  PushViewController.m
//  coreText
//
//  Created by 马少洋 on 16/5/11.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@property (nonatomic,retain)UITextView * textView;
@property (nonatomic,retain)NSTextStorage * textStorage;
@property (nonatomic,retain)NSTextContainer * textContainer;
@property (nonatomic,retain)NSLayoutManager * layoutManager;

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];


    NSString * str =@"改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求的产品经理都是混蛋，改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！改需求是吧！";

    self.textStorage = [[NSTextStorage alloc]initWithString:str];
    [self.textStorage beginEditing];
    [self.textStorage addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    [self.textStorage addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:40] range:NSMakeRange(0, 2)];
    [self.textStorage addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(80, 2)];
    [self.textStorage addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:40] range:NSMakeRange(80, 2)];
    [self strockWordUsingRedColorUndlerLine:@"改需求的产品经理都是混蛋" SuperWord:str];
    [self.textStorage endEditing];
    self.layoutManager = [[NSLayoutManager alloc]init];
    self.textContainer = [[NSTextContainer alloc]initWithSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
    [self.textStorage addLayoutManager:self.layoutManager];
    [self.layoutManager addTextContainer:self.textContainer];
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) textContainer:self.textContainer];
    self.textView.backgroundColor = [UIColor clearColor];
    self.textContainer.exclusionPaths = @[[self createImageView]];
    [self.view addSubview:self.textView];


}

//使用正值表达式来查找字符
-(void)strockWordUsingRedColorUndlerLine:(NSString*)word SuperWord:(NSString *)superWord{
    //生成则在表达式
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:word options:0 error:nil];
    //使用正则式来匹配字符串
    NSArray *resultArray = [regular matchesInString:superWord options:0 range:NSMakeRange(0, superWord.length)];
    for (NSTextCheckingResult *result in resultArray) {
        //遍历匹配成功的每一项，针对每一项设置属性
        //指定属性红色和下划线
        NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor blueColor],NSUnderlineStyleAttributeName:[NSNumber numberWithInt:NSUnderlineStyleSingle],NSFontAttributeName:[UIFont systemFontOfSize:50]};
        [self.textStorage addAttributes:dict range:result.range];
    }
}
- (UIBezierPath *)createImageView{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 150, 100, 100)];
    imageView.image = [UIImage imageNamed:@"msy"];
    [self.textView addSubview:imageView];
    CGRect frame = [self.textView convertRect:imageView.frame fromView:self.view];
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:frame];
    return path;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
