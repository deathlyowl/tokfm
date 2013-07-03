//
//  RadioDataModel.m
//  TokFM
//
//  Created by Paweł Ksieniewicz on 03.07.2013.
//  Copyright (c) 2013 Deathly Owl. All rights reserved.
//

#import "RadioDataModel.h"

@implementation RadioDataModel
@synthesize streamURL, programming, programs;

+ (RadioDataModel *) sharedObject
{
    static dispatch_once_t once;
    static RadioDataModel *sharedObject;
    dispatch_once(&once, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}

- (id)init{
    if (self = [super init]) {
        
        NSError *error = [[NSError alloc] init];
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tokfm"
                                                                                                                                         ofType:@"json"] encoding:NSUTF8StringEncoding
                                                                                                   error:nil] dataUsingEncoding:NSUTF8StringEncoding]
                                                             options:kNilOptions
                                                               error:&error];
        
        streamURL = [NSURL URLWithString:[json objectForKey:@"stream"]];
        programming = [json objectForKey:@"programming"];
        programs = [json objectForKey:@"programs"];
    }
    return self;
}

@end
