//
//  ViewController.m
//  FlowViewDemo
//
//  Created by zhanght on 16/5/5.
//  Copyright © 2016年 HT-SOFT. All rights reserved.
//

#import "ViewController.h"
#import "FlowView.h"

@interface ViewController () <FlowViewDelegate>;
@property (weak, nonatomic) IBOutlet FlowView *flowViewIB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    FlowView *flow = [[FlowView alloc] initWithFrame:CGRectMake(0, 100, 320, 200)];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i = 1; i < 8; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", i]];
        [arr addObject:image];
    }
    flow.images = arr;
    flow.delegate = self;
    [self.view addSubview:flow];
    [flow reloadData];
    
    //xib
    _flowViewIB.images = arr;
    _flowViewIB.delegate = self;
    [_flowViewIB reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)flowView:(FlowView *)flowView didTapImageAtIndex:(NSInteger)index {
    NSLog(@"-- ht log -- tap index : %ld", (long)index);
}

@end
