//
//  MapViewController.m
//  MapView
//
//  Created by psagc on 24/03/22.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "POI.h"
#import "VehicleAnnotation.h"
#import "NSBundle+Category.h"
#import "SelectedPOIView.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) SelectedPOIView *selectedPoi;
@end

@implementation MapViewController

- (instancetype)init:(NSArray<POI*>*)data screenTitle:(NSString*)mapTitle selectedPOI:(POI*)poi
{    
    self = [[MapViewController alloc]initWithNibName:@"MapViewController" bundle:[NSBundle_Extentions currentBundle]];
    [self setMapData: data];
    [self setMapViewTitle:mapTitle];
    [self setSelectedPOI:poi];
    if (self) {
        return self;
    }
    return self;
}

#pragma mark Lyfe Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupUI];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.selectedPoi = [[SelectedPOIView alloc] init:[self selectedPOI]];
    [self.selectedPoi showPOIDetailsOnView:[self view]];
}

-(void)setupUI{
    [[self mapView] setDelegate:self];
    [self setTitle:[self mapViewTitle]];
    [[self mapView] setShowsUserLocation:YES];
    [[self mapView] setMapType:MKMapTypeStandard];
    for(POI* poiVehicle in [self mapData]) {
        VehicleAnnotation *vehicle = [[VehicleAnnotation alloc] initWithCoordinates:[poiVehicle location] andName:[poiVehicle type] andHead:[poiVehicle heading] andIdentity:[poiVehicle identity]];
         
        [[self mapView] addAnnotation:vehicle];
    }
    [[self mapView] showAnnotations:self.mapView.annotations animated:YES];
}

#pragma mark Map Delegates
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if([annotation isKindOfClass:[VehicleAnnotation self]]) {
        VehicleAnnotation *vehicle = (VehicleAnnotation*)annotation;
        NSString *resueId = @"aView";
        MKAnnotationView *aView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:resueId];
        [aView setImage:[UIImage imageNamed:@"car" inBundle:[NSBundle_Extentions currentBundle] compatibleWithTraitCollection:nil]];
        aView.transform = CGAffineTransformMakeRotation(vehicle.head);
        return aView;
    }
    return nil;
}
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    if([view.annotation isKindOfClass:[VehicleAnnotation self]]) {
        VehicleAnnotation *vehicle = (VehicleAnnotation*)view.annotation;
        for (POI* poi in [self mapData]) {
            if ([[poi identity] isEqualToString:vehicle.identity]) {
                self.selectedVehicle(poi);
                [[self selectedPoi] changePOIdetails:poi];
                [self showSelectedCar:poi];
                break;
            }
        }
        [[self mapView] deselectAnnotation:view.annotation animated:NO];
    }
    
}

#pragma mark Helper Methods
-(void)showSelectedCar:(POI*)poi{
    [[self selectedPoi] showPOIDetailsOnView:[self view]];
}
@end
