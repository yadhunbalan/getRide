//
//  detailpage.h
//  Nov20Project50
//
//  Created by yadhubalan on 2017-02-25.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailpage : UIViewController{

    IBOutlet UILabel *name;
    
    IBOutlet UILabel *dest;
    
    IBOutlet UILabel *Price;
    IBOutlet UILabel *Seats;
    IBOutlet UILabel *Vehicle;
    IBOutlet UILabel *desc;
}
- (IBAction)bookRide:(id)sender;
@property(nonatomic,retain) NSString *ride_id;
@property (nonatomic, retain)NSString *details;

@end
