//
//  tableView.h
//  Nov20Project50
//
//  Created by yadhubalan on 2017-02-25.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableView : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain) NSString *destination;
@property (nonatomic, retain)NSArray *name;
@property (nonatomic, retain)NSArray *priceSeat;
@property (nonatomic, retain)NSString *mystring;
@property (nonatomic, retain)NSArray *Student_id;


@end
