//
//  changePassword.m
//  Nov20Project50
//
//  Created by student on 2016-11-27.
//  Copyright © 2016 student. All rights reserved.
//

#import "changePassword.h"
#import "passwordChangeStatus.h"

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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"passwordchnagestatus"]) {
        
        NSLog(@"UserProfile");
        passwordChangeStatus *passchange=(passwordChangeStatus *) segue.destinationViewController;
        passchange.username=self.uname;
        passchange.password=confirmpassword.text;
    }
}



- (IBAction)changepassword:(id)sender {
    
    if(newpassword.text!=NULL&&confirmpassword.text!=NULL){
        NSString *newpass=newpassword.text;
        NSString *confpass=confirmpassword.text;
        if([newpass isEqual:confpass]){
            [self performSegueWithIdentifier:@"passwordchnagestatus" sender:self];
           

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




@end
