//
//  Registration.h
//  Nov20Project50
//
//  Created by student on 2016-11-27.
//  Copyright © 2016 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Registration : UIViewController{
    
    IBOutlet UITextField *username;
    IBOutlet UITextField *password;
    IBOutlet UITextField *confirmPassword;
    IBOutlet UITextField *firstName;
    IBOutlet UITextField *lastName;
    IBOutlet UITextField *EmailID;
    IBOutlet UITextField *phoneNumber;
    IBOutlet UITextField *postalCode;
}

- (IBAction)register:(id)sender;

@end
