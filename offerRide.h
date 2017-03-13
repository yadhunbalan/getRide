//
//  offerRide.h
//  Nov20Project50
//
//  Created by yadhubalan on 2017-02-26.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface offerRide : UIViewController{
    
    IBOutlet UITextField *destination;
    IBOutlet UITextField *vehicle;
    IBOutlet UITextField *price;
    IBOutlet UITextField *seats;
    IBOutlet UITextField *description;
}
- (IBAction)addRide:(id)sender;

@end
