//
//  changePassword.h
//  Nov20Project50
//
//  Created by student on 2016-11-27.
//  Copyright © 2016 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface changePassword : UIViewController{
    
    IBOutlet UILabel *username;
    IBOutlet UITextField *newpassword;
    IBOutlet UITextField *confirmpassword;
}
- (IBAction)changepassword:(id)sender;

@property (strong, nonatomic) NSString *uname;


@end
