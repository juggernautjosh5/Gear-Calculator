//
//  AllArrays.h
//  Gear Calculator
//
//  Created by MacBook Studio Pro on 8/12/17.
//  Copyright © 2017 Josh inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllArrays : NSObject
@property (strong, nonatomic) NSArray* Gears;
@property (strong, nonatomic) NSArray* GearsHold;
@property (strong, nonatomic) NSMutableArray* TGearsHold;
@property (strong, nonatomic) NSMutableArray* QGearsHold;
@property (strong, nonatomic) NSArray* allReduc;
@property (strong, nonatomic) NSMutableArray* TallReduc;
@property (strong, nonatomic) NSMutableArray* QallReduc;
@property (strong, nonatomic) NSArray* DogGears;
@property (strong, nonatomic) NSMutableArray* DogGearsReduc;
-(void)start;
@end
