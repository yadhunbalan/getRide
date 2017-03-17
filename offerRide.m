//
//  offerRide.m
//  Nov20Project50
//
//  Created by yadhubalan on 2017-02-26.
//  Copyright © 2017 student. All rights reserved.
//

#import "offerRide.h"
#import "AppDelegate.h"


@interface offerRide ()

@end

@implementation offerRide

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
- (IBAction)datePicker:(id)sender {
    NSDate *rideDate=[sender date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MM-yyyy hh:mm a"];
    NSLog(@"%@",[df stringFromDate:rideDate]);
    self.rideDate=[df stringFromDate:rideDate];
    
}

- (IBAction)addRide:(id)sender {
    AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString *url=[NSString stringWithFormat:@"http://localhost:8080/RideShare/mobile/rideshare/addride/%1@&%2@&%3@&%4@&%3@&%4@&%5@",appDel.user_id,vehicle.text,seats.text,price.text,destination.text,description.text,self.rideDate];
    NSLog(@"%@",url);
}

@end
