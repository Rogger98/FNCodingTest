//
//  Vehicle.m
//  MapView
//
//  Created by psagc on 24/03/22.
//

#import "Vehicle.h"
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@implementation Vehicle
-(id)initWithCoordinates:(CLLocationCoordinate2D) coordinates andName:(NSString*)type andHead:(NSString*)head
{
    self = [super init];
    if(self)
    {
        [self setType:type];
        [self setCoordinate:coordinates];
        [self setHead:[head floatValue]];
    }
    return self;
}
@end


