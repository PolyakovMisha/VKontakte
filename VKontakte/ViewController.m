//
//  ViewController.m
//  VKontakte
//
//  Created by svp on 26.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize email;
@synthesize pass;

- (void)dealloc {
    [email release];
    [pass release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    pass.secureTextEntry=YES;
	// Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    WebTextView *objectWebTextView=[[WebTextView alloc]initWithNibName:@"WebTextView" bundle:nil];
    objectWebTextView.delegate=self;
    objectWebTextView.emailWebTextView=email.text;
    objectWebTextView.passWebTextView=pass.text;
    [self.navigationController pushViewController:objectWebTextView animated:YES];
    [objectWebTextView release];
    return YES;
}

@end
