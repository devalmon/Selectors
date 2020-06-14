//
//  SceneDelegate.m
//  Selectors
//
//  Created by Alexey Baryshnikov on 22.05.2020.
//  Copyright © 2020 Alexey Baryshnikov. All rights reserved.
//

#import "SceneDelegate.h"
#import "MyObject.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
//    SEL selector1 = @selector(testMethod);
//    SEL selector2 = @selector(testMethod:);
//    SEL selector3 = @selector(testMethod:withParameter:);
//    [self performSelector:selector1];
//    [self performSelector:selector2 withObject:@"str1"];
//    [self performSelector:selector3 withObject:@"f1" withObject:@"f2"];
//    [self performSelector:selector2 withObject:@"asd" afterDelay:5.f];
    
//    MyObject *obj = MyObject.new;
    
//    [obj performSelector:@selector(testExternalMethod)];
//    NSLog(@"%@", [obj performSelector:@selector(superSecretMethod)]);
    
//    NSLog(@"%@", [self testMethodWithParam1:12 param2:12.0 param3:13.5]);
    
    NSMethodSignature *signature = [SceneDelegate instanceMethodSignatureForSelector:@selector(testMethodWithParam1:param2:param3:)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    [invocation setTarget:self];
    [invocation setSelector:@selector(testMethodWithParam1:param2:param3:)];
    
    NSInteger iValue = 1;
    CGFloat fValue = 23.0f;
    double dValue = 211.23f;
    
    [invocation setArgument:&iValue atIndex:2];
    [invocation setArgument:&fValue atIndex:3];
    [invocation setArgument:&dValue atIndex:4];
    
    [invocation invoke];
    
    __unsafe_unretained NSString *str = nil;
    [invocation getReturnValue:&str];
    NSLog(@"%@", str);
}

- (NSString *) testMethodWithParam1: (NSInteger) intValue param2: (CGFloat) floatValue param3: (double) doubleValue {
    return [NSString stringWithFormat:@"string: with param1 = %ld, param2= %.2f, param3 = %.1f", intValue, floatValue, doubleValue];
}

- (void) testMethod {
    NSLog(@"TestMethod");
}

- (void) testMethod: (NSString *) string {
    NSLog(@"testMethod: %@", string);
}

- (void) testMethod: (NSString *) string withParameter: (NSString *) string2 {
    NSLog(@"%@, %@", string, string2);
}

- (void) testMethodWithInt: (NSInteger) numb {
    NSLog(@"%ld", numb);
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
