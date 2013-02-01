//
//  WebTextView.m
//  VKontakte
//
//  Created by svp on 26.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebTextView.h"

@implementation WebTextView
@synthesize textView;
@synthesize delegate;
@synthesize dataTextView;
@synthesize emailWebTextView;
@synthesize passWebTextView;
@synthesize request;
@synthesize cookies;

- (void)dealloc {
    [textView release];
    [dataTextView release];
    [emailWebTextView release];
    [passWebTextView release];
    [request release];
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

#pragma mark - methods MyWebProtokol


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    textView.text=@"";
	[[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    NSURL *url=[NSURL URLWithString:
                [NSString stringWithFormat:@"http://github.com/login?email=%@&pass=%@",emailWebTextView,passWebTextView]]; 
    request=[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0f];
    
    NSURLConnection *connection=[NSURLConnection connectionWithRequest:request delegate:self];
    if (connection) {
        dataTextView=[[NSMutableData   data]retain];
    }else {
        [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
    }
    UIBarButtonItem *buttonLogin=[[UIBarButtonItem alloc]initWithTitle:@"Login enter" style:UIBarButtonItemStyleDone target:self action:@selector(actionLogin)];
    self.navigationItem.leftBarButtonItem=buttonLogin;
    UIBarButtonItem *buttonWeb=[[UIBarButtonItem alloc]initWithTitle:@"WebPage Show" style:UIBarButtonItemStyleDone target:self action:@selector(actionWeb)];
    self.navigationItem.rightBarButtonItem=buttonWeb;
    [buttonWeb release];
    [buttonLogin release];

}

-(void)actionLogin
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)actionWeb
{
    wv=[[WebView alloc]initWithNibName:nil bundle:nil];
    wv.delegate=self;
    wv.request1=self.request;
    wv.data1=self.dataTextView;
    navCntr=[[UINavigationController alloc]initWithRootViewController:wv];
    navCntr.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:navCntr animated:YES];
}

-(void)dissmiss
{
    
    [wv release];
    [navCntr release];
    [self dismissModalViewControllerAnimated:YES];
}


#pragma mark -methods NSURLConnection


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [dataTextView appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *pageSource=[[NSString alloc]initWithData:dataTextView encoding:NSASCIIStringEncoding];
    //UIWebView *webv=[[UIWebView alloc]initWithCoder:[dataTextView mutableBytes]];
    //UIWebView *webv=[[UIWebView alloc]init];
    
    // NSString *pageSource=[[NSString alloc]initWithBytes:[dataTextView mutableBytes] length:[dataTextView length] encoding:NSUTF8StringEncoding];
    
    textView.text=pageSource; 
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
    [pageSource release];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
        [dataTextView setLength:0];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error");
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
}




@end
