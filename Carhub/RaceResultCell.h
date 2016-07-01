//
//  RaceResultCell.h
//  Carhub
//
//  Created by Christopher Clark on 10/10/15.
//  Copyright © 2015 Ham Applications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RaceResultCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel * positionLabel;
@property (strong, nonatomic) IBOutlet UILabel * driverLabel;
@property (strong, nonatomic) IBOutlet UILabel * teamLabel;
@property (strong, nonatomic) IBOutlet UILabel * countryLabel;
@property (strong, nonatomic) IBOutlet UILabel * timeLabel;
@property (strong, nonatomic) IBOutlet UILabel * bestLapTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel * CarLabel;
@property (strong, nonatomic) IBOutlet UILabel * RaceClass;


@property (strong, nonatomic) IBOutlet UIImageView * CarImage;
@property (weak, nonatomic) IBOutlet UIView *cardView;

@end