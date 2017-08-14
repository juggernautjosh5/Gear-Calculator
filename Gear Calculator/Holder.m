//
//  Holder.m
//  Gear Calculator
//
//  Created by MacBook Studio Pro on 8/12/17.
//  Copyright © 2017 Josh inc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 [self.allReduc addObject:[NSNumber numberWithDouble:100.0]];
 [self.allReduc addObject:[NSNumber numberWithDouble:50.0]];
 [self.allReduc addObject:[NSNumber numberWithDouble:0.0]];
 
 [self.DallReduc addObject:[NSNumber numberWithDouble:100.0]];
 [self.DallReduc addObject:[NSNumber numberWithDouble:50.0]];
 [self.DallReduc addObject:[NSNumber numberWithDouble:0.0]];
 

 

 
 int j = 0;
 for(int i =18; i<85;i+=2){
 [self.Gears addObject:[NSNumber numberWithInt:i]];
 j++;
 }
 for(int i = 0; i<4; i++) [self.GearsHold addObject: [NSNull null]];
 for(int i = 0; i<8; i++) [self.DGearsHold addObject: [NSNull null]];
 COME BACK AND PUT THE REST OF THE FOR LOOPS FOR TGEARS AND QGEARS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 

 
 
 NSLog(@"GEARS HAS %lu" , (unsigned long)[self.Gears count] );
 for(int i = 0; i<[self.Gears count]; i++){
 for(int j = 0; j<[self.Gears count]; j++){
 NSNumber *sur = [NSNumber numberWithDouble:[[self.Gears objectAtIndex:i] doubleValue] /[[self.Gears objectAtIndex:j] doubleValue]];
 int k = [self findPos:self.allReduc :sur :0 :[self.allReduc count]-1];
 if (k == -1) {
 //NSLog(@"DONE did IT UP");
 break;
 break;
 } else if (k==-2){
 //means there's a repeat, unneccisary
 //NSLog(@"%@ = repeat ",sur);
 } else{
 //NSLog(@"k = %d", k );
 [self.allReduc insertObject:sur atIndex:k];
 [self.GearsHold insertObject:[self.Gears objectAtIndex:i] atIndex:k*2];
 [self.GearsHold insertObject:[self.Gears objectAtIndex:j] atIndex:(k*2)+1];
 }
 
 
 }
 }
 
 
 [self.allReduc removeObject:[NSNumber numberWithDouble:0.0]];
 [self.allReduc removeObject:[NSNumber numberWithDouble:50.0]];
 [self.allReduc removeObject:[NSNumber numberWithDouble:100.0]];
 [self.GearsHold removeObjectAtIndex:0];
 [self.GearsHold removeObjectAtIndex:0];
 [self.GearsHold removeObjectAtIndex:0];
 [self.GearsHold removeObjectAtIndex:0];
 
 
 
 //for (int i = 0; i<[self.GearsHold count]; i++) { NSLog(@"%d - %@",i, [self.GearsHold objectAtIndex:i]);};
 
 //for (int i = 0; i<[self.allReduc count]; i++) {NSLog(@"%d - %f", i, [[self.allReduc objectAtIndex:i] doubleValue]);}
 
 for(int i = 0; i<[self.allReduc count]; i++){
 for(int j = 0; j<[self.allReduc count]-1; j++){
 NSNumber *sur = [NSNumber numberWithDouble:([[self.allReduc objectAtIndex:i] doubleValue]*[[self.allReduc objectAtIndex:j] doubleValue])];
 int k = [self findPos:self.DallReduc :sur :0 :[self.DallReduc count]-1];
 if (k == -1) {
 //NSLog(@"DONE did IT UP");
 break;
 break;
 }else if(k==-2){
 //repeat number - see above
 }else{
 //NSLog(@"k = %d", k );
 [self.DallReduc insertObject:sur atIndex:k];
 [self.DGearsHold insertObject:[self.GearsHold objectAtIndex:i*2] atIndex:k*4];
 [self.DGearsHold insertObject:[self.GearsHold objectAtIndex:i*2+1] atIndex:(k*4)+1];
 [self.DGearsHold insertObject:[self.GearsHold objectAtIndex:j*2] atIndex:(k*4)+2];
 [self.DGearsHold insertObject:[self.GearsHold objectAtIndex:j*2+1] atIndex:(k*4)+3];
 }
 }
 
 }
 
 [self.DallReduc removeObject:[NSNumber numberWithDouble:0.0]];
 [self.DallReduc removeObject:[NSNumber numberWithDouble:50.0]];
 [self.DallReduc removeObject:[NSNumber numberWithDouble:100.0]];
 [self.DGearsHold removeObjectAtIndex:0];
 [self.DGearsHold removeObjectAtIndex:0];
 [self.DGearsHold removeObjectAtIndex:0];
 [self.DGearsHold removeObjectAtIndex:0];
 [self.DGearsHold removeObjectAtIndex:0];
 [self.DGearsHold removeObjectAtIndex:0];
 [self.DGearsHold removeObjectAtIndex:0];
 [self.DGearsHold removeObjectAtIndex:0];
 
 //for (int i = 0; i<[self.DGearsHold count]; i++) { NSLog(@"%d - %@",i, [self.DGearsHold objectAtIndex:i]);};
 
 //for (int i = 0; i<[self.DallReduc count]; i++) {NSLog(@"%d - %f", i, [[self.DallReduc objectAtIndex:i] doubleValue]);}
*/
