//
//  ICB_WeatherConditions.h
//  LocalWeather
//
//  Created by Matt Tuzzolo on 9/28/10.
//  Copyright 2010 iCodeBlog. All rights reserved.
//

@interface ICB_WeatherConditions : NSObject {
    NSString *condition, *location;
    NSURL *conditionImageURL;
    NSInteger currentTemp,lowTemp,highTemp;
}

@property (nonatomic,retain) NSString *condition, *location;
@property (nonatomic,retain) NSURL *conditionImageURL;
@property (nonatomic) NSInteger currentTemp, lowTemp, highTemp;

- (ICB_WeatherConditions *)initWithQuery:(NSString *)query;

@end