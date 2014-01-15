//
//  ViewController.h
//  Stopwatch
//
//  Created by Leandra Tejedor on 1/13/14.
//  Copyright (c) 2014 Leandra Tejedor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;

- (IBAction)buttonPressed:(id)sender;

@end
