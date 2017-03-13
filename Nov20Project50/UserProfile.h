//
//  UserProfile.h
//  Nov20Project50
//
//  Created by student on 2016-11-20.
//  Copyright © 2016 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface UserProfile : UIViewController{
    
    
    MKMapView *myMapview;
}
- (IBAction)offerRide:(id)sender;
- (IBAction)getRide:(id)sender;

- (IBAction)selectMap:(id)sender;
@property(strong,nonatomic) IBOutlet MKMapView *myMapView;

@property (strong, nonatomic) IBOutlet NSString *uname;
@property (strong, nonatomic) IBOutlet NSString *pword;

@end
