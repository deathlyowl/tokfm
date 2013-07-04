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
@synthesize program, title;

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
    [self.navigationItem setTitle:title];
    [self.descriptionTextView setText:[program objectForKey:@"description"]];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
