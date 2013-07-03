//
//  DOProgramViewController.m
//  TokFM
//
//  Created by Paweł Ksieniewicz on 03.07.2013.
//  Copyright (c) 2013 Deathly Owl. All rights reserved.
//

#import "DOProgramViewController.h"

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
    [super viewDidLoad];
    [self.navigationItem setTitle:title];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
