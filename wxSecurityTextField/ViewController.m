//
//  ViewController.m
//  wxSecurityTextField
//
//  Created by lh on 15/6/1.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "ViewController.h"

#import "PasswordTextFieldView.h"

@interface ViewController ()
@property (nonatomic, weak)PasswordTextFieldView *passwordView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITextField *tf = [[UITextField alloc] init];
    tf.keyboardType = UIKeyboardTypeNumberPad;
    [tf addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:tf];
    [tf becomeFirstResponder];
    
    PasswordTextFieldView *passwordView = [[PasswordTextFieldView alloc] initWithFrame:CGRectMake(50, 50, 240, 30)];
    passwordView.backgroundColor = [UIColor whiteColor];
    self.passwordView = passwordView;
    [self.view addSubview:passwordView];
}

-(void)textChange:(UITextField *)tf{
    NSString *text = tf.text;
    
    if ([text length] > 6) {
        NSRange r = {0, 6};
        text = [text substringWithRange:r];
        tf.text = text;
    }
    
    if ([tf.text length] == 6) {
        NSLog(@"done something!");
    }

    self.passwordView.circleNumber = [tf.text length];
    [self.passwordView setNeedsDisplay];
}



@end
