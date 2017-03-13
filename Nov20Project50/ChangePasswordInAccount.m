//
//  ChangePasswordInAccount.m
//  Nov20Project50
//
//  Created by yadhubalan on 2017-03-04.
//  Copyright © 2017 student. All rights reserved.
//

#import "ChangePasswordInAccount.h"
#import "AppDelegate.h"

@interface ChangePasswordInAccount ()

@end

@implementation ChangePasswordInAccount

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changePassword:(id)sender {
    if([old_password.text isEqual:self.password]){
        if([new_password.text isEqual:confirm_password.text]){
            NSString *account_url=[NSString stringWithFormat:@"http://localhost:8080/RideShare/mobile/rideshare/passwordChange/%1@&%2@",self.uid,new_password.text];
            NSLog(@"%@",account_url);
            //[[UIApplication sharedApplication] openURL:account_url];
            
            NSURLSession *mysession=[NSURLSession sharedSession];
            [[mysession dataTaskWithURL:[NSURL URLWithString:account_url]completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
                NSLog(@"Inside url");
            }
              ]resume];
            
            UIAlertController * alert= [UIAlertController alertControllerWithTitle:@"Alert"
                                                                           message:@"Password updated" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *
            defaultAction = [ UIAlertAction actionWithTitle
                             :@"OK" style :
                             UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action )
                             {}];
            [alert addAction :
             defaultAction ];
            [ self presentViewController : alert animated: YES completion : nil ];
            
        }
        else{
            UIAlertController * alert= [UIAlertController alertControllerWithTitle:@"Alert"
                                                                           message:@"Passwords doesn't match" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *
            defaultAction = [ UIAlertAction actionWithTitle
                             :@"OK" style :
                             UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action )
                             {}];
            [alert addAction :
             defaultAction ];
            [ self presentViewController : alert animated: YES completion : nil ];
                    }
    }
    else{
        UIAlertController * alert= [UIAlertController alertControllerWithTitle:@"Alert"
                                                                       message:@"Wrong password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *
        defaultAction = [ UIAlertAction actionWithTitle
                         :@"OK" style :
                         UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action )
                         {}];
        [alert addAction :
         defaultAction ];
        [ self presentViewController : alert animated: YES completion : nil ];
            }
    
    

    }
@end
