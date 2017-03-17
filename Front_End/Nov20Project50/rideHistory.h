//
//  rideHistory.h
//  Nov20Project50
//
//  Created by yadhubalan on 2017-03-05.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rideHistory : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
}
@property(nonatomic,retain) NSArray *Price;
@property(nonatomic,retain) NSArray *Destination;
@property(nonatomic,retain) NSArray *Ride_id;
@property(nonatomic,retain) NSString *r_id;


@end
