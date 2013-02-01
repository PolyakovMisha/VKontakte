//
//  WebView.h
//  VKontakte
//
//  Created by svp on 02.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MYPresentModalProtokol <NSObject>
@required
-(void)dissmiss;

@end

@interface WebView : UIViewController <UIWebViewDelegate>
{
    NSMutableURLRequest *request1;
    id <MYPresentModalProtokol> delegate;
}

@property (retain, nonatomic) IBOutlet UIWebView *web;
@property (retain, nonatomic) NSMutableURLRequest *request1;
@property (retain, nonatomic) id <MYPresentModalProtokol> delegate;
@property (retain, nonatomic) NSData *data1;

- (void)webViewDidStartLoad:(UIWebView *)webView;
- (void)webViewDidFinishLoad:(UIWebView *)webView;

-(void)callDissmiss;
@end
