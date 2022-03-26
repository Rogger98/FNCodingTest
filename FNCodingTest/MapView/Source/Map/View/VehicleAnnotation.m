//
//  VehicleAnnotation.m
//  MapView
//
//  Created by psagc on 24/03/22.
//

#import "VehicleAnnotation.h"
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@implementation VehicleAnnotation
-(id)initWithCoordinates:(CLLocationCoordinate2D) coordinates andName:(NSString*)type andHead:(NSString*)head andIdentity:(NSString*)identity
{
    self = [super init];
    if(self)
    {
        [self setType:type];
        [self setCoordinate:coordinates];
        [self setHead:[head floatValue]];
        [self setIdentity:identity];
    }
    return self;
}
@end


