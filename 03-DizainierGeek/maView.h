//
//  maView.h
//  03-DizainierGeek
//
//  Created by Arnaud Leclaire on 14/05/2014.
//  Copyright (c) 2014 GromiNet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "maDizaine.h"
@interface maView : UIView {
    BOOL estIpad;
}

@property UIStepper *leStepper;
@property UISwitch *leSwitch;
@property UISegmentedControl *lesDizaines, *lesUnites;
@property UILabel *labelReponse, *labelGeek, *labelDizaines, *labelUnites;
@property UIButton *boutonReset;
@property UISlider *leSlider;
    
@property UIImageView *monFond, *monImage;

@property (readwrite) maDizaine *monChiffre;

- (void)afficheValeur:(maDizaine*)maValeur;
- (void)btnStepper;
- (void)modeGeek;
- (void)segDizaines;
- (void)segUnites;
- (void)slidValeur;
- (void)btnReset;

- (void)setFromOrientation:(UIInterfaceOrientation)orientation;

@end
