//
//  passwordChangeStatus.m
//  Nov20Project50
//
//  Created by student on 2016-11-27.
//  Copyright © 2016 student. All rights reserved.
//

#import "passwordChangeStatus.h"

@interface passwordChangeStatus ()

@end

@implementation passwordChangeStatus

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url=[NSString stringWithFormat:@"http://74.208.82.123:8080/userprofile/mobile/profile/register&zied&zaier&zzaier@cegepgim.ca&h3s1k1&5145555555&%1$@&%2$@",self.username,self.password];
    NSLog(url);
    NSURLSession *mysession=[NSURLSession sharedSession];
    [[mysession dataTaskWithURL:[NSURL URLWithString:url]completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        
        if(data.length>0 && error==nil) {
            
            NSLog(@"Password Status ");
            NSDictionary *mymainjsonobject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            if ([[mymainjsonobject allKeys] containsObject:@"Satus"]) {
                NSString *str=[mymainjsonobject objectForKey:@"Satus"];
                if ([str isEqual:@"WRONG"]||[str isEqual:@"ERROR"]) {
                    status.text=[mymainjsonobject objectForKey:@"message"];
                }
                else{
                    status.text=@"Password Changed Succesfully";
                }
            }
   
        }
    }
    ]resume];
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

@end
