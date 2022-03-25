//
//  POI.h
//  MapView
//
//  Created by psagc on 24/03/22.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN


@interface POILocation : NSObject
@property (weak, nonatomic)NSDecimalNumber* lat;
@property (weak, nonatomic)NSDecimalNumber* lon;
-(instancetype)init:(NSDecimalNumber*)lat longtitude:(NSDecimalNumber*)lon;
@end

@interface POI : NSObject
@property (nonatomic)NSString* identity;
@property (weak, nonatomic)NSString* state;
@property (weak, nonatomic)NSString* type;
@property (nonatomic)NSString* heading;
@property (nonatomic)CLLocationCoordinate2D location;
-(instancetype)init:(NSString *)identity poiState:(NSString *)state poiType:(NSString *)type poiHeading:(NSString *)heading  poiLocation:(CLLocationCoordinate2D)location;
-(NSString *)description;
@end

NS_ASSUME_NONNULL_END
