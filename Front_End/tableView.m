//
//  tableView.m
//  Nov20Project50
//
//  Created by yadhubalan on 2017-02-25.
//  Copyright © 2017 student. All rights reserved.
//

#import "tableView.h"
#import "detailpage.h"

@interface tableView ()

@end

@implementation tableView

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *url=[NSString stringWithFormat:@"http://localhost:8080/RideShare/mobile/rideshare/%1$@",self.destination];
    NSLog(@"%@", url);
    
    NSURLSession *mysession=[NSURLSession sharedSession];
    [[mysession dataTaskWithURL:[NSURL URLWithString:url]completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        NSLog(@"Inside url");
        if(data.length>0 && error==nil) {
            NSLog(@"");
            NSDictionary *mymainjsonobject=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];            
            
            NSArray *searchResults=[mymainjsonobject objectForKey:@"AllRidesAvailable"];
            NSMutableArray *name=[NSMutableArray arrayWithCapacity:searchResults.count];
            NSMutableArray *priceSeat=[NSMutableArray arrayWithCapacity:searchResults.count];
            NSMutableArray *Student_id=[NSMutableArray arrayWithCapacity:searchResults.count];
            for(NSDictionary *mysingleresult in searchResults){
                NSString *fname=[mysingleresult objectForKey:@"First_name"];
                NSString *lname=[mysingleresult objectForKey:@"Last_name"];
                
                NSString *stuid=[[mysingleresult objectForKey:@"Student_id"] stringValue];
                NSString *rideid=[[mysingleresult objectForKey:@"Ride_id"] stringValue];
                NSString *price=[[mysingleresult objectForKey:@"Price"] stringValue];
                NSString *seat=[[mysingleresult objectForKey:@"Seats"] stringValue];
                
                [name addObject:[NSString stringWithFormat:@"%@ %@",fname,lname]];
                NSLog(fname);
                NSLog(stuid);
                [priceSeat addObject:[NSString stringWithFormat:@"Price:%@$ Seats:%@",price,seat]];
                [Student_id addObject:[NSString stringWithFormat:@"%@",stuid]];
            }
            self.name=[name copy];
            self.priceSeat=[priceSeat copy];
            self.Student_id=[Student_id copy];
        }
    }
      ]resume];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int i;
    
    
    while(self.name.count==0){
        i=[self.name count];
        NSLog(@"waiting");
        
    }
    return [self.name count];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text=[self.name objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[self.priceSeat objectAtIndex:indexPath.row];
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    self.mystring=[self.Student_id objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"detailPage" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"detailPage"]){
        detailpage *myPage=(detailpage *)segue.destinationViewController;
        
        myPage.details=self.mystring;
        NSString *url=[NSString stringWithFormat:@"http://localhost:8080/RideShare/mobile/rideshare/driverdetails/%@",myPage.details];
        NSLog(url);
    }
    
}
    // Do any additional setup after loading the view.


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

@end
