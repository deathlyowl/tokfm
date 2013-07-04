//
//  DOProgramViewController.m
//  TokFM
//
//  Created by Paweł Ksieniewicz on 03.07.2013.
//  Copyright (c) 2013 Deathly Owl. All rights reserved.
//

#import "DOProgramViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation DOProgramViewController
@synthesize programDictionary, programTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [_imageView.layer setCornerRadius:32];
    [super viewDidLoad];
    [self configureView];
}

- (void) configureView
{
    [self.navigationItem setTitle:programTitle];
    [self.descriptionTextView setText:[programDictionary objectForKey:@"description"]];
    
    NSString *hostName;
    
    if ([[programDictionary objectForKey:@"host"] isKindOfClass:[NSDictionary class]])
        hostName = [[programDictionary objectForKey:@"host"] objectForKey:_day];
    else
        hostName = [[[programDictionary objectForKey:@"host"] componentsSeparatedByString:@";"] firstObject];
    
    [_hostLabel setText:hostName];
    
    NSString *hostImagename = [[hostName lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    UIImage *avatar = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:hostImagename
                                                                                       ofType:@"jpg"]];
    
    NSLog(@"F: %@ — %@", hostName, hostImagename);
    NSLog(@"I: %@", avatar);
    
    if (avatar) [_imageView setImage:avatar];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
