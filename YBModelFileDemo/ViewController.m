//
//  ViewController.m
//  YBModelFileDemo
//
//  Created by 杨波 on 2019/3/18.
//  Copyright © 2019 杨波. All rights reserved.
//

#import "ViewController.h"
#import "YBModelFile.h"
#import "HomeView.h"
@interface ViewController ()

@property (nonatomic, strong)HomeView *homeView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.homeView];
    
}



/**生成model*/
-(void)creatModelFileAction:(NSData *)data withType:(NSInteger)type withClassName:(NSString *)className {
    
        
            YBMFConfig *config = [YBMFConfig defaultConfig];
            config.fileHHandler.ybmf_skipLine = YES;
           config.fileMHandler.ybmf_skipLine = YES;
           //是否需要实现 NSCoding 或 NSCopying 协议
           config.needCoding = YES;
           config.needCopying = YES;
           //设置类名公用后缀
           config.fileSuffix = @"Model";
           //设置忽略类型
           config.ignoreType =  YBMFIgnoreTypeMutable;
           //设置文件划分策略
           config.filePartitionMode = YBMFFilePartitionModeTogether;
    
            config.framework = type == 0 ? YBMFFrameworkMJ : YBMFFrameworkYY;
        
            [YBModelFile createFileWithName:className data:data config:config];
    
}



- (HomeView *)homeView {
    
    if (!_homeView) {
        _homeView = [[[NSBundle mainBundle ]loadNibNamed:@"HomeView" owner:self options:nil]lastObject];
        _homeView.frame = self.view.bounds;
        __weak typeof(self) weakSelf = self;
        _homeView.submitBlock = ^(NSData * _Nonnull data, NSInteger type, NSString *className) {
            
            [weakSelf creatModelFileAction:data withType:type withClassName:className];
        };
    }
    
    return _homeView;
}
@end
