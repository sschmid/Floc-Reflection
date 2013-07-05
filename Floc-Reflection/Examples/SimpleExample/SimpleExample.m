//
// Created by Simon Schmid
//
// contact@sschmid.com
//

#import "SimpleExample.h"
#import "Car.h"
#import "FLReflection.h"
#import "Engine.h"

@implementation SimpleExample

- (id)init {
    self = [super init];
    if (self) {

        @protocol(Engine);
        Car *car = [[Car alloc] init];

        // Check type
        BOOL isClass = [FLReflection isClass:car];
        BOOL isProtocol = [FLReflection isProtocol:car];
        BOOL isBlock = [FLReflection isBlock:car];
        BOOL isInstance = [FLReflection isInstance:car];

        NSLog(@"isClass = %d", isClass);
        NSLog(@"isProtocol = %d", isProtocol);
        NSLog(@"isBlock = %d", isBlock);
        NSLog(@"isInstance = %d", isInstance);


        // Get all property names
        NSArray *propertyNames = [FLReflection getAllPropertyNamesOfClass:[Car class]];
        NSLog(@"propertyNames = %@", propertyNames);


        // Get type of properties
        id wheelType = [FLReflection getTypeForProperty:@"wheel" ofClass:[Car class]];
        id engineType = [FLReflection getTypeForProperty:@"engine" ofClass:[Car class]];

        NSLog(@"wheelType = %@", NSStringFromClass(wheelType));
        NSLog(@"engineType = <%@>", NSStringFromProtocol(engineType));

    }

    return self;
}

@end