//
//  ViewController.m
//  7-Cache演示
//
//  Created by fengjun on 16/5/31.
//  Copyright © 2016年 fengjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSCacheDelegate>

@end

@implementation ViewController{
    NSCache *_myCache;
    
    
}
- (IBAction)showCache:(id)sender {
    
    NSLog(@"_myCache中当前内容:");
    
    for (NSInteger i = 0; i < 20; i++) {
        NSLog(@"%@",[_myCache objectForKey:@(i)]);
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _myCache = [[NSCache alloc] init];
    _myCache.countLimit = 10;
    
    
    _myCache.delegate = self;
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //向cache中添加20个对象
    
    
    
    for (NSInteger i = 0; i < 20; i++) {
        
        NSString * str = [@"object" stringByAppendingString:@(i).description  ];
        
        
        [_myCache setObject:str forKey:@(i)];
         NSLog(@"然后添加了==>%@",str);
    }
    
    
   
}

- (void)cache:(NSCache *)cache willEvictObject:(id)obj{
    
    NSLog(@"先删除了==>%@",obj);
    
    
}
@end
