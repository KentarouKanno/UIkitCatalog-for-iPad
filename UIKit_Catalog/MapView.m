//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "MapView.h"

@implementation MapView

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"MapView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    
    if ([CLLocationManager locationServicesEnabled]) {
        
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        [self.locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    CLLocation *location = [locations lastObject];
    MKCoordinateRegion region = self.mapView.region;
    
    region.center = location.coordinate;
    region.span.latitudeDelta = 0.01;
    region.span.longitudeDelta = 0.01;
    [self.mapView setRegion:region animated: YES];
    
    [self.locationManager stopUpdatingLocation];
    

    CLLocationCoordinate2D location1 = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
    
    MyAnnotation *annotation =[[MyAnnotation alloc] initWithCoordinate:location1];
    annotation.title = @"Current Location";
    
    [self locationJP:location];
    [self logLocation:location];
    [self.mapView addAnnotation:annotation];
}

// CLLocation出力
- (void)logLocation:(CLLocation*)location
{
    CLLocationCoordinate2D coordinate = location.coordinate;
    
    self.locationLabel.text = [NSString stringWithFormat:@"latitude:%f\nlogitude:%f\naltitude:%f\ncource:%f\nhorizontalAccuracy:%f\n verticalAccuracy:%f\ntimestamp:%@",coordinate.latitude,coordinate.longitude,location.altitude,location.course,location.horizontalAccuracy,location.verticalAccuracy,location.timestamp];
}

// 逆ジオコーディング
- (void)locationJP:(CLLocation*)location
{
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"Geocode failed with error: %@", error); return;
        }
        CLPlacemark* placemark;
        for(placemark in placemarks) {
            NSLog(@"name : %@", placemark.name);
            NSLog(@"ocean : %@", placemark.ocean);
            NSLog(@"postalCode : %@", placemark.postalCode);
            NSLog(@"subAdministrativeArea : %@", placemark.subAdministrativeArea);
            NSLog(@"subLocality : %@", placemark.subLocality);
            NSLog(@"subThoroughfare : %@", placemark.subThoroughfare);
            NSLog(@"thoroughfare : %@", placemark.thoroughfare);
            NSLog(@"administrativeArea : %@", placemark.administrativeArea);
            NSLog(@"inlandWater : %@", placemark.inlandWater);
            NSLog(@"ISOcountryCode : %@", placemark.ISOcountryCode);
            NSLog(@"locality : %@", placemark.locality);
            NSLog(@"addressDictionary CountryCode : %@", [placemark.addressDictionary objectForKey:@"CountryCode"]);
            NSLog(@"addressDictionary Country : %@", [placemark.addressDictionary objectForKey:@"Country"]);
            NSLog(@"addressDictionary ZIP : %@", [placemark.addressDictionary objectForKey:@"ZIP"]);
            NSLog(@"addressDictionary State : %@", [placemark.addressDictionary objectForKey:@"State"]);
            NSLog(@"addressDictionary SubLocality : %@", [placemark.addressDictionary objectForKey:@"SubLocality"]);
            
            NSString *address = ABCreateStringWithAddressDictionary(placemark.addressDictionary, YES);
            self.locationLabel_JP.text = address;
        }
    }];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id )annotation
{
    static NSString* Identifier = @"PinAnnotationIdentifier";
    MKPinAnnotationView* pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:Identifier];
    if (pinView == nil) {
        pinView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:Identifier];
        pinView.animatesDrop = YES;
        return pinView;
    }
    pinView.annotation = annotation;
    return pinView;
}

// 位置情報取得失敗時
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self.locationManager stopUpdatingLocation];
}

@end



@implementation MyAnnotation

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    self.coordinate = coordinate;
    return self;
}

@end
