//
//  DONowPlayingViewController.m
//  TokFM
//
//  Created by Paweł Ksieniewicz on 04.07.2013.
//  Copyright (c) 2013 Deathly Owl. All rights reserved.
//

#import "DONowPlayingViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DONowPlayingViewController ()

@end

@implementation DONowPlayingViewController

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
    
    [_hostImageView.layer setCornerRadius:32];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
