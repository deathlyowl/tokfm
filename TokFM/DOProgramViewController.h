//
//  DOProgramViewController.h
//  TokFM
//
//  Created by Paweł Ksieniewicz on 03.07.2013.
//  Copyright (c) 2013 Deathly Owl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DOProgramViewController : UIViewController

@property (nonatomic, retain) NSDictionary *programDictionary;
@property (nonatomic, retain) NSString *programTitle;
@property (nonatomic, retain) NSString *day;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) IBOutlet UILabel *hostLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
