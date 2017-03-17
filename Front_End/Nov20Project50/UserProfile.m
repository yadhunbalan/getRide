//
//  UserProfile.m
//  Nov20Project50
//
//  Created by student on 2016-11-20.
//  Copyright © 2016 student. All rights reserved.
//

#import "UserProfile.h"
#import "searchRide.h"

@interface UserProfile ()

@end

@implementation UserProfile

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.uname);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"searchRide"]){
        searchRide *search=(searchRide *)segue.destinationViewController;
        search.user_id=self.uname;
        
    }
}





- (IBAction)offerRide:(id)sender {
    [self performSegueWithIdentifier:@"offerRide" sender:self];
}

- (IBAction)getRide:(id)sender {
    [self performSegueWithIdentifier:@"searchRide" sender:self];
}

- (IBAction)selectMap:(id)sender {
    switch (((UISegmentedControl *)sender ) .selectedSegmentIndex) {
        case 0:
            myMapview.mapType=MKMapTypeStandard;
            break;
        case 1:
           myMapview.mapType=MKMapTypeSatellite;
            break;
       default:
            break;
    }

}
@end
