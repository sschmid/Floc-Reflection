//
// Created by Simon Schmid
//
// contact@sschmid.com
//

#import "Kiwi.h"
#import "FLReflection.h"
#import "Car.h"
#import "Wheel.h"

SPEC_BEGIN(FLReflectionSpec)

        describe(@"Reflection", ^{

            it(@"gets the type of a property class", ^{
                id object = [FLReflection getTypeForProperty:@"wheel" ofClass:[Car class]];
                [[object should] equal:[Wheel class]];
            });

            it(@"gets the type of a property protocol", ^{
                id object = [FLReflection getTypeForProperty:@"engine" ofClass:[Car class]];
                [[object should] equal:@protocol(Engine)];
            });

            it(@"raises exeption for unknown property names", ^{
                [[theBlock(^{
                    [FLReflection getTypeForProperty:@"iDoNotExist" ofClass:[Car class]];
                }) should] raiseWithName:@"FLReflectionException"];
            });

            it(@"returns all property names", ^{
                NSArray *propertyNames = [FLReflection getAllPropertyNamesOfClass:[Car class]];
                [[theValue(propertyNames.count) should] equal:theValue(2)];
                [[propertyNames should] equal:@[@"wheel", @"engine"]];
            });

            it(@"is a class", ^{
                id object = [Car class];

                [[theValue([FLReflection isClass:object]) should] beYes];
                [[theValue([FLReflection isProtocol:object]) should] beNo];
                [[theValue([FLReflection isBlock:object]) should] beNo];
                [[theValue([FLReflection isInstance:object]) should] beNo];
            });

            it(@"is a protocol", ^{
                id object = @protocol(Engine);

                [[theValue([FLReflection isClass:object]) should] beNo];
                [[theValue([FLReflection isProtocol:object]) should] beYes];
                [[theValue([FLReflection isBlock:object]) should] beNo];
                [[theValue([FLReflection isInstance:object]) should] beNo];
            });

            it(@"is a block", ^{
                void (^object)() = ^{};

                [[theValue([FLReflection isClass:object]) should] beNo];
                [[theValue([FLReflection isProtocol:object]) should] beNo];
                [[theValue([FLReflection isBlock:object]) should] beYes];
                [[theValue([FLReflection isInstance:object]) should] beNo];
            });

            it(@"is a block", ^{
                id (^object)(id someThing) = ^id(id someThing) {
                    return [[NSObject alloc] init];
                };

                [[theValue([FLReflection isClass:object]) should] beNo];
                [[theValue([FLReflection isProtocol:object]) should] beNo];
                [[theValue([FLReflection isBlock:object]) should] beYes];
                [[theValue([FLReflection isInstance:object]) should] beNo];
            });

            it(@"is an instance", ^{
                id object = [[Car alloc] init];

                [[theValue([FLReflection isClass:object]) should] beNo];
                [[theValue([FLReflection isProtocol:object]) should] beNo];
                [[theValue([FLReflection isBlock:object]) should] beNo];
                [[theValue([FLReflection isInstance:object]) should] beYes];
            });

            it(@"nil is handled correctly", ^{
                id object = nil;

                [[theValue([FLReflection isClass:object]) should] beNo];
                [[theValue([FLReflection isProtocol:object]) should] beNo];
                [[theValue([FLReflection isBlock:object]) should] beNo];
                [[theValue([FLReflection isInstance:object]) should] beNo];
            });

        });

SPEC_END