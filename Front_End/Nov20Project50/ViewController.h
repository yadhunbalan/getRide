//
//  ViewController.h
//  Nov20Project50
//
//  Created by student on 2016-11-20.
//  Copyright © 2016 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
    

@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet NSString *pword;


- (IBAction)Login:(id)sender;
- (IBAction)Register:(id)sender;
- (IBAction)ForgetPassword:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet NSString *uname;
@property(nonatomic,assign) BOOL performSegue;


@end

