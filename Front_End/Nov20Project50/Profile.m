//
//  Profile.m
//  Nov20Project50
//
//  Created by yadhubalan on 2017-03-04.
//  Copyright © 2017 student. All rights reserved.
//

#import "Profile.h"
#import "AppDelegate.h"
#import "ChangePasswordInAccount.h"

@interface Profile ()

@end

@implementation Profile

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString *account_url=[NSString stringWithFormat:@"http://localhost:8080/RideShare/mobile/rideshare/account/%1@",appDel.user_id];
    NSLog(@"%@",account_url);
    NSLog(@"%@",appDel.user_id);
    NSURLSession *mysession=[NSURLSession sharedSession];
    [[mysession dataTaskWithURL:[NSURL URLWithString:account_url]completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        NSLog(@"Inside url");
        if(data.length>0 && error==nil) {
            NSLog(@"json fetch");
            NSDictionary *mymainjsonobject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            
            NSArray *searchResults=[mymainjsonobject objectForKey:@"UserProfile"];
            
            for(NSDictionary *mysingleresult in searchResults){
                NSLog(@"start");
                NSString *fname=[mysingleresult objectForKey:@"First_name"];
                NSLog(@"%@", fname);
                NSString *lname=[mysingleresult objectForKey:@"Last_name"];
                NSString *s_id=[[mysingleresult objectForKey:@"Student_id"]stringValue];
                NSLog(@"%@", lname);
                namelabel.text=[NSString stringWithFormat:@"%1@ %2@",fname,lname];
                NSLog(@"%@ %@", fname, lname);
                NSLog(@"%@",namelabel.text);
                idlabel.text=s_id;
                NSString *email=[mysingleresult objectForKey:@"Email"];
                NSLog(@"%@", email);
                emaillabel.lineBreakMode=NSLineBreakByCharWrapping;
                emaillabel.numberOfLines=0;
                emaillabel.text=email;
                NSString *mobile=[mysingleresult objectForKey:@"Mobile"] ;
                NSLog(@"%@", mobile);
                mobilelabel.text=mobile;
                NSLog(@"%@",mobile);
                self.password =[mysingleresult objectForKey:@"Password"] ;
                NSLog(@"%@", self.password);
                self.uid=s_id;
                           }
            
            
        }
        NSLog(@"end of fetching");
    }
      ]resume];
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
    if([segue.identifier isEqualToString:@"changepasswordInAccount"]){
        NSLog(@"Change Password in account");
        ChangePasswordInAccount *changepassword=(ChangePasswordInAccount *)segue.destinationViewController;
        changepassword.password=self.password;
        changepassword.uid=self.uid;
    }
}

- (IBAction)changePassword:(id)sender {
    [self performSegueWithIdentifier:@"changepasswordInAccount" sender:self];
    
}

- (IBAction)rideHistory:(id)sender {
}
@end
