//
//  passwordChangeStatus.h
//  Nov20Project50
//
//  Created by student on 2016-11-27.
//  Copyright © 2016 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface passwordChangeStatus : UIViewController{
    
    IBOutlet UILabel *status;
}
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;

@end
