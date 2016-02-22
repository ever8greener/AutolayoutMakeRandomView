//
//  ViewController.m
//  xxLayoutRandom
//
//  Created by artist on 2/22/16.
//  Copyright © 2016 artist. All rights reserved.

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //ib와 원래 연결되었던 constraint 를 제거하고
    [_viewMain removeConstraint:_constraintXCenter];
    
    // ------------------------------------------------------------
    // 가운데정렬로 함 ( 대신 120% 우측으로 )
    // ------------------------------------------------------------
     NSLayoutConstraint *cnnHere =
    [NSLayoutConstraint
     constraintWithItem:_lblJust
     attribute:NSLayoutAttributeCenterX
     relatedBy:NSLayoutRelationEqual
     toItem:_viewMain
     attribute:NSLayoutAttributeCenterX
     multiplier:1.2
     constant:0];
    
    [self.view addConstraint:cnnHere];
    [cnnHere release];
    
    // ------------------------------------------------------------
    // "press button 을 " 가로세로 정가운데에서 쪼금만 올라간 위치 (70%)에 고정시킴
    // ------------------------------------------------------------
    UIButton* updateButton = [UIButton new];
    updateButton.backgroundColor = [UIColor grayColor];
    [updateButton setTitle:@"Press me to update" forState:UIControlStateNormal];
    updateButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: updateButton];
    [updateButton release];
    
    NSLayoutConstraint *cnnBtnCenter =
    [NSLayoutConstraint
     constraintWithItem:updateButton
     attribute:NSLayoutAttributeCenterX
     relatedBy:NSLayoutRelationEqual
     toItem:_viewMain
     attribute:NSLayoutAttributeCenterX
     multiplier:1.0
     constant:0];
    [self.view addConstraint:cnnBtnCenter];
    [cnnBtnCenter release];
    
    NSLayoutConstraint *cnnBtnCenterY =
    [NSLayoutConstraint
     constraintWithItem:updateButton
     attribute:NSLayoutAttributeCenterY
     relatedBy:NSLayoutRelationEqual
     toItem:_viewMain
     attribute:NSLayoutAttributeCenterY
     multiplier:1.0 * 0.7  //70% position
     constant:0];
    [self.view addConstraint:cnnBtnCenterY];
    [cnnBtnCenterY release];
    
    
    // ------------------------------------------------------------
    // random 노랭이 button 5개 추가하기
    // ------------------------------------------------------------

    NSLayoutConstraint *cnnRandom;
 
    for (int i=0; i<5; i++) {
        UIButton* randomButton = [UIButton new];
        randomButton.backgroundColor = [UIColor yellowColor];
        NSString* strTitle = [NSString stringWithFormat:@"R: %d",i];
        [randomButton setTitle:strTitle forState:UIControlStateNormal];
        randomButton.translatesAutoresizingMaskIntoConstraints = NO;
        
        randomButton.bounds = CGRectMake(0, 0, 200, 100);
        [self.view addSubview: randomButton];
        
        
        
        float fMultipleVal = 1.0 + ((float)(arc4random()%5)  ) * 0.1;
        NSLog(@"mulVal:%f",fMultipleVal);
        
        cnnRandom =
        [NSLayoutConstraint
         constraintWithItem:randomButton
         attribute:NSLayoutAttributeCenterY
         relatedBy:NSLayoutRelationEqual
         toItem:_viewMain
         attribute:NSLayoutAttributeCenterY
         multiplier:fMultipleVal
         constant:0];
        [self.view addConstraint:cnnRandom];
        
        //NSLog(@"random제약 cnt: %d",cnnRandom.retainCount);
        
        fMultipleVal = 1.0 - ((float)(arc4random()%5)  ) * 0.1;
        
        cnnRandom =
        [NSLayoutConstraint
         constraintWithItem:randomButton
         attribute:NSLayoutAttributeCenterX
         relatedBy:NSLayoutRelationEqual
         toItem:_viewMain
         attribute:NSLayoutAttributeCenterX
         multiplier:fMultipleVal
         constant:0];
        [self.view addConstraint:cnnRandom];
        
        
        //width 맞추기.
        cnnRandom =
        [NSLayoutConstraint
         constraintWithItem:randomButton
         attribute:NSLayoutAttributeWidth
         relatedBy:NSLayoutRelationEqual
         toItem:nil
         attribute:NSLayoutAttributeWidth
         multiplier:1.0 * fMultipleVal
         constant:90];
        [self.view addConstraint:cnnRandom];
        
        NSLog(@"retain cnt: %d",randomButton.retainCount);
        NSLog(@"random제약 cnt: %d",cnnRandom.retainCount);
        
        [randomButton release];
                NSLog(@"retain cnt: %d",randomButton.retainCount);
    }
    
    [cnnRandom release];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_lblJust release];
    [_constraintXCenter release];
    [_viewMain release];
    [super dealloc];
}
@end
