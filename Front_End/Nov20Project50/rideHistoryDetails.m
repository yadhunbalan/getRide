//
//  rideHistoryDetails.m
//  Nov20Project50
//
//  Created by yadhubalan on 2017-03-08.
//  Copyright © 2017 student. All rights reserved.
//

#import "rideHistoryDetails.h"

@interface rideHistoryDetails ()

@end

@implementation rideHistoryDetails

- (void)viewDidLoad {
    [super viewDidLoad];
NSString *history_url=[NSString stringWithFormat:@"http://localhost:8080/RideShare/mobile/rideshare/reserveddetails/%1@",self.r_id];
NSLog(@"%@", history_url);
NSURLSession *mysession=[NSURLSession sharedSession];
[[mysession dataTaskWithURL:[NSURL URLWithString:history_url]completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
    NSLog(@"Inside url");
    if(data.length>0 && error==nil) {
        NSLog(@"json fetch");
        NSDictionary *mymainjsonobject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        NSArray *searchResults=[mymainjsonobject objectForKey:@"Reserved_by"];
        NSMutableArray *name=[NSMutableArray arrayWithCapacity:searchResults.count];
        
        for(NSDictionary *mysingleresult in searchResults){
            NSLog(@"start");
            NSString *fname=[[mysingleresult objectForKey:@"First_name"]stringValue];
            NSString *lname=[[mysingleresult objectForKey:@"Last_name"]stringValue];
            
            [name addObject:[NSString stringWithFormat:@"%1@ %2@",fname,lname]];
            
        }
        self.name=[name copy];
        
        
    }
    
}
  ]resume];
// Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int i;
    
    
    while(self.name.count==0){
        i=[self.name count];
        NSLog(@"waiting");
        
    }
    return [self.name count];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row+1];
    cell.detailTextLabel.text=[self.name objectAtIndex:indexPath.row];
    
    
    return cell;
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
