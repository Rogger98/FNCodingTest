//
//  MapViewController.m
//  MapView
//
//  Created by psagc on 24/03/22.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "POI.h"
#import "Vehicle.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (instancetype)init:(NSArray<POI*>*)data
{
    NSBundle* resourcesBundle = [NSBundle bundleForClass:[MapViewController class]];
    self = [[MapViewController alloc]initWithNibName:@"MapViewController" bundle:resourcesBundle];
    [self setMapData: data];
    if (self) {
        return self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupUI];
    
}
-(void)setupUI{
    [[self mapView] setDelegate:self];
    [[self mapView] setShowsUserLocation:YES];
    for(POI* poiVehicle in [self mapData]) {
        Vehicle *vehicle = [[Vehicle alloc] initWithCoordinates:[poiVehicle location] andName:[poiVehicle type]];        
        [[self mapView] addAnnotation:vehicle];
    }
    [[self mapView] showAnnotations:self.mapView.annotations animated:YES];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if([annotation isKindOfClass:[Vehicle self]]) {
        NSString *resueId = @"aView";
        MKAnnotationView *aView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:resueId];
        NSBundle *frameWorkBundle = [NSBundle bundleForClass:[self class]];
        [aView setImage:[UIImage imageNamed:@"car" inBundle:frameWorkBundle compatibleWithTraitCollection:nil]];
        return aView;
    }
    return nil;
}
@end
