//
//  SelectedPOI.h
//  MapView
//
//  Created by psagc on 25/03/22.
//

#import <UIKit/UIKit.h>
#import "POI.h"
#import "NSBundle+Category.h"
NS_ASSUME_NONNULL_BEGIN

@interface SelectedPOI : UIView
- (instancetype)init:(POI*)poi;
@property (nonatomic, nullable) POI* selectedPOI;
@property (weak, nonatomic) IBOutlet UILabel *lablePOIIdentity;
@property (weak, nonatomic) IBOutlet UILabel *lablePOIType;
@end

NS_ASSUME_NONNULL_END
