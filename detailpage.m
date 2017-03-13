//
//  detailpage.m
//  Nov20Project50
//
//  Created by yadhubalan on 2017-02-25.
//  Copyright © 2017 student. All rights reserved.
//

#import "detailpage.h"
#import "AppDelegate.h"

@interface detailpage ()

@end

@implementation detailpage

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *url=[NSString stringWithFormat:@"http://localhost:8080/RideShare/mobile/rideshare/driverdetails/%@",self.details];
    NSLog(@"%@", url);
    
    NSURLSession *mysession=[NSURLSession sharedSession];
    [[mysession dataTaskWithURL:[NSURL URLWithString:url]completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        NSLog(@"Inside url");
        if(data.length>0 && error==nil) {
            NSLog(@"json fetch");
            NSDictionary *mymainjsonobject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            
            NSArray *searchResults=[mymainjsonobject objectForKey:@"Driver_Details"];
            
            for(NSDictionary *mysingleresult in searchResults){
                NSLog(@"start");
                NSString *fname=[mysingleresult objectForKey:@"First_name"];
                NSString *lname=[mysingleresult objectForKey:@"Last_name"];
                
                name.text=[NSString stringWithFormat:@"%1@ %2@",fname,lname];
                NSString *destination=[mysingleresult objectForKey:@"Destination"];
                dest.lineBreakMode=NSLineBreakByCharWrapping;
                dest.numberOfLines=0;
                dest.text=destination;
                NSString *price=[[mysingleresult objectForKey:@"Price"] stringValue];
                Price.text=[NSString stringWithFormat:@"%@",price];
                NSLog(price);
                NSString *seat=[[mysingleresult objectForKey:@"Seats"] stringValue];
                NSString *vehicle=[mysingleresult objectForKey:@"Vehicle"];
                NSString *description=[mysingleresult objectForKey:@"Description"];
                Seats.text=seat;
                Vehicle.lineBreakMode=NSLineBreakByCharWrapping;
                Vehicle.numberOfLines=0;
                Vehicle.text=vehicle;
                
                desc.lineBreakMode = NSLineBreakByWordWrapping;
                desc.numberOfLines = 0;

                desc.text=description;
                self.ride_id=[[mysingleresult objectForKey:@"Ride_id"]stringValue];
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
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if([identifier isEqualToString:@"rideBooked"]){
        AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
  NSString *bookedRide_url=[NSString stringWithFormat:@"http://localhost:8080/RideShare/mobile/rideshare/bookseat/%1@&%2@",appDel.user_id,self.ride_id];
    NSLog(@"%@",bookedRide_url);
        NSLog(@"%@",appDel.user_id);
    
    NSURLSession *mysession=[NSURLSession sharedSession];
    [[mysession dataTaskWithURL:[NSURL URLWithString:bookedRide_url]completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        NSLog(@"Inside url");
    }
      ]resume];
        UIAlertController * alert= [UIAlertController alertControllerWithTitle:@"Status"
                                                                       message:@"Seat Booked " preferredStyle:UIAlertControllerStyleAlert];
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
    return YES;
}

- (IBAction)bookRide:(id)sender {
    
        [self performSegueWithIdentifier:@"rideBooked" sender:self];
    
}
@end
