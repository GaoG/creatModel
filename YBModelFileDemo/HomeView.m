//
//  HomeView.m
//  YBModelFileDemo
//
//  Created by YZC on 2019/12/12.
//  Copyright © 2019 杨波. All rights reserved.
//

#import "HomeView.h"
#import <WHToast.h>
@implementation HomeView 


-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.myTextView.delegate = self;
    self.classNameText.delegate = self;
    
}

/**mj*/
- (IBAction)mjButtonAction:(id)sender {
    self.mjBut.selected = YES;
    self.yyBut.selected = NO;
    
    
}
/**yy*/
- (IBAction)yyButtonAction:(id)sender {
    
    self.mjBut.selected = NO;
    self.yyBut.selected = YES;
    
}

/**提交*/
- (IBAction)submitButtonAction:(id)sender {
    
    
    
    NSString *className = self.classNameText.text;
    
    className =  className.length > 1 ? className : @"Test";
    NSString *str = self.myTextView.text;
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (error) {
        [WHToast showMessage:@"JSON数据错误" duration:1 finishHandler:nil];
        return;
    }
    
    NSInteger type = self.mjBut.selected ? 0 : 1;
    
    self.submitBlock ? self.submitBlock(data, type,className) : nil ;
    
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
        return NO;
    }
 
    return YES;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
