//
//  rideHistory.m
//  Nov20Project50
//
//  Created by yadhubalan on 2017-03-05.
//  Copyright © 2017 student. All rights reserved.
//

#import "rideHistory.h"
#import "AppDelegate.h"
#import "rideHistoryDetails.h"

@interface rideHistory ()

@end

@implementation rideHistory

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString *history_url=[NSString stringWithFormat:@"http://localhost:8080/RideShare/mobile/rideshare/ridehistory/%1@",appDel.user_id];
    NSLog(@"%@", history_url);
    NSURLSession *mysession=[NSURLSession sharedSession];
    [[mysession dataTaskWithURL:[NSURL URLWithString:history_url]completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        NSLog(@"Inside url");
        if(data.length>0 && error==nil) {
            NSLog(@"json fetch");
            NSDictionary *mymainjsonobject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            
            NSArray *searchResults=[mymainjsonobject objectForKey:@"Ride_History"];
            NSMutableArray *r_id=[NSMutableArray arrayWithCapacity:searchResults.count];
            NSMutableArray *priceArray=[NSMutableArray arrayWithCapacity:searchResults];
            NSMutableArray *destinationArray=[NSMutableArray arrayWithCapacity:searchResults];
            for(NSDictionary *mysingleresult in searchResults){
                NSLog(@"start");
                NSString *ride_id=[[mysingleresult objectForKey:@"Ride_id"]stringValue];
                NSString *price=[[mysingleresult objectForKey:@"Price"]stringValue];
                NSString *destiation=[mysingleresult objectForKey:@"Destination"];
                [r_id addObject:[NSString stringWithFormat:@"%@ ",ride_id]];
                [priceArray addObject:[NSString stringWithFormat:@"%@ ",price]];
                [destinationArray addObject:[NSString stringWithFormat:@"%@ ",destiation]];
            }
            self.Ride_id=[r_id copy];
            self.Price=[priceArray copy];
            self.Destination=[destinationArray copy];
            
        }
        
    }
      ]resume];
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int i;
    
    
    while(self.Ride_id.count==0){
        i=[self.Ride_id count];
        NSLog(@"waiting");
        
    }
    return [self.Ride_id count];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text=[self.Destination objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[self.Price objectAtIndex:indexPath.row];
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    self.r_id=[self.Ride_id objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"historydetails" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"detailPage"]){
        rideHistoryDetails *detailPage=(rideHistoryDetails *)segue.destinationViewController;
        
        detailPage.r_id=self.r_id;
        NSString *url=[NSString stringWithFormat:@"http://localhost:8080/RideShare/mobile/rideshare/reserveddetails/%@",detailPage.r_id];
        NSLog(@"%@", url);
    }
    
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
