//
//  ViewController.m
//  Gear Calculator
//
//  Created by MacBook Studio Pro on 5/26/17.
//  Copyright © 2017 Josh inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segSpeed;
@property (weak, nonatomic) IBOutlet UITextField *stages;
@property (weak, nonatomic) IBOutlet UITextField *dReductionOne;
@property (weak, nonatomic) IBOutlet UITextField *dReductionTwo;
@property (weak, nonatomic) IBOutlet UITextField *margin;
@property (weak, nonatomic) IBOutlet UILabel *dSpeedTwoLab;
@property (weak, nonatomic) IBOutlet UILabel *dSpeedOneLab;
@property (strong, nonatomic) NSMutableArray* Gears;
@property (strong, nonatomic) NSMutableArray* GearsHold;
@property (strong, nonatomic) NSMutableArray* DGearsHold;
@property (strong, nonatomic) NSMutableArray* TGearsHold;
@property (strong, nonatomic) NSMutableArray* QGearsHold;
@property (strong, nonatomic) NSMutableArray* allReduc;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (strong, nonatomic) NSMutableArray* closest;
@property (strong, nonatomic) NSMutableArray* DallReduc;
@property (strong, nonatomic) NSMutableArray* TallReduc;
@property (strong, nonatomic) NSMutableArray* QallReduc;

@property (strong, nonatomic) NSMutableArray* DogGears;
@property (strong, nonatomic) NSMutableArray* DogGearsReduc;

@property (assign, nonatomic) NSInteger secondRegGear;
@property (assign, nonatomic) NSInteger secondDogGear;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.Gears = [[NSMutableArray alloc] init];
    self.GearsHold = [[NSMutableArray alloc] init];
    self.allReduc = [[NSMutableArray alloc] init];
    self.DallReduc = [[NSMutableArray alloc] init];
    self.DGearsHold = [[NSMutableArray alloc] init];
    self.TallReduc = [[NSMutableArray alloc] init];
    self.TGearsHold = [[NSMutableArray alloc] init];
    self.QallReduc = [[NSMutableArray alloc] init];
    self.QGearsHold = [[NSMutableArray alloc] init];
    self.closest = [[NSMutableArray alloc] init];
    self.DogGears = [[NSMutableArray alloc] init];
    self.DogGearsReduc = [[NSMutableArray alloc] init];
    
    [self.allReduc addObject:[NSNumber numberWithDouble:100.0]];
    [self.allReduc addObject:[NSNumber numberWithDouble:50.0]];
    [self.allReduc addObject:[NSNumber numberWithDouble:0.0]];
    
    [self.DallReduc addObject:[NSNumber numberWithDouble:100.0]];
    [self.DallReduc addObject:[NSNumber numberWithDouble:50.0]];
    [self.DallReduc addObject:[NSNumber numberWithDouble:0.0]];
    
    [self.TallReduc addObject:[NSNumber numberWithDouble:100.0]];
    [self.TallReduc addObject:[NSNumber numberWithDouble:50.0]];
    [self.TallReduc addObject:[NSNumber numberWithDouble:0.0]];
    
    [self.QallReduc addObject:[NSNumber numberWithDouble:100.0]];
    [self.QallReduc addObject:[NSNumber numberWithDouble:50.0]];
    [self.QallReduc addObject:[NSNumber numberWithDouble:0.0]];
    
    [self.DogGears addObject:[NSNumber numberWithInt:40]];
    [self.DogGears addObject:[NSNumber numberWithInt:44]];
    [self.DogGears addObject:[NSNumber numberWithInt:50]];
    [self.DogGears addObject:[NSNumber numberWithInt:60]];
    
    
    int j = 0;
    for(int i =18; i<85;i+=2){
        [self.Gears addObject:[NSNumber numberWithInt:i]];
        j++;
    }
    for(int i = 0; i<4; i++) [self.GearsHold addObject: [NSNull null]];
    for(int i = 0; i<8; i++) [self.DGearsHold addObject: [NSNull null]];
    for(int i = 0; i<12; i++) [self.TGearsHold addObject: [NSNull null]];
    for(int i = 0; i<16; i++) [self.QGearsHold addObject: [NSNull null]];


    
    NSLog(@"GEARS HAS %lu" , (unsigned long)[self.Gears count] );
    for(int i = 0; i<[self.Gears count]; i++){
        for(int j = 0; j<[self.Gears count]; j++){
            NSNumber *sur = [NSNumber numberWithDouble:[[self.Gears objectAtIndex:i] doubleValue] /[[self.Gears objectAtIndex:j] doubleValue]];
            int k = [self findPos:self.allReduc :sur :0 :[self.allReduc count]-1];
            if (k == -1) {
               // NSLog(@"DONE did IT UP");
                break;
                break;
            } else if (k==-2){
                //means there's a repeat, unneccisary
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

    
   // for (int i = 0; i<[self.GearsHold count]; i++) { NSLog(@"%d - %@",i, [self.GearsHold objectAtIndex:i]);};

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
    
    for(int i = 0; i<[self.DallReduc count]; i++){
        for(int j = 0; j<[self.allReduc count]-1; j++){
            NSNumber *sur = [NSNumber numberWithDouble:([[self.DallReduc objectAtIndex:i] doubleValue]*[[self.allReduc objectAtIndex:j] doubleValue])];
            int k = [self findPos:self.TallReduc :sur :0 :[self.TallReduc count]-1];
            if (k == -1) {
                //NSLog(@"DONE did IT UP");
                break;
                break;
            }else if(k==-2){
                //repeat number - see above
            }else{
                //NSLog(@"k = %d", k );
                [self.TallReduc insertObject:sur atIndex:k];
                [self.TGearsHold insertObject:[self.DGearsHold objectAtIndex:i*4] atIndex:k*6];
                [self.TGearsHold insertObject:[self.DGearsHold objectAtIndex:i*4+1] atIndex:(k*6)+1];
                [self.TGearsHold insertObject:[self.DGearsHold objectAtIndex:i*4+2] atIndex:(k*6)+2];
                [self.TGearsHold insertObject:[self.DGearsHold objectAtIndex:i*4+3] atIndex:(k*6)+3];
                [self.TGearsHold insertObject:[self.GearsHold objectAtIndex:j*2] atIndex:(k*6)+4];
                [self.TGearsHold insertObject:[self.GearsHold objectAtIndex:j*2+1] atIndex:(k*6)+5];

            }
        }
        
    }
    
    [self.TallReduc removeObject:[NSNumber numberWithDouble:0.0]];
    [self.TallReduc removeObject:[NSNumber numberWithDouble:50.0]];
    [self.TallReduc removeObject:[NSNumber numberWithDouble:100.0]];
    //for (int i = 0; i<12; i++) {[self.TGearsHold removeObjectAtIndex:0];}
    
    //for (int i = 0; i<[self.TGearsHold count]; i++) { NSLog(@"%d - %@",i, [self.TGearsHold objectAtIndex:i]);};
    
    //for (int i = 0; i<[self.TallReduc count]; i++) {NSLog(@"%d - %f", i, [[self.TallReduc objectAtIndex:i] doubleValue]);}
    
    
    
    /*for(int i = 0; i<[self.TallReduc count]; i++){
        for(int j = 0; j<[self.allReduc count]-1; j++){
            NSNumber *sur = [NSNumber numberWithDouble:([[self.TallReduc objectAtIndex:i] doubleValue]*[[self.allReduc objectAtIndex:j] doubleValue])];
            int k = [self findPos:self.QallReduc :sur :0 :[self.QallReduc count]-1];
            if (k == -1) {
                //NSLog(@"DONE did IT UP");
                break;
                break;
            }else if(k==-2){
                //repeat number - see above
            }else{
                [self.QallReduc insertObject:sur atIndex:k];
                [self.QGearsHold insertObject:[self.TGearsHold objectAtIndex:i*6] atIndex:k*8];
                [self.QGearsHold insertObject:[self.TGearsHold objectAtIndex:i*6+1] atIndex:(k*8)+1];
                [self.QGearsHold insertObject:[self.TGearsHold objectAtIndex:i*6+2] atIndex:(k*8)+2];
                [self.QGearsHold insertObject:[self.TGearsHold objectAtIndex:i*6+3] atIndex:(k*8)+3];
                [self.QGearsHold insertObject:[self.TGearsHold objectAtIndex:i*6+4] atIndex:(k*8)+4];
                [self.QGearsHold insertObject:[self.TGearsHold objectAtIndex:i*6+5] atIndex:(k*8)+5];
                [self.QGearsHold insertObject:[self.GearsHold objectAtIndex:j*2] atIndex:(k*8)+6];
                [self.QGearsHold insertObject:[self.GearsHold objectAtIndex:j*2+1] atIndex:(k*8)+7];
                
                
            }
        }
        
    }
    
    [self.QallReduc removeObject:[NSNumber numberWithDouble:0.0]];
    [self.QallReduc removeObject:[NSNumber numberWithDouble:50.0]];
    [self.QallReduc removeObject:[NSNumber numberWithDouble:100.0]];
    for (int i = 0; i<16; i++) {[self.QGearsHold removeObjectAtIndex:0];}
    
    //for (int i = 0; i<[self.QGearsHold count]; i++) { NSLog(@"%d - %@",i, [self.QGearsHold objectAtIndex:i]);};
    
    //for (int i = 0; i<[self.QallReduc count]; i++) {NSLog(@"%d - %f", i, [[self.QallReduc objectAtIndex:i] doubleValue]);}*/
    
    for (int i= 0; i<[self.DogGears count]; i++) {
        NSMutableArray *sta = [[NSMutableArray alloc] init];
        for (int j = 0; j<[self.Gears count]; j++) {
            [sta addObject:[NSNumber numberWithDouble:[[self.DogGears objectAtIndex:i] doubleValue]/[[self.Gears objectAtIndex:j] doubleValue]]];
        }
        [self.DogGearsReduc addObject:sta];
    }
    
    //for (int i = 0; i<[[self.DogGearsReduc objectAtIndex:0] count]; i++) {NSLog(@"%d - %@", i, [[self.DogGearsReduc objectAtIndex:0] objectAtIndex:i]);}

    //NSLog(@"DALLREDUC HAS %lu" , (unsigned long)[self.DallReduc count] );
    //for(int i = 0; i<[self.DallReduc count]; i++){NSLog(@"%@", [self.DallReduc objectAtIndex:i]);}
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segChanged:(id)sender {
    if (self.segSpeed.selectedSegmentIndex ==0) {
        self.dReductionTwo.hidden = true;
        self.dSpeedTwoLab.hidden = true;
        self.dSpeedOneLab.text = @"Desired Reduction";
    } else{
        self.dReductionTwo.hidden = false;
        self.dSpeedTwoLab.hidden = false;
        self.dSpeedOneLab.text = @"Smaller Reduction";
    
    }
}


- (IBAction)calculate:(id)sender {

    [self.closest removeAllObjects];
    double closRed = NSIntegerMax;

    double finalReducOne = 0.0;
    double finalReducTwo = 0.0;
    
    if (self.segSpeed.selectedSegmentIndex==0) {
        double reduction = 1/[self.dReductionOne.text doubleValue];
        NSLog(@"@%f", reduction);
        
        switch (self.stages.text.integerValue){
                case 1:
                for(int i = 0; i<[self.allReduc count]; i++){
                    if(fabs([[self.allReduc objectAtIndex:i] doubleValue] - reduction)<=closRed){
                        closRed = fabs([[self.allReduc objectAtIndex:i] doubleValue] - reduction);
                        [self.closest addObject:[self.GearsHold objectAtIndex:i*2]];
                        [self.closest addObject:[self.GearsHold objectAtIndex:i*2+1]];
                        [self.closest addObject:[NSNumber numberWithDouble:fabs([[self.allReduc objectAtIndex:i] doubleValue])]];
                        
                    } else{
                        break;
                    }
                }
                for(int i = 0; i<[self.closest count]; i++){NSLog(@"%@", [self.closest objectAtIndex:i]);}
                
                self.outputLabel.text = [NSString stringWithFormat:@"Your Reduction 1:%f or %f:1 ", reduction, 1/reduction];
                for(int i = [self.closest count]-1; i>=0 && i>(long)[self.closest count]-[self.margin.text integerValue]*3; i-=3){
                    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:[NSString stringWithFormat:@"\n(%ld,%ld) This Reduction 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-2] integerValue],(long)[[self.closest objectAtIndex:i-1] integerValue], [[self.closest objectAtIndex:i] doubleValue],1/[[self.closest objectAtIndex:i] doubleValue]]];
                }
                
                
                break;
                
                case 2:
                
                for(int i = 0; i<[self.DallReduc count]; i++){
                    if(fabs([[self.DallReduc objectAtIndex:i] doubleValue] - reduction)<=closRed){
                        closRed = fabs([[self.DallReduc objectAtIndex:i] doubleValue] - reduction);
                        finalReducOne = closRed+reduction;
                        [self.closest addObject:[self.DGearsHold objectAtIndex:i*4]];
                        [self.closest addObject:[self.DGearsHold objectAtIndex:i*4+1]];
                        [self.closest addObject:[self.DGearsHold objectAtIndex:i*4+2]];
                        [self.closest addObject:[self.DGearsHold objectAtIndex:i*4+3]];
                        [self.closest addObject:[NSNumber numberWithDouble:finalReducOne]];
                        
                        
                    } else{
                        break;
                    }
                }
                //for(int i = 0; i<[self.closest count]; i++){NSLog(@"%@", [self.closest objectAtIndex:i]);}
                
                self.outputLabel.text = [NSString stringWithFormat:@"Your Reduction 1:%f or %f:1 ", reduction, 1/reduction];
                for (int i = [self.closest count]-1; i>=0 && i>(long)[self.closest count]-[self.margin.text integerValue]*5; i-=5) {
                    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue],(long)[[self.closest objectAtIndex:i-1] integerValue], [[self.closest objectAtIndex:i] doubleValue],1/[[self.closest objectAtIndex:i] doubleValue]]];
                }
                

                break;
                
                case 3:
                
                for(int i = 0; i<[self.TallReduc count]; i++){

                    if(fabs([[self.TallReduc objectAtIndex:i] doubleValue] - reduction)<=closRed){
                        closRed = fabs([[self.TallReduc objectAtIndex:i] doubleValue] - reduction);
                        finalReducOne = closRed+reduction;
                        [self.closest addObject:[self.TGearsHold objectAtIndex:i*6]];
                        [self.closest addObject:[self.TGearsHold objectAtIndex:i*6+1]];
                        [self.closest addObject:[self.TGearsHold objectAtIndex:i*6+2]];
                        [self.closest addObject:[self.TGearsHold objectAtIndex:i*6+3]];
                        [self.closest addObject:[self.TGearsHold objectAtIndex:i*6+4]];
                        [self.closest addObject:[self.TGearsHold objectAtIndex:i*6+5]];
                        [self.closest addObject:[NSNumber numberWithDouble:finalReducOne]];
                        
                        
                    } else{
                        break;
                    }
                }
                //for(int i = 0; i<[self.closest count]; i++){NSLog(@"%@", [self.closest objectAtIndex:i]);}
                
                self.outputLabel.text = [NSString stringWithFormat:@"Your Reduction 1:%f or %f:1 ", reduction, 1/reduction];
                for (int i = [self.closest count]-1; i>=0 && i>(long)[self.closest count]-[self.margin.text integerValue]*7; i-=7) {
                    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld), (%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-6] integerValue],(long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue],(long)[[self.closest objectAtIndex:i-1] integerValue], [[self.closest objectAtIndex:i] doubleValue],1/[[self.closest objectAtIndex:i] doubleValue]]];
                }
                break;
                
                case 4:
                for(int i = 0; i<[self.QallReduc count]; i++){
                    
                    if(fabs([[self.QallReduc objectAtIndex:i] doubleValue] - reduction)<=closRed){
                        closRed = fabs([[self.QallReduc objectAtIndex:i] doubleValue] - reduction);
                        finalReducOne = closRed+reduction;
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+1]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+2]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+3]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+4]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+5]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+6]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+7]];
                        [self.closest addObject:[NSNumber numberWithDouble:finalReducOne]];
                        
                        
                    } else{
                        break;
                    }
                }
                //for(int i = 0; i<[self.closest count]; i++){NSLog(@"%@", [self.closest objectAtIndex:i]);}
                
                self.outputLabel.text = [NSString stringWithFormat:@"Your Reduction 1:%f or %f:1 ", reduction, 1/reduction];
                for (int i = [self.closest count]-1; i>=0 && i>(long)[self.closest count]-[self.margin.text integerValue]*9; i-=9) {
                    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld), (%ld, %ld), (%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-8] integerValue],(long)[[self.closest objectAtIndex:i-7] integerValue],(long)[[self.closest objectAtIndex:i-6] integerValue],(long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue], (long)[[self.closest objectAtIndex:i-2] integerValue],(long)[[self.closest objectAtIndex:i-1] integerValue], [[self.closest objectAtIndex:i] doubleValue],1/[[self.closest objectAtIndex:i] doubleValue]]];
                }
                break;
                
                default:
                break;
        }
        
    } else if (self.segSpeed.selectedSegmentIndex == 1){
        double reductionOne = 1/[self.dReductionOne.text doubleValue];
        double reductionTwo = 1/[self.dReductionTwo.text doubleValue];
        double ratioTwo = 0.0;
        int toothSum = 0;
        
        switch (self.stages.text.integerValue){
                case 1:
                for(int i = 0; i<[self.DogGearsReduc count]; i++){
                    double personalCloseReduc = NSIntegerMax;
                    for (int j = 0; j<[[self.DogGearsReduc objectAtIndex:i] count]; j++) {
                        toothSum = [[self.Gears objectAtIndex:j] intValue];
                        
                        ratioTwo = [self findSecGearRatio:toothSum :i];
                        if(fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue] - reductionOne) + fabs(ratioTwo-reductionTwo) <= closRed && ratioTwo!= NSIntegerMax){
                            NSLog(@"Less");
                            closRed = fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue] - reductionOne) + fabs(ratioTwo-reductionTwo);
                            personalCloseReduc= fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue] - reductionOne) + fabs(ratioTwo-reductionTwo);
                            finalReducOne = [[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue];
                            finalReducTwo = ratioTwo;
                                                        [self.closest addObject:[self.DogGears objectAtIndex:i]];
                            [self.closest addObject:[self.Gears objectAtIndex:j]];
                            [self.closest addObject:[NSNumber numberWithInteger:self.secondDogGear]];
                            [self.closest addObject:[NSNumber numberWithInteger:self.secondRegGear]];
                            [self.closest addObject:[NSNumber numberWithDouble:finalReducOne]];
                            [self.closest addObject:[NSNumber numberWithDouble:finalReducTwo]];
                           
                        } else if (ratioTwo != NSIntegerMax && fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue] - reductionOne) + fabs(ratioTwo-reductionTwo)>=personalCloseReduc){
                            //NSLog(@"Bigger for group");
                            //break;
                        } else if(ratioTwo != NSIntegerMax){
                            personalCloseReduc= fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue] - reductionOne) + fabs(ratioTwo-reductionTwo);
                            //NSLog(@"bigger, but not for group");
                        }
                    }

                    
                }
                //for(int i = 0; i<[self.closest count]; i++){NSLog(@"%@", [self.closest objectAtIndex:i]);}
                self.outputLabel.text = [NSString stringWithFormat:@"Your Reduction 1:%f or %f:1 and 1:%f or %f:1 ", reductionOne, 1/reductionOne, reductionTwo, 1/reductionTwo];
                for (int i = [self.closest count]-1; i>=0 && i>=(long)[self.closest count]-[self.margin.text integerValue]*6; i-=6) {
                    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld) X (%ld, %ld), This Reduction 1:%f or %f:1 and 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue], [[self.closest objectAtIndex:i-1] doubleValue],1/[[self.closest objectAtIndex:i-1] doubleValue], [[self.closest objectAtIndex:i] doubleValue], 1/[[self.closest objectAtIndex:i] doubleValue]]];
                }
                break;
                
                case 2:
                for(int i = 0; i<[self.DogGearsReduc count]; i++){
                    for (int j = 0; j<[[self.DogGearsReduc objectAtIndex:i] count]; j++) {
                        toothSum = [[self.Gears objectAtIndex:j] intValue];
                        //NSLog(@"Tooth Gear: %d", toothSum);
                        //NSLog(@"I: %d", i);
                        ratioTwo = [self findSecGearRatio:toothSum :i];
                        //NSLog(@"Switch done");

                        for(int k = 0; k<[self.allReduc count]; k++){

                            if(fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[self.allReduc objectAtIndex:k] doubleValue] - reductionOne) + fabs(ratioTwo*[[self.allReduc objectAtIndex:k] doubleValue]-reductionTwo) <= closRed && ratioTwo!= NSIntegerMax){
                                NSLog(@"Less");
                                closRed = fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[self.allReduc objectAtIndex:k] doubleValue] - reductionOne) + fabs(ratioTwo*[[self.allReduc objectAtIndex:k] doubleValue]-reductionTwo);

                                finalReducOne = [[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[self.allReduc objectAtIndex:k] doubleValue];
                                finalReducTwo = ratioTwo*[[self.allReduc objectAtIndex:k] doubleValue];
                                [self.closest addObject:[self.DogGears objectAtIndex:i]];
                                [self.closest addObject:[self.Gears objectAtIndex:j]];
                                [self.closest addObject:[NSNumber numberWithInteger:self.secondDogGear]];
                                [self.closest addObject:[NSNumber numberWithInteger:self.secondRegGear]];
                                [self.closest addObject:[self.GearsHold objectAtIndex:(k*2)]];
                                [self.closest addObject:[self.GearsHold objectAtIndex:(k*2)+1]];
                                [self.closest addObject:[NSNumber numberWithDouble:finalReducOne]];
                                [self.closest addObject:[NSNumber numberWithDouble:finalReducTwo]];
                                
                            } else if (ratioTwo != NSIntegerMax){
                                //NSLog(@"Bigger, for group");
                                //break;
                            }
                        }
                        
                        
                    }
                    
                    
                }
                //for(int i = 0; i<[self.closest count]; i++){NSLog(@"%@", [self.closest objectAtIndex:i]);}
                self.outputLabel.text = [NSString stringWithFormat:@"Your Reduction 1:%f or %f:1 and 1:%f or %f:1 ", reductionOne, 1/reductionOne, reductionTwo, 1/reductionTwo];
                for (int i = [self.closest count]-1; i>=0 && i>(long)[self.closest count]-[self.margin.text integerValue]*8; i-=8) {
                    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld) X (%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1 and 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-7] integerValue],(long)[[self.closest objectAtIndex:i-6] integerValue],(long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue], [[self.closest objectAtIndex:i-1] doubleValue],1/[[self.closest objectAtIndex:i-1] doubleValue], [[self.closest objectAtIndex:i] doubleValue], 1/[[self.closest objectAtIndex:i] doubleValue]]];
                }
                
                break;
                
            case 3:
                for(int i = 0; i<[self.DogGearsReduc count]; i++){
                    for (int j = 0; j<[[self.DogGearsReduc objectAtIndex:i] count]; j++) {
                        toothSum = [[self.Gears objectAtIndex:j] intValue];
                        //NSLog(@"Tooth Gear: %d", toothSum);
                        //NSLog(@"I: %d", i);
                        ratioTwo = [self findSecGearRatio:toothSum :i];
                        //NSLog(@"Switch done");
                        
                        for(int k = 0; k<[self.DallReduc count]; k++){
                            
                            if(fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[self.DallReduc objectAtIndex:k] doubleValue] - reductionOne) + fabs(ratioTwo*[[self.DallReduc objectAtIndex:k] doubleValue]-reductionTwo) <= closRed && ratioTwo!= NSIntegerMax){
                                NSLog(@"Less");
                                closRed = fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[self.DallReduc objectAtIndex:k] doubleValue] - reductionOne) + fabs(ratioTwo*[[self.DallReduc objectAtIndex:k] doubleValue]-reductionTwo);
                                
                                finalReducOne = [[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[self.DallReduc objectAtIndex:k] doubleValue];
                                finalReducTwo = ratioTwo*[[self.DallReduc objectAtIndex:k] doubleValue];
                                NSLog(@"finalReducOne: %f", finalReducOne);
                                NSLog(@"finalReducTwo: %f", finalReducTwo);
                                NSLog(@"difference: %f", closRed);
                                [self.closest addObject:[self.DogGears objectAtIndex:i]];
                                [self.closest addObject:[self.Gears objectAtIndex:j]];
                                [self.closest addObject:[NSNumber numberWithInteger:self.secondDogGear]];
                                [self.closest addObject:[NSNumber numberWithInteger:self.secondRegGear]];
                                [self.closest addObject:[self.DGearsHold objectAtIndex:(k*4)]];
                                [self.closest addObject:[self.DGearsHold objectAtIndex:(k*4)+1]];
                                [self.closest addObject:[self.DGearsHold objectAtIndex:(k*4)+2]];
                                [self.closest addObject:[self.DGearsHold objectAtIndex:(k*4)+3]];
                                [self.closest addObject:[NSNumber numberWithDouble:finalReducOne]];
                                [self.closest addObject:[NSNumber numberWithDouble:finalReducTwo]];
                                
                            } else if (ratioTwo != NSIntegerMax){
                                //NSLog(@"Bigger, for group");
                                //break;
                            }
                        }
                        
                        
                    }
                    
                    
                }
                //for(int i = 0; i<[self.closest count]; i++){NSLog(@"%@", [self.closest objectAtIndex:i]);}
                self.outputLabel.text = [NSString stringWithFormat:@"Your Reduction 1:%f or %f:1 and 1:%f or %f:1 ", reductionOne, 1/reductionOne, reductionTwo, 1/reductionTwo];
                for (int i = [self.closest count]-1; i>=0 && i>(long)[self.closest count]-[self.margin.text integerValue]*10; i-=10) {
                    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld) X (%ld, %ld), (%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1 and 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-9] integerValue],(long)[[self.closest objectAtIndex:i-8] integerValue],(long)[[self.closest objectAtIndex:i-7] integerValue],(long)[[self.closest objectAtIndex:i-6] integerValue],(long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue], [[self.closest objectAtIndex:i-1] doubleValue],1/[[self.closest objectAtIndex:i-1] doubleValue], [[self.closest objectAtIndex:i] doubleValue], 1/[[self.closest objectAtIndex:i] doubleValue]]];
                }
                
                break;
                
            case 4:
                for(int i = 0; i<[self.DogGearsReduc count]; i++){
                    for (int j = 0; j<[[self.DogGearsReduc objectAtIndex:i] count]; j++) {
                        toothSum = [[self.Gears objectAtIndex:j] intValue];
                        //NSLog(@"Tooth Gear: %d", toothSum);
                        //NSLog(@"I: %d", i);
                        ratioTwo = [self findSecGearRatio:toothSum :i];
                        //NSLog(@"Switch done");
                        
                        for(int k = 0; k<[self.TallReduc count]; k++){
                            
                            if(fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[self.TallReduc objectAtIndex:k] doubleValue] - reductionOne) + fabs(ratioTwo*[[self.TallReduc objectAtIndex:k] doubleValue]-reductionTwo) <= closRed && ratioTwo!= NSIntegerMax){
                                NSLog(@"Less");
                                closRed = fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[self.TallReduc objectAtIndex:k] doubleValue] - reductionOne) + fabs(ratioTwo*[[self.TallReduc objectAtIndex:k] doubleValue]-reductionTwo);
                                
                                finalReducOne = [[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[self.TallReduc objectAtIndex:k] doubleValue];
                                finalReducTwo = ratioTwo*[[self.TallReduc objectAtIndex:k] doubleValue];
                                NSLog(@"finalReducOne: %f", finalReducOne);
                                NSLog(@"finalReducTwo: %f", finalReducTwo);
                                NSLog(@"difference: %f", closRed);
                                [self.closest addObject:[self.DogGears objectAtIndex:i]];
                                [self.closest addObject:[self.Gears objectAtIndex:j]];
                                [self.closest addObject:[NSNumber numberWithInteger:self.secondDogGear]];
                                [self.closest addObject:[NSNumber numberWithInteger:self.secondRegGear]];
                                [self.closest addObject:[self.TGearsHold objectAtIndex:(k*6)]];
                                [self.closest addObject:[self.TGearsHold objectAtIndex:(k*6)+1]];
                                [self.closest addObject:[self.TGearsHold objectAtIndex:(k*6)+2]];
                                [self.closest addObject:[self.TGearsHold objectAtIndex:(k*6)+3]];
                                [self.closest addObject:[self.TGearsHold objectAtIndex:(k*6)+4]];
                                [self.closest addObject:[self.TGearsHold objectAtIndex:(k*6)+5]];
                                [self.closest addObject:[NSNumber numberWithDouble:finalReducOne]];
                                [self.closest addObject:[NSNumber numberWithDouble:finalReducTwo]];
                                
                            } else if (ratioTwo != NSIntegerMax){
                                //NSLog(@"Bigger, for group");
                                //break;
                            }
                        }
                        
                        
                    }
                    
                    
                }
                //for(int i = 0; i<[self.closest count]; i++){NSLog(@"%@", [self.closest objectAtIndex:i]);}
                self.outputLabel.text = [NSString stringWithFormat:@"Your Reduction 1:%f or %f:1 and 1:%f or %f:1 ", reductionOne, 1/reductionOne, reductionTwo, 1/reductionTwo];
                for (int i = [self.closest count]-1; i>=0 && i>(long)[self.closest count]-[self.margin.text integerValue]*12; i-=12) {
                    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld) X (%ld, %ld), (%ld, %ld), (%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1 and 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-11] integerValue],(long)[[self.closest objectAtIndex:i-10] integerValue],(long)[[self.closest objectAtIndex:i-9] integerValue],(long)[[self.closest objectAtIndex:i-8] integerValue],(long)[[self.closest objectAtIndex:i-7] integerValue],(long)[[self.closest objectAtIndex:i-6] integerValue],(long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue], [[self.closest objectAtIndex:i-1] doubleValue],1/[[self.closest objectAtIndex:i-1] doubleValue], [[self.closest objectAtIndex:i] doubleValue], 1/[[self.closest objectAtIndex:i] doubleValue]]];
                }
                
                break;
                
                default:
                break;
        }
        
        
    }
   
}


- (int)findPos:(NSMutableArray*) arr :(NSNumber*) nums: (NSInteger) start: (NSInteger) end{
    int mid = ((int)start + (int)end)/2 ;
    if([[arr objectAtIndex:mid] doubleValue] > [nums doubleValue] && [nums doubleValue]>[[arr objectAtIndex:mid+1] doubleValue] ){
        return mid+1;
    } else if(mid == 0){
        return mid;
    }else if([[arr objectAtIndex:mid] doubleValue] > [nums doubleValue]){
        return [self findPos:arr :nums :mid :end];
    } else if([[arr objectAtIndex:mid] doubleValue] < [nums doubleValue]){
        return [self findPos:arr :nums :start :mid];
    } else if([[arr objectAtIndex:mid] doubleValue] == [nums doubleValue] && [nums doubleValue]==[[arr objectAtIndex:mid+1] doubleValue] ) {
        return -2;
    }else{
        return -1;
    }
    
    
}

- (IBAction)showAll:(id)sender {
    NSLog(@"ShowAll");
    NSString *str = @"";
    switch (self.segSpeed.selectedSegmentIndex) {
        case 0:
            switch (self.stages.text.integerValue) {
                case 1:
                    for(int i = [self.closest count]-1; i>= [self.closest count] - 30; i-=3){
                        str = [str stringByAppendingString:[NSString stringWithFormat:@"\n(%ld,%ld) This Reduction 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-2] integerValue],(long)[[self.closest objectAtIndex:i-1] integerValue], [[self.closest objectAtIndex:i] doubleValue],1/[[self.closest objectAtIndex:i] doubleValue]]];
                    }
                    break;
                    
                case 2:
                    for (int i = [self.closest count]-1; i>=[self.closest count] - 50; i-=5) {
                        str = [str stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue],(long)[[self.closest objectAtIndex:i-1] integerValue], [[self.closest objectAtIndex:i] doubleValue],1/[[self.closest objectAtIndex:i] doubleValue]]];
                    }
                    break;
                    
                case 3:
                    for (int i = [self.closest count]-1; i>=[self.closest count] - 70 ; i-=7) {
                        str = [str stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld), (%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-6] integerValue],(long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue],(long)[[self.closest objectAtIndex:i-1] integerValue], [[self.closest objectAtIndex:i] doubleValue],1/[[self.closest objectAtIndex:i] doubleValue]]];
                    }
                    
                    break;
                    
                case 4:
                    for (int i = [self.closest count]-1; i>=[self.closest count] - 90; i-=9) {
                        str = [str stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld), (%ld, %ld), (%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-8] integerValue],(long)[[self.closest objectAtIndex:i-7] integerValue],(long)[[self.closest objectAtIndex:i-6] integerValue],(long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue], (long)[[self.closest objectAtIndex:i-2] integerValue],(long)[[self.closest objectAtIndex:i-1] integerValue], [[self.closest objectAtIndex:i] doubleValue],1/[[self.closest objectAtIndex:i] doubleValue]]];
                    }
                    break;
                    
                default:
                    break;
            }
            break;
            
        case 1:
            switch (self.stages.text.integerValue) {
                case 1:
                    for(int i = [self.closest count]-1; i>= [self.closest count] - 60; i-=6){
                        str = [str stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld) X (%ld, %ld), This Reduction 1:%f or %f:1 and 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue], [[self.closest objectAtIndex:i-1] doubleValue],1/[[self.closest objectAtIndex:i-1] doubleValue], [[self.closest objectAtIndex:i] doubleValue], 1/[[self.closest objectAtIndex:i] doubleValue]]];
                    }
                    break;
                    
                case 2:
                    for (int i = [self.closest count]-1; i>=[self.closest count] - 80; i-=8) {
                        str = [str stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld) X (%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1 and 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-7] integerValue],(long)[[self.closest objectAtIndex:i-6] integerValue],(long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue], [[self.closest objectAtIndex:i-1] doubleValue],1/[[self.closest objectAtIndex:i-1] doubleValue], [[self.closest objectAtIndex:i] doubleValue], 1/[[self.closest objectAtIndex:i] doubleValue]]];
                    }
                    break;
                    
                case 3:
                    for (int i = [self.closest count]-1; i>=[self.closest count] - 100 ; i-=10) {
                        str = [str stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld) X (%ld, %ld), (%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1 and 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-9] integerValue],(long)[[self.closest objectAtIndex:i-8] integerValue],(long)[[self.closest objectAtIndex:i-7] integerValue],(long)[[self.closest objectAtIndex:i-6] integerValue],(long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue], [[self.closest objectAtIndex:i-1] doubleValue],1/[[self.closest objectAtIndex:i-1] doubleValue], [[self.closest objectAtIndex:i] doubleValue], 1/[[self.closest objectAtIndex:i] doubleValue]]];
                    }
                    
                    break;
                    
                case 4:
                    for (int i = [self.closest count]-1; i>=[self.closest count] - 120; i-=12) {
                        str = [str stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld) X (%ld, %ld), (%ld, %ld), (%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1 and 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-11] integerValue],(long)[[self.closest objectAtIndex:i-10] integerValue],(long)[[self.closest objectAtIndex:i-9] integerValue],(long)[[self.closest objectAtIndex:i-8] integerValue],(long)[[self.closest objectAtIndex:i-7] integerValue],(long)[[self.closest objectAtIndex:i-6] integerValue],(long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue], [[self.closest objectAtIndex:i-1] doubleValue],1/[[self.closest objectAtIndex:i-1] doubleValue], [[self.closest objectAtIndex:i] doubleValue], 1/[[self.closest objectAtIndex:i] doubleValue]]];
                    }
                    break;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"All options"
                                 message:str
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Cool"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    [alert dismissViewControllerAnimated:YES completion:nil];
                                }];
    
    [alert addAction:yesButton];
    [self presentViewController:alert animated:YES completion:nil];
}

-(double)findSecGearRatio:(int)sumTooth :(int) gearIndex{
    double reductionTwo = 1/[self.dReductionTwo.text doubleValue];
    int GearOne =100;
    int GearTwo =100;
    int GearThree =100;
    double RatioOne = NSIntegerMax;
    double RatioTwo = NSIntegerMax;
    double RatioThree = NSIntegerMax;
    //NSLog(@"findSecGearRatio");
    
    switch (gearIndex) {
        case 0:
            
            if(sumTooth>=22){
                GearOne = sumTooth-4;
                RatioOne = [[[self.DogGearsReduc objectAtIndex:1] objectAtIndex:[self.Gears indexOfObject:[NSNumber numberWithInt:GearOne]]] doubleValue];
            }
            if(sumTooth>=28){
                GearTwo = sumTooth-10;
                RatioTwo = [[[self.DogGearsReduc objectAtIndex:2] objectAtIndex:[self.Gears indexOfObject:[NSNumber numberWithInt:GearTwo]]] doubleValue];
            };
            if(sumTooth>=38){
                GearThree = sumTooth-20;
                RatioThree = [[[self.DogGearsReduc objectAtIndex:3] objectAtIndex:[self.Gears indexOfObject:[NSNumber numberWithInt:GearThree]]] doubleValue];
            };
            
            
            
            if(fabs(RatioOne-reductionTwo)<=fabs(RatioTwo-reductionTwo) && fabs(RatioOne-reductionTwo)<=fabs(RatioThree-reductionTwo)){
                //NSLog(@"Ratio1");
                self.secondDogGear = 44;
                self.secondRegGear = GearOne;
                return RatioOne;
            } else if (fabs(RatioTwo-reductionTwo)<=fabs(RatioOne-reductionTwo) && fabs(RatioTwo-reductionTwo)<=fabs(RatioThree-reductionTwo)){
                self.secondRegGear = GearTwo;
                self.secondDogGear = 50;
                //NSLog(@"Ratio2");
                return RatioTwo;
            } else{
                self.secondDogGear = 60;
                self.secondRegGear = GearThree;
                //NSLog(@"Ratio3");
                return RatioThree;
            }
    
            break;
                
        case 1:
            
            if(sumTooth<=78){
                GearOne = sumTooth+4;
                RatioOne = [[[self.DogGearsReduc objectAtIndex:0] objectAtIndex:[self.Gears indexOfObject:[NSNumber numberWithInt:GearOne]]] doubleValue];
            }
            if(sumTooth>=24){
                GearTwo = sumTooth-6;
                RatioTwo = [[[self.DogGearsReduc objectAtIndex:2] objectAtIndex:[self.Gears indexOfObject:[NSNumber numberWithInt:GearTwo]]] doubleValue];
            };
            if(sumTooth>=34){
                GearThree = sumTooth-16;
                RatioThree = [[[self.DogGearsReduc objectAtIndex:3] objectAtIndex:[self.Gears indexOfObject:[NSNumber numberWithInt:GearThree]]] doubleValue];
            };
            
            if(fabs(RatioOne-reductionTwo)<=fabs(RatioTwo-reductionTwo) && fabs(RatioOne-reductionTwo)<=fabs(RatioThree-reductionTwo)){
               // NSLog(@"Ratio1");
                self.secondDogGear = 40;
                self.secondRegGear = GearOne;
                return RatioOne;
            } else if (fabs(RatioTwo-reductionTwo)<=fabs(RatioOne-reductionTwo) && fabs(RatioTwo-reductionTwo)<=fabs(RatioThree-reductionTwo)){
                self.secondRegGear = GearTwo;
                self.secondDogGear = 50;
              //  NSLog(@"Ratio2");
                return RatioTwo;
            } else{
                self.secondDogGear = 60;
                self.secondRegGear = GearThree;
               // NSLog(@"Ratio3");
                return RatioThree;
            }
            
            break;
            
        case 2:

            if (sumTooth<= 74) {
                GearOne = sumTooth+10;
                RatioOne = [[[self.DogGearsReduc objectAtIndex:0] objectAtIndex:[self.Gears indexOfObject:[NSNumber numberWithInt:GearOne]]] doubleValue];
            }
            if(sumTooth<= 78){
                GearTwo = sumTooth+6;
                RatioTwo = [[[self.DogGearsReduc objectAtIndex:1] objectAtIndex:[self.Gears indexOfObject:[NSNumber numberWithInt:GearTwo]]] doubleValue];
            }
            if(sumTooth>=28){
                GearThree = sumTooth-10;
                RatioThree = [[[self.DogGearsReduc objectAtIndex:3] objectAtIndex:[self.Gears indexOfObject:[NSNumber numberWithInt:GearThree]]] doubleValue];
            };
            
            if(fabs(RatioOne-reductionTwo)<=fabs(RatioTwo-reductionTwo) && fabs(RatioOne-reductionTwo)<=fabs(RatioThree-reductionTwo)){
                //NSLog(@"Ratio1");
                self.secondDogGear = 40;
                self.secondRegGear = GearOne;
                return RatioOne;
            } else if (fabs(RatioTwo-reductionTwo)<=fabs(RatioOne-reductionTwo) && fabs(RatioTwo-reductionTwo)<=fabs(RatioThree-reductionTwo)){
                //NSLog(@"Ratio2");
                self.secondRegGear = GearTwo;
                self.secondDogGear = 44;
                return RatioTwo;
            } else{
                self.secondDogGear = 60;
                self.secondRegGear = GearThree;
                //NSLog(@"Ratio3");
                return RatioThree;
            }
            
            break;
            
        case 3:
            
            if (sumTooth<=64) {
                GearOne = sumTooth+20;
                RatioOne = [[[self.DogGearsReduc objectAtIndex:0] objectAtIndex:[self.Gears indexOfObject:[NSNumber numberWithInt:GearOne]]] doubleValue];
            }
            if (sumTooth<=68) {
                GearTwo = sumTooth + 16;
                RatioTwo = [[[self.DogGearsReduc objectAtIndex:1] objectAtIndex:[self.Gears indexOfObject:[NSNumber numberWithInt:GearTwo]]] doubleValue];
            }
            if (sumTooth<=74) {
                GearThree = sumTooth + 10;
                RatioThree = [[[self.DogGearsReduc objectAtIndex:2] objectAtIndex:[self.Gears indexOfObject:[NSNumber numberWithInt:GearThree]]] doubleValue];
            }
            
            if(fabs(RatioOne-reductionTwo)<fabs(RatioTwo-reductionTwo) && fabs(RatioOne-reductionTwo)<fabs(RatioThree-reductionTwo)){
                self.secondRegGear = GearOne;
                self.secondDogGear = 40;
                return RatioOne;
            } else if (fabs(RatioTwo-reductionTwo)<fabs(RatioOne-reductionTwo) && fabs(RatioTwo-reductionTwo)<fabs(RatioThree-reductionTwo)){
                self.secondRegGear = GearTwo;
                self.secondDogGear = 44;
                return RatioTwo;
            } else{
                self.secondDogGear = 50;
                self.secondRegGear = GearThree;
                return RatioThree;
            }
            break;
            
        default:
            break;
    }
    NSLog(@"findSecGearRatio finish -1");
    return -1;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}



@end
