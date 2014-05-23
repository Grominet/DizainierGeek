//
//  maView.m
//  03-DizainierGeek
//
//  Created by Arnaud Leclaire on 14/05/2014.
//  Copyright (c) 2014 GromiNet. All rights reserved.
//

#import "maView.h"
#import "maDizaine.h"

@implementation maView

int const bordureX=20;
int const bordureY=20;
int height, width;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // Recup iphone ou ipad
        if ([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            estIpad = TRUE;
        } else {
            estIpad = false;
        }
        
        NSLog(@"init X:%F et Y:%f",frame.size.height,frame.size.width);

        
        // Fond
        _monFond = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pirate-ship-white.jpg"]];
        [self addSubview:_monFond];
        
        // Stepper
        height = 20, width = 90;
        _leStepper = [[UIStepper alloc] init]; //[[UIStepper alloc] initWithFrame:CGRectMake(bordureX, bordureY, width, height)];
        [_leStepper setMaximumValue:99];
        [_leStepper setMinimumValue:0];
        [_leStepper setStepValue:1];
        [_leStepper addTarget:self action:@selector(btnStepper) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_leStepper];
        
        // Switch Geek
        height = 20, width = 50;
        _leSwitch = [[UISwitch alloc] init];
        [_leSwitch setOn:false];
        [_leSwitch addTarget:self action:@selector(modeGeek) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_leSwitch];
        
        // Label Geek
        height = 20, width = 100;
        _labelGeek = [[UILabel alloc] init];
        [_labelGeek setText:@"Mode Geek:"];
        [self addSubview:_labelGeek];
        
        // Label Dizaines
        height = 20, width = 120;
        _labelDizaines = [[UILabel alloc] init];
        [_labelDizaines setText:@"Dizaines :"];
        [_labelDizaines setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_labelDizaines];
        
        // SegmentedControl Dizaines
        height = 30, width = 280;
        _lesDizaines = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil]];
        [_lesDizaines setSelectedSegmentIndex:0];
        [_lesDizaines addTarget:self action:@selector(segDizaines) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_lesDizaines];
        
        // Label Unites
        height = 20, width = 120;
        _labelUnites = [[UILabel alloc] init];
        [_labelUnites setText:@"Unites :"];
        [_labelUnites setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_labelUnites];
        
        // SegmentedControl Unites
        height = 30, width = 280;
        _lesUnites = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil]];
        [_lesUnites setSelectedSegmentIndex:0];
        [_lesUnites addTarget:self action:@selector(segUnites) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_lesUnites];
        
        // Label Reponse
        height = 20, width = 120;
        _labelReponse = [[UILabel alloc] init];
        [_labelReponse setText:@"maValeur"];
        [_labelReponse setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_labelReponse];
        
        // Slider
        height = 20, width = 280;
        _leSlider = [[UISlider alloc] init];
        [_leSlider setMaximumValue:99];
        [_leSlider setMinimumValue:0];
        [_leSlider addTarget:self action:@selector(slidValeur) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_leSlider];
        
        // Bouton Resest
        height = 20, width = 120;
        _boutonReset = [UIButton buttonWithType:UIButtonTypeSystem];
        [_boutonReset setTitle:@"Reset" forState:UIControlStateNormal];
        [_boutonReset addTarget:self action:@selector(btnReset) forControlEvents:UIControlEventTouchDown];
        [self addSubview:_boutonReset];
        
        //init
        [self setFromOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
        _monChiffre = [[maDizaine alloc] init];
        [self afficheValeur:_monChiffre];
        
    }
    return self;
}

- (void)setFromOrientation:(UIInterfaceOrientation)orientation {
    
    // Frame
    NSLog(@"setFromOrientation X:%F et Y:%f",[self bounds].size.width,[self bounds].size.height);
    
    // on récupère la frame de l'écran pour la redimensionner selon l'orientation
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    //UIInterfaceOrientation o = [[UIApplication sharedApplication] statusBarOrientation];
    if ( orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight )    {
        self.frame = CGRectMake(screenRect.origin.x,screenRect.origin.y,screenRect.size.height,screenRect.size.width);
    }else{
        self.frame = CGRectMake(screenRect.origin.x,screenRect.origin.y,screenRect.size.width,screenRect.size.height);
    }
    
    // Fond
    [_monFond setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height,[[UIScreen mainScreen] bounds].size.height)];

    // Stepper
    height = 20, width = 90;
    [_leStepper setFrame:CGRectMake(bordureX, bordureY, width, height)];
    
    // Switch Geek
    height = 20, width = 50;
    [_leSwitch setFrame:CGRectMake([self bounds].size.width-bordureX-width, bordureY, width, height)];

    // Label Geek
    height = 20, width = 100;
    [_labelGeek setFrame:CGRectMake([_leSwitch frame].origin.x-width, bordureY+5, width, height)];
    
    // Label Dizaines
    height = 20, width = 120;
    [_labelDizaines setFrame:CGRectMake([self bounds].size.width/2 - width/2, [_leStepper frame].origin.y+[_leStepper bounds].size.height+10, width, height)];
    
    // SegmentedControl Dizaines
    height = 30, width = 280;
    [_lesDizaines setFrame:CGRectMake([self bounds].size.width/2 - width/2, [_labelDizaines frame].origin.y+[_labelDizaines bounds].size.height+10, width, height)];

    // Label Unites
    height = 20, width = 120;
    [_labelUnites setFrame:CGRectMake([self bounds].size.width/2 - width/2, [_lesDizaines frame].origin.y+[_lesDizaines bounds].size.height+10, width, height)];

    // SegmentedControl Unites
    height = 30, width = 280;
    [_lesUnites setFrame: CGRectMake([self bounds].size.width/2 - width/2, [_labelUnites frame].origin.y+[_labelUnites bounds].size.height+10, width, height)];

    // Label Reponse
    height = 20, width = 120;
    [_labelReponse setFrame:CGRectMake([self bounds].size.width/2 - width/2, [_lesUnites frame].origin.y+[_lesUnites bounds].size.height+20, width, height)];

    // Slider
    height = 20, width = 280;
    [_leSlider setFrame:CGRectMake([self bounds].size.width/2 - width/2, [_labelReponse frame].origin.y+[_labelReponse bounds].size.height+10, width, height)];

    // Bouton Resest
    height = 20, width = 120;
    [_boutonReset setFrame: CGRectMake([self bounds].size.width/2 - width/2, [_leSlider frame].origin.y+[_leSlider bounds].size.height+10, width, height)];

    //init
    [self afficheValeur:_monChiffre];
    
}

- (void)afficheValeur:maValeur{
    //reset affichage
    [_lesDizaines setSelectedSegmentIndex:[maValeur dizaine]];
    [_lesUnites setSelectedSegmentIndex:[maValeur unite]];
    [_leStepper setValue:[maValeur total]];
    [_leSlider setValue:[maValeur total]];
    
    //Mode 42
    if ([maValeur total]==42) {
        [_labelReponse setTextColor:[UIColor redColor]];
    } else {
        [_labelReponse setTextColor:[UIColor blackColor]];
    }
    
    //Mode Geek
    if (_leSwitch.on) {
        //traduire en geek
        [_labelReponse setText:[NSString stringWithFormat:@"0x%x",[maValeur total]]];
    } else {
        //valeur décimale
        [_labelReponse setText:[NSString stringWithFormat:@"%d",[maValeur total]]];
    }
    [_labelReponse setNeedsDisplay];
}


- (void)btnStepper{
    [_monChiffre changeValeur:_leStepper.value];
    [self afficheValeur:_monChiffre];
}
- (void)modeGeek{
    // just reset de l'affichage (mode Geek géré dans l'affichage)
    [self afficheValeur:_monChiffre];
}
- (void)segDizaines{
    [_monChiffre setDizaine:(int)[_lesDizaines selectedSegmentIndex]];
    [self afficheValeur:_monChiffre];
}
- (void)segUnites{
    [_monChiffre setUnite:(int)[_lesUnites selectedSegmentIndex]];
    [self afficheValeur:_monChiffre];
}
- (void)slidValeur{
    [_monChiffre changeValeur:_leSlider.value];
    [self afficheValeur:_monChiffre];
}
- (void)btnReset{
    [_monChiffre changeValeur:0];
    [self afficheValeur:_monChiffre];
}



@end
