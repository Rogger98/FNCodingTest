//
//  POI.m
//  MapView
//
//  Created by psagc on 24/03/22.
//

#import "POI.h"


@implementation POILocation
-(instancetype)init:(NSDecimalNumber*)lat longtitude:(NSDecimalNumber*)lon {
    [self setLat:lat];
    [self setLon:lon];
    return self;
}
@end


@implementation POI
-(instancetype)init:(NSString *)identity poiState:(NSString *)state poiType:(NSString *)type poiHeading:(NSString *)heading  poiLocation:(CLLocationCoordinate2D)location{
    self.state = state;
    self.identity = identity;
    self.type = type;
    self.heading = heading;
    [self setLocation:location];
    return self;
}
@end
