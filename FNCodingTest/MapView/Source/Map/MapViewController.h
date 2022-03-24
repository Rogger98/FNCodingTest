//
//  MapViewController.h
//  MapView
//
//  Created by psagc on 24/03/22.
//

#import <UIKit/UIKit.h>
#import "POI.h"
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController <MKMapViewDelegate>
- (instancetype)init:(NSArray<POI*>*)data;
@property (nonatomic, nullable) NSArray<POI*>* mapData;
@end

NS_ASSUME_NONNULL_END
