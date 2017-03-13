//
//  registerStatus.m
//  Nov20Project50
//
//  Created by student on 2016-11-27.
//  Copyright © 2016 student. All rights reserved.
//

#import "registerStatus.h"

@interface registerStatus ()

@end

@implementation registerStatus

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLSession *mysession=[NSURLSession sharedSession];
    [[mysession dataTaskWithURL:[NSURL URLWithString:self.url]completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        
        if(data.length>0 && error==nil) {
            
            
            NSDictionary *mymainjsonobject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            if ([[mymainjsonobject allKeys] containsObject:@"Satus"]) {
                NSString *str=[mymainjsonobject objectForKey:@"Satus"];
                if ([str isEqual:@"WRONG"]||[str isEqual:@"ERROR"]) {
                    status.text=[mymainjsonobject objectForKey:@"message"];
                }
                else{
                    status.text=@"Registered Succesfully";
                }
            }
        }
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

@end
