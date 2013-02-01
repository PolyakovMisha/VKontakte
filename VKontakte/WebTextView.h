//
//  WebTextView.h
//  VKontakte
//
//  Created by svp on 26.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebView.h"

@protocol MYWebProtokol <NSObject>

@optional
-(void)pushNavigatorWebTextView;

@end

@interface WebTextView : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate,MYPresentModalProtokol>
{
     NSArray *cookies;
    id <MYWebProtokol> delegate;
    NSString *emailWebTextView;
    NSString *passWebTextView;
    NSMutableData *dataTextView;
    WebView *wv;
    UINavigationController *navCntr;
    NSMutableURLRequest *request;
}

@property (nonatomic, retain) NSArray *cookies;
@property (retain, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, assign) id <MYWebProtokol> delegate;
@property (nonatomic, retain) NSMutableData *dataTextView;
@property (nonatomic, retain) NSString *emailWebTextView;
@property (nonatomic, retain) NSString *passWebTextView;
@property (nonatomic, retain) NSMutableURLRequest *request;

-(void)actionLogin;
-(void)actionWeb;

-(void)dissmiss;

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;

@end
