//
//  MapViewController.h
//  MapView
//
//  Created by psagc on 24/03/22.
//

#import <UIKit/UIKit.h>
#import "POI.h"
#import <MapKit/MapKit.h>
#import "NSBundle+Category.h"
NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController <MKMapViewDelegate>
- (instancetype)init:(NSArray<POI*>*)data screenTitle:(NSString*)mapTitle selectedPOI:(POI*)poi;
@property (nonatomic, nullable) NSArray<POI*>* mapData;
@property (nonatomic, nullable) POI* selectedPOI;
@property (nonatomic, nullable) NSString* mapViewTitle;
@property (nonatomic, nullable) void(^selectedVehicle)(POI*);
@end

NS_ASSUME_NONNULL_END
