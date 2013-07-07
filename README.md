# Floc Reflection
![Floc Reflection Logo](http://sschmid.com/Dev/iOS/Libs/Floc-Reflection/Floc-Reflection-128.png)

## Description
Floc Reflection is a set of class methods to easily inspect objects in Objective-C.

## How to use Floc Reflection

#### Inspect an object

```objective-c
Car *car = [[Car alloc] init];

BOOL isClass = [FLReflection isClass:car];
BOOL isProtocol = [FLReflection isProtocol:car];
BOOL isBlock = [FLReflection isBlock:car];
BOOL isInstance = [FLReflection isInstance:car];

NSLog(@"isClass = %d", isClass);        // NO
NSLog(@"isProtocol = %d", isProtocol);  // NO
NSLog(@"isBlock = %d", isBlock);        // NO
NSLog(@"isInstance = %d", isInstance);  // YES
```

#### Get all property names of a class

```objective-c
NSArray *propertyNames = [FLReflection getAllPropertyNamesOfClass:[Car class]];
NSLog(@"propertyNames = %@", propertyNames);  // [@"wheel", @"engine"]
```

#### Get the property type of a class

```objective-c
// returns class 'Wheel'
id wheelType = [FLReflection getTypeForProperty:@"wheel"
                                        ofClass:[Car class]];

// returns protocol <Engine>
id engineType = [FLReflection getTypeForProperty:@"engine"
                                         ofClass:[Car class]];
```

## Install Floc Reflection
You find the source files you need in Floc-Reflection/Classes.

## CocoaPods
Install [CocoaPods] and add the Floc Reflection reference to your Podfile

```
platform :ios, '5.0'
  pod 'Floc-Reflection'
end
```

#### Install Floc Reflection

```
$ cd path/to/project
$ pod install
```

Open the created Xcode Workspace file.

[CocoaPods]: http://cocoapods.org