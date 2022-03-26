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
#import "NSBundle+Category.h"
#import "SelectedPOI.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

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
    [self showSelectedCar:[self selectedPOI]];
}

-(void)setupUI{
    [[self mapView] setDelegate:self];
    [self setTitle:[self mapViewTitle]];
    [[self mapView] setShowsUserLocation:YES];
    [[self mapView] setMapType:MKMapTypeStandard];
    for(POI* poiVehicle in [self mapData]) {
        Vehicle *vehicle = [[Vehicle alloc] initWithCoordinates:[poiVehicle location] andName:[poiVehicle type] andHead:[poiVehicle heading] andIdentity:[poiVehicle identity]];
         
        [[self mapView] addAnnotation:vehicle];
    }
    [[self mapView] showAnnotations:self.mapView.annotations animated:YES];
}

#pragma mark Map Delegates
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if([annotation isKindOfClass:[Vehicle self]]) {
        Vehicle *vehicle = (Vehicle*)annotation;
        NSString *resueId = @"aView";
        MKAnnotationView *aView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:resueId];
        [aView setImage:[UIImage imageNamed:@"car" inBundle:[NSBundle_Extentions currentBundle] compatibleWithTraitCollection:nil]];
        aView.transform = CGAffineTransformMakeRotation(vehicle.head);
        return aView;
    }
    return nil;
}
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    if([view.annotation isKindOfClass:[Vehicle self]]) {
        Vehicle *vehicle = (Vehicle*)view.annotation;
        for (POI* poi in [self mapData]) {
            if ([[poi identity] isEqualToString:vehicle.identity]) {
                self.selectedVehicle(poi);
                [self showSelectedCar:poi];
                break;
            }
        }
        [[self mapView] deselectAnnotation:view.annotation animated:NO];
    }
    
}

#pragma mark Helper Methods
-(void)showSelectedCar:(POI*)poi{
    SelectedPOI *selectedPoi = [[SelectedPOI alloc] init:poi];
    CGFloat yFrame = [[UIScreen mainScreen] bounds].size.height;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    [selectedPoi setFrame:CGRectMake(0, yFrame, width, 120)];
    [[self view] addSubview:selectedPoi];
    [UIView animateWithDuration:0.30 animations:^{
        [selectedPoi setFrame:CGRectMake(0, yFrame - 120, width, 120)];
    }];
}
@end
