//
//  POI.m
//  MapView
//
//  Created by psagc on 24/03/22.
//

#import "POI.h"


@implementation POI
-(instancetype)init:(NSString *)identity poiState:(NSString *)state poiType:(NSString *)type poiHeading:(NSString *)heading  poiLocation:(CLLocationCoordinate2D)location{
    [self setState:state];
    [self setIdentity:identity];
    [self setType:type];
    [self setHeading:heading];
    [self setLocation:location];
    return self;
}
-(NSString *)description {
    return [NSString stringWithFormat:@"POI id : %@ , POI Location %f %f , POI head %@ POI Type %@",self.identity,self.location.latitude,self.location.longitude,self.heading,self.type];
}
@end
