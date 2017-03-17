//
//  changePassword.m
//  Nov20Project50
//
//  Created by student on 2016-11-27.
//  Copyright © 2016 student. All rights reserved.
//

#import "changePassword.h"


@interface changePassword ()

@end

@implementation changePassword

- (void)viewDidLoad {
    [super viewDidLoad];
    username.text=self.uname;
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




- (IBAction)changepassword:(id)sender {
        NSString *url=[NSString stringWithFormat:@"http://localhost:8080/RideShare/mobile/rideshare/validateuser/%1$@&%2$@",self.uname,useremail.text];
    NSLog(@"%@", url);
    
    NSURLSession *mysession=[NSURLSession sharedSession];
    [[mysession dataTaskWithURL:[NSURL URLWithString:url]completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        NSLog(@"Inside url");
        if(data.length>0 && error==nil) {
            NSLog(@"Fetching json object");
            NSDictionary *mymainjsonobject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            
            self.status=[mymainjsonobject objectForKey:@"Status"];
        }
    }]resume];
    if([self.status isEqualToString:@"success"]){
    
    if(newpassword.text!=NULL&&confirmpassword.text!=NULL){
        NSString *newpass=newpassword.text;
        NSString *confpass=confirmpassword.text;
        if([newpass isEqual:confpass]){
            NSString *account_url=[NSString stringWithFormat:@"http://localhost:8080/RideShare/mobile/rideshare/passwordChange/%1@&%2@",self.uname,newpass];
            NSLog(@"%@",account_url);
            //[[UIApplication sharedApplication] openURL:account_url];
            
            NSURLSession *mysession=[NSURLSession sharedSession];
            [[mysession dataTaskWithURL:[NSURL URLWithString:account_url]completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
                NSLog(@"Inside url");
            }
              ]resume];
            
            
        
            UIAlertController * alert= [UIAlertController alertControllerWithTitle:@"Alert"
                                                                           message:@"Password Changed" preferredStyle:UIAlertControllerStyleAlert];
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
                                                                           message:@"Password entered doesn't match" preferredStyle:UIAlertControllerStyleAlert];
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
                                                                       message:@"Please don't leave the boxes empty" preferredStyle:UIAlertControllerStyleAlert];
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
                                                                       message:@"Enter correct email to verify user" preferredStyle:UIAlertControllerStyleAlert];
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
