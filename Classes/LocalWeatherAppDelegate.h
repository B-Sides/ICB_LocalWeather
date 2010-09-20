//
//  LocalWeatherAppDelegate.h
//  LocalWeather
//
//  Created by Matt Tuzzolo on 8/30/10.
//  Copyright Regulars LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LocalWeatherViewController;

@interface LocalWeatherAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LocalWeatherViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LocalWeatherViewController *viewController;

@end

