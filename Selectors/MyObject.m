//
//  MyObject.m
//  Selectors
//
//  Created by Alexey Baryshnikov on 22.05.2020.
//  Copyright © 2020 Alexey Baryshnikov. All rights reserved.
//

#import "MyObject.h"

@implementation MyObject

- (void) testExternalMethod {
    NSLog(@"testExternalMethod");
}

- (NSString *) superSecretMethod {
    return @"Ups...not here";
}

@end
