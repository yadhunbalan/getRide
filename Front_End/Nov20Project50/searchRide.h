//
//  searchRide.h
//  Nov20Project50
//
//  Created by yadhubalan on 2017-02-22.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface searchRide : UIViewController{
    
    IBOutlet UITextField *destinationName;
}
- (IBAction)search:(id)sender;
@property (nonatomic,retain) NSString *user_id;
@end
