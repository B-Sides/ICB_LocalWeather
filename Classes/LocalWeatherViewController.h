//
//  LocalWeatherViewController.h
//  LocalWeather
//
//  Created by Matt Tuzzolo on 8/30/10.
//  Copyright iCodeBlog LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"

@interface LocalWeatherViewController : UIViewController <MKReverseGeocoderDelegate> {
    IBOutlet UILabel *currentTempLabel, *highTempLabel, *lowTempLabel, *conditionsLabel, *cityLabel;
    IBOutlet UIImageView *conditionsImageView;
}

@property (nonatomic,retain) IBOutlet UILabel *currentTempLabel, *highTempLabel, *lowTempLabel, *conditionsLabel, *cityLabel;
@property (nonatomic,retain) IBOutlet UIImageView *conditionsImageView;

@end

