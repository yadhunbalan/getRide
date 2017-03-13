//
//  Profile.h
//  Nov20Project50
//
//  Created by yadhubalan on 2017-03-04.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Profile : UIViewController{
    
    IBOutlet UILabel *namelabel;
    IBOutlet UILabel *idlabel;
    IBOutlet UILabel *emaillabel;
    IBOutlet UILabel *mobilelabel;
}
@property(nonatomic,strong) NSString *uid;
@property(nonatomic,strong) NSString *password;


- (IBAction)changePassword:(id)sender;

- (IBAction)rideHistory:(id)sender;

@end
