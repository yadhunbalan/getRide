//
//  ViewController.m
//  Nov20Project50
//
//  Created by student on 2016-11-20.
//  Copyright © 2016 student. All rights reserved.
//

#import "ViewController.h"
#import "UserProfile.h"
#import "changePassword.h"
#import "detailpage.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //self.performSegue=YES;
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *) identifier sender:(id)sender{
    
    if ([identifier isEqualToString:@"UserProfile"]) {
        NSString *url=[NSString stringWithFormat:@"http://localhost:8080/RideShare/mobile/rideshare/login/%1$@&%2$@",self.username.text,self.password.text];
        NSLog(@"%@", url);
        
        NSURLSession *mysession=[NSURLSession sharedSession];
        [[mysession dataTaskWithURL:[NSURL URLWithString:url]completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
            NSLog(@"Inside url");
            if(data.length>0 && error==nil) {
                NSLog(@"Fetching json object");
                NSDictionary *mymainjsonobject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                
                NSString *login=[mymainjsonobject objectForKey:@"Login"];                    if([login isEqualToString:@"success"]){                        self.performSegue=YES;
                    self.uname=self.username.text;
                    self.pword=self.password.text;
                    AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    appDel.user_id=self.uname;
                    
                    
                }
            }
                else{
                    NSLog(@"No objects in json");
                    self.performSegue=NO;
                }
            }
          ]resume];
        
        
     if (self.performSegue) {
                NSLog(@"Perform segue");
                return YES;
            }
     else{
         
                UIAlertController * alert= [UIAlertController alertControllerWithTitle:@"Alert"
                                                                               message:@"Login Failure" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *
                defaultAction = [ UIAlertAction actionWithTitle
                                 :@"OK" style :
                                 UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action )
                                 {}];
                [alert addAction :
                 defaultAction ];
                [ self presentViewController : alert animated: YES completion : nil ];
                return NO;

            }
    }
    return YES;
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    /*if ([segue.identifier isEqualToString:@"UserProfile"]) {
        
        NSLog(@"UserProfile");
        UserProfile *user=(UserProfile *) segue.destinationViewController;
        user.uname=self.username.text;
        user.pword=self.password.text;
        
    }*/
    if([segue.identifier isEqualToString:@"changePassword"]){
        NSLog(@"Change Password");
        changePassword *changepassword=(changePassword *)segue.destinationViewController;
        changepassword.uname=self.username.text;
    }
}

- (IBAction)Login:(id)sender {
    
    /*UserProfile *user = [[UserProfile alloc] initWithNib:@"ViewControllerB" bundle:nil];
    user.uname = self.uname;
    */
    /*if (self.username.text && self.password.text) {
        [self performSegueWithIdentifier:@"UserProfile" sender:self];}
    else{
        UIAlertController * alert= [UIAlertController alertControllerWithTitle:@"Alert"
                                                                       message:@"Wrong userID or password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *
        defaultAction = [ UIAlertAction actionWithTitle
                         :@"OK" style :
                         UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action )
                         {}];
        [alert addAction :
         defaultAction ];
        [ self presentViewController : alert animated: YES completion : nil ];
        
    }*/
   }

- (IBAction)Register:(id)sender {
}

- (IBAction)ForgetPassword:(id)sender {
    
    [self performSegueWithIdentifier:@"changePassword" sender:self];
}
@end
