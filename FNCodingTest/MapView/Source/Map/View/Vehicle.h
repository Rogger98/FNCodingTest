//
//  Vehicle.h
//  MapView
//
//  Created by psagc on 24/03/22.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Vehicle : NSObject<MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, nullable) NSString *type;
@property (nonatomic) float head;
@property (nonatomic) NSString* identity;
-(id)initWithCoordinates:(CLLocationCoordinate2D) coordinates andName:(NSString*)type andHead:(NSString*)head andIdentity:(NSString*)identity;
@end

NS_ASSUME_NONNULL_END
