//
//  SelectedPOIView.h
//  MapView
//
//  Created by psagc on 25/03/22.
//

#import <UIKit/UIKit.h>
#import "POI.h"
#import "NSBundle+Category.h"
NS_ASSUME_NONNULL_BEGIN

@interface SelectedPOIView : UIView
- (instancetype)init:(POI*)poi;
@property (nonatomic, nullable) POI* selectedPOI;
@property (weak, nonatomic) IBOutlet UILabel *lablePOIIdentity;
@property (weak, nonatomic) IBOutlet UILabel *lablePOIType;
-(void)changePOIdetails:(POI*)poi;
-(void)showPOIDetailsOnView:(UIView*)view;
@end

NS_ASSUME_NONNULL_END
