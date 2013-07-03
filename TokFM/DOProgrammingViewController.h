//
//  DOProgrammingViewController.h
//  TokFM
//
//  Created by Paweł Ksieniewicz on 03.07.2013.
//  Copyright (c) 2013 Deathly Owl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DOProgrammingViewController : UITableViewController {
    NSString *day;
    NSDictionary *programming;
    NSArray *keys;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *weekdayControl;
- (IBAction)valueChanged:(id)sender;

@end
