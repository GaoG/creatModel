//
//  HomeView.h
//  YBModelFileDemo
//
//  Created by YZC on 2019/12/12.
//  Copyright © 2019 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeView : UIView <UITextViewDelegate,UITextFieldDelegate>
/**textView*/
@property (weak, nonatomic) IBOutlet UITextView *myTextView;

@property (weak, nonatomic) IBOutlet UITextField *classNameText;

/**mj*/
@property (weak, nonatomic) IBOutlet UIButton *mjBut;
/**yy*/
@property (weak, nonatomic) IBOutlet UIButton *yyBut;
/**提交*/
@property (weak, nonatomic) IBOutlet UIButton *submitBut;

/** data  数据    type 0 mj  1 yy  className 类名 */
@property (nonatomic, copy) void(^submitBlock)(NSData* data, NSInteger type, NSString *className);


@end

NS_ASSUME_NONNULL_END
