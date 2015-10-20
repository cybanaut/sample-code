//
//  StringDrawing.m
//  Mega
//
//  Created by Tope Abayomi on 22/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringDrawing.h"

@implementation StringDrawing

+ (NSStringDrawingOptions)combine:(NSStringDrawingOptions)option1 with:(NSStringDrawingOptions)option2
{
    return option1 | option2;
}

@end