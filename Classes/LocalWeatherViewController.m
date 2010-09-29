//
//  LocalWeatherViewController.m
//  LocalWeather
//
//  Created by Matt Tuzzolo on 8/30/10.
//  Copyright iCodeBlog LLC 2010. All rights reserved.
//

#import "LocalWeatherViewController.h"
#import "ICB_WeatherConditions.h"
#import "MapKit/MapKit.h"

@implementation LocalWeatherViewController

@synthesize currentTempLabel, highTempLabel, lowTempLabel, conditionsLabel, cityLabel;
@synthesize conditionsImageView;
@synthesize conditionsImage;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

    if (1) //you have coordinates but need a city
    {
        // Check out Part 1 of the tutorial to see how to find your Location with CoreLocation
        CLLocationCoordinate2D coord;    
        coord.latitude = 45.574779;
        coord.longitude = -122.685366;

        // Geocode coordinate (normally we'd use location.coordinate here instead of coord).
        // This will get us something we can query Google's Weather API with
        MKReverseGeocoder *geocoder = [[MKReverseGeocoder alloc] initWithCoordinate:coord];
        geocoder.delegate = self;
        [geocoder start];
    }
    else // You already know your users zipcode, city, or otherwise.
    {
        // Do this in the background so we don't lock up the UI.
        [self performSelectorInBackground:@selector(showWeatherFor:) withObject:@"97217"];
    }
}

// This will run in the background
- (void)showWeatherFor:(NSString *)query
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    ICB_WeatherConditions *weather = [[ICB_WeatherConditions alloc] initWithQuery:query];
    
    self.conditionsImage = [[UIImage imageWithData:[NSData dataWithContentsOfURL:weather.conditionImageURL]] retain];

    [self performSelectorOnMainThread:@selector(updateUI:) withObject:weather waitUntilDone:NO];
    
    
    [pool release];
}

// This happens in the main thread
- (void)updateUI:(ICB_WeatherConditions *)weather
{
    self.conditionsImageView.image = self.conditionsImage;
    [self.conditionsImage release];
    
    [self.currentTempLabel setText:[NSString stringWithFormat:@"%d", weather.currentTemp]];
    [self.highTempLabel setText:[NSString stringWithFormat:@"%d", weather.highTemp]];
    [self.lowTempLabel setText:[NSString stringWithFormat:@"%d", weather.lowTemp]];
    [self.conditionsLabel setText:weather.condition];
    [self.cityLabel setText:weather.location];

    [weather release];
}

#pragma mark MKReverseGeocoder Delegate Methods
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
    [geocoder release];

    [self performSelectorInBackground:@selector(showWeatherFor:) withObject:[placemark.addressDictionary objectForKey:@"ZIP"]];
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
{    
    NSLog(@"reverseGeocoder:%@ didFailWithError:%@", geocoder, error);
    
    [geocoder release];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
