//
//  maDizaine.m
//  02-Dizainier
//
//  Created by Arnaud Leclaire on 11/05/2014.
//  Copyright (c) 2014 GromiNet. All rights reserved.
//

#import "maDizaine.h"


@implementation maDizaine

@synthesize unite, dizaine;

-(id)init{
    if (self=[super init]) {
        [self setUnite:0];
        [self setDizaine:0];
    }
    return self;
}

-(int)total{
    return unite+10*dizaine;
}

-(void)changeValeur:(int)nouvelleValeur{
    [self setUnite:nouvelleValeur%10];
    [self setDizaine:nouvelleValeur/10];
}

@end
