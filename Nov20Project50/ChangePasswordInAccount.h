//
//  ChangePasswordInAccount.h
//  Nov20Project50
//
//  Created by yadhubalan on 2017-03-04.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordInAccount : UIViewController{
    
    IBOutlet UITextField *old_password;
    IBOutlet UITextField *new_password;
    IBOutlet UITextField *confirm_password;
}
@property(nonatomic,strong) NSString *password;
@property(nonatomic,strong) NSString *uid;
- (IBAction)changePassword:(id)sender;
@end
