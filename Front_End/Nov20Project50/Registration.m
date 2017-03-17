//
//  Registration.m
//  Nov20Project50
//
//  Created by student on 2016-11-27.
//  Copyright © 2016 student. All rights reserved.
//

#import "Registration.h"
#import "registerStatus.h"

@interface Registration ()

@end

@implementation Registration

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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"RegisterStatus"]) {
        
        NSLog(@"RegisterStatus");
        registerStatus *statusofregister=(registerStatus *) segue.destinationViewController;
        NSString *str1=username.text;
        NSString *str2=password.text;
        NSString *url1=[NSString stringWithFormat:@"http://74.208.82.123:8080/userprofile/mobile/profile/register&zied&zaier&zzaier@cegepgim.ca&h3s1k1&5145555555&%1$@&%2$@",str1,str2];
       // NSLog(url1);
        statusofregister.url=url1;
        
        
    }
}

- (IBAction)register:(id)sender {
   /* if(username.text&&password.text&&confirmPassword.text&&firstName.text&&lastName.text&&EmailID.text&&phoneNumber.text&&postalCode.text){*/
        [self performSegueWithIdentifier:@"RegisterStatus" sender:self];
        
    /*}
    else{
        UIAlertController * alert= [UIAlertController alertControllerWithTitle:@"Alert"
                                                                       message:@"Please don't leave fields empty" preferredStyle:UIAlertControllerStyleAlert];
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
    */
    
    
}
@end
