//
//  ViewController.h
//  xxLayoutRandom
//
//  Created by artist on 2/22/16.
//  Copyright © 2016 artist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIView *viewMain;
@property (retain, nonatomic) IBOutlet UILabel *lblJust;

@property (retain, nonatomic) IBOutlet NSLayoutConstraint *constraintXCenter;

@end

