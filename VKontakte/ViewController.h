//
//  ViewController.h
//  VKontakte
//
//  Created by svp on 26.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebTextView.h"

@interface ViewController : UIViewController <UITextFieldDelegate, MYWebProtokol>
@property (retain, nonatomic) IBOutlet UITextField *email;
@property (retain, nonatomic) IBOutlet UITextField *pass;

- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@end
