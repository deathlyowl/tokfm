//
//  RadioDataModel.h
//  TokFM
//
//  Created by Paweł Ksieniewicz on 03.07.2013.
//  Copyright (c) 2013 Deathly Owl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RadioDataModel : NSObject

@property (nonatomic, retain) NSURL *streamURL;

+ (RadioDataModel *) sharedObject;

@end
