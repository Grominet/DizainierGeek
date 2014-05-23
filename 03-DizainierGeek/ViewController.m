//
//  ViewController.m
//  03-DizainierGeek
//
//  Created by Arnaud Leclaire on 14/05/2014.
//  Copyright (c) 2014 GromiNet. All rights reserved.
//

#import "ViewController.h"
//#import "maView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    vue = [[maView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [[self view] addSubview:vue];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [vue setFromOrientation:toInterfaceOrientation];
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    //[vue setFromOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

@end
