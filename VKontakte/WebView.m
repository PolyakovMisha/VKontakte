//
//  WebView.m
//  VKontakte
//
//  Created by svp on 02.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebView.h"

@implementation WebView
@synthesize web;
@synthesize request1;
@synthesize delegate;
@synthesize data1;

- (void)dealloc {
    [web release];
    [request1 release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    [web loadData:data1 MIMEType:@"text/html" textEncodingName:@"utf8" baseURL:nil];
    UIBarButtonItem *buttonWeb=[[UIBarButtonItem alloc]initWithTitle:@"Dismiss" style:UIBarButtonItemStyleDone target:self action:@selector(callDissmiss)];
    self.navigationItem.rightBarButtonItem=buttonWeb;
    [buttonWeb release];
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
    // Do any additional setup after loading the view from its nib.
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}


-(void)callDissmiss
{
    if (delegate) {
        [delegate dissmiss];
    }
}


- (void)viewDidUnload
{
    [self setWeb:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
