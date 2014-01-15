//
//  ViewController.m
//  Stopwatch
//
//  Created by Leandra Tejedor on 1/13/14.
//  Copyright (c) 2014 Leandra Tejedor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

    //keeps track of if the timer has started
    bool start;

    //gets the exact time of when the button is pressed
    NSTimeInterval timePressed;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Sets the display time of the text to be 0
    self.display.text = @"0:00";
    
    //We set start to be false because we don't want time to begin until we press the button
    start = false;
}

- (void)update{
    //if start is false we should be updating
    if (start == false){
        return;
    }
    
    //we get the current time and use that to calculate the elapsed time
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval elapsedTime = currentTime - timePressed;
    
    //we calculate the minutes
    int minutes = (int)(elapsedTime / 60.0);
    
    //we calculate the seconds
    int seconds = (int)(elapsedTime = elapsedTime - (minutes * 60));
    
    //we update our label with the current time
    self.display.text = [NSString stringWithFormat:@"%u:%02u", minutes, seconds];
    
    //we recursively call update to get the new time
    [self performSelector:@selector(update) withObject:self afterDelay: 0.1];

    
    
}

- (IBAction)buttonPressed:(id)sender {
    //if start is false then we need to update the label with the new time
    if (start == false){
        
        //since it is false we need to reset it back to true
        start = true;
        
        //Gets the current time
        timePressed = [NSDate timeIntervalSinceReferenceDate];
        
        //Changes the title of the button to stop!
        [sender setTitle:@"Stop!" forState:UIControlStateNormal];
        
        //calls the update method
        [self update];
        
    }else{
        //since it is false we need to reset it back to false
        start = false;
        
        //changes the title of the button back to start
        [sender setTitle:@"Start" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
