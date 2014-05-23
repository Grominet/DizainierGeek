//
//  maDizaine.h
//  02-Dizainier
//
//  Created by Arnaud Leclaire on 11/05/2014.
//  Copyright (c) 2014 GromiNet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface maDizaine : NSObject {
    int unite;
    int dizaine;
}

@property(readwrite,nonatomic,assign) int unite;
@property(readwrite,nonatomic,assign) int dizaine;

-(id)init;
-(int)total; //valeur totale
-(void)changeValeur:(int)nouvelleValeur; // Modifier la valeur totale

@end
