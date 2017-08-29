//
//  ViewController.m
//  Gear Calculator
//
//  Created by MacBook Studio Pro on 5/26/17.
//  Copyright © 2017 Josh inc. All rights reserved.
//

#import "ViewController.h"
#import "AllArrays.h"
#import "DallReducClass.h"
#import "DGearsHoldClass.h"
#import "DGearsHoldClass2.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segSpeed;
@property (weak, nonatomic) IBOutlet UITextField *stages;
@property (weak, nonatomic) IBOutlet UITextField *dReductionOne;
@property (weak, nonatomic) IBOutlet UITextField *dReductionTwo;
@property (weak, nonatomic) IBOutlet UITextField *margin;
@property (weak, nonatomic) IBOutlet UILabel *dSpeedTwoLab;
@property (weak, nonatomic) IBOutlet UILabel *dSpeedOneLab;
@property (weak, nonatomic) IBOutlet UILabel *stageLab;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray* DGearsHold;

@property (strong, nonatomic) NSMutableArray* TGearsHold;
@property (strong, nonatomic) NSMutableArray* QGearsHold;

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (strong, nonatomic) NSMutableArray* closest;


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
    
    AllArrays *AllA = [[AllArrays alloc] init];
    [AllA start];
    DallReducClass *DRC = [[DallReducClass alloc] init];
    
    DGearsHoldClass *DGH = [[DGearsHoldClass alloc] init];
    [DGH start];
    DGearsHoldClass2 *DGH2 = [[DGearsHoldClass2 alloc] init];
    [DGH2 start];
    
    NSLog(@"%lu", (unsigned long)[DRC DallReducMeth].count);
    NSLog(@"%lu", (unsigned long)AllA.allReduc.count);
    
    // Do any additional setup after loading the view, typically from a nib.

    self.DGearsHold = [[NSMutableArray alloc] init];
    [self.DGearsHold addObjectsFromArray:DGH2.DGearsHold];
    [self.DGearsHold addObjectsFromArray:DGH.DGearsHold];
    
    self.TallReduc = [[NSMutableArray alloc] init];
    self.TGearsHold = [[NSMutableArray alloc] init];
    self.QallReduc = [[NSMutableArray alloc] init];
    self.QGearsHold = [[NSMutableArray alloc] init];
    self.closest = [[NSMutableArray alloc] init];
    self.DogGears = [[NSMutableArray alloc] init];
    self.DogGearsReduc = [[NSMutableArray alloc] init];
    
    [self.TallReduc addObject:[NSNumber numberWithDouble:100.0]];
    [self.TallReduc addObject:[NSNumber numberWithDouble:50.0]];
    [self.TallReduc addObject:[NSNumber numberWithDouble:0.0]];
    
    [self.QallReduc addObject:[NSNumber numberWithDouble:100.0]];
    [self.QallReduc addObject:[NSNumber numberWithDouble:50.0]];
    [self.QallReduc addObject:[NSNumber numberWithDouble:0.0]];
    
   
    
    NSString *str = @"";
    
    for(int i = 0; i<12; i++) [self.TGearsHold addObject: [NSNull null]];
    for(int i = 0; i<16; i++) [self.QGearsHold addObject: [NSNull null]];
    /*

    
    

    
    for(int i = 0; i<[DRC.DallReduc count]; i++){
        for(int j = 0; j<[AllA.allReduc count]-1; j++){
            NSNumber *sur = [NSNumber numberWithDouble:([[DRC.DallReduc objectAtIndex:i] doubleValue]*[[AllA.allReduc objectAtIndex:j] doubleValue])];
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
                [self.TGearsHold insertObject:[AllA.GearsHold objectAtIndex:j*2] atIndex:(k*6)+4];
                [self.TGearsHold insertObject:[AllA.GearsHold objectAtIndex:j*2+1] atIndex:(k*6)+5];

            }
        }
        
    }
    
    [self.TallReduc removeObject:[NSNumber numberWithDouble:0.0]];
    [self.TallReduc removeObject:[NSNumber numberWithDouble:50.0]];
    [self.TallReduc removeObject:[NSNumber numberWithDouble:100.0]];
    //for (int i = 0; i<12; i++) {[self.TGearsHold removeObjectAtIndex:0];}
    
    //for (int i = 0; i<[self.TGearsHold count]; i++) { NSLog(@"%d - %@",i, [self.TGearsHold objectAtIndex:i]);};
    
    //for (int i = 0; i<[self.TallReduc count]; i++) {NSLog(@"%d - %f", i, [[self.TallReduc objectAtIndex:i] doubleValue]);}
    
    for (int i = 0; i <[self.TallReduc count]; i++) {
        str = [str stringByAppendingString:[NSString stringWithFormat:@"@%@,",[self.TallReduc objectAtIndex:i]]];
    }
    NSLog(@"%@", str);

    
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
    [self.DogGears addObject:[NSNumber numberWithInt:40]];
    [self.DogGears addObject:[NSNumber numberWithInt:44]];
    [self.DogGears addObject:[NSNumber numberWithInt:50]];
    [self.DogGears addObject:[NSNumber numberWithInt:60]];
    for (int i= 0; i<[self.DogGears count]; i++) {
        NSMutableArray *sta = [[NSMutableArray alloc] init];
        for (int j = 0; j<[AllA.Gears count]; j++) {
            [sta addObject:[NSNumber numberWithDouble:[[self.DogGears objectAtIndex:i] doubleValue]/[[AllA.Gears objectAtIndex:j] doubleValue]]];
        }
        [self.DogGearsReduc addObject:sta];
    }
    for(int k = 0;k<4;k++){
        for (int i = 0; i <[[self.DogGearsReduc objectAtIndex:k] count]; i++) {
            
            str = [str stringByAppendingString:[NSString stringWithFormat:@"%@,",[[self.DogGearsReduc objectAtIndex:k] objectAtIndex:i]]];
        }
        str = [str stringByAppendingString:@"},{"];
    }
    NSLog(@"%@", str);
    
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
        self.stageLab.text = @"Number of stages (1-2)";
    } else{
        self.dReductionTwo.hidden = false;
        self.dSpeedTwoLab.hidden = false;
        self.dSpeedOneLab.text = @"Smaller Reduction";
        self.stageLab.text = @"Number of stages (1-3)";
    
    }
}


- (IBAction)calculate:(id)sender {
    AllArrays *AllA = [[AllArrays alloc] init];
    [AllA start];
    DallReducClass *DRC = [[DallReducClass alloc] init];

    [self.closest removeAllObjects];
    double closRed = NSIntegerMax;

    double finalReducOne = 0.0;
    double finalReducTwo = 0.0;
    
    if (self.segSpeed.selectedSegmentIndex==0) {
        double reduction = 1/[self.dReductionOne.text doubleValue];
        //NSLog(@"@%f", reduction);
        
        switch (self.stages.text.integerValue){
                case 1:
                for(int i = 0; i<[AllA.allReduc count]; i++){
                    if(fabs([[AllA.allReduc objectAtIndex:i] doubleValue] - reduction)<=closRed){
                        closRed = fabs([[AllA.allReduc objectAtIndex:i] doubleValue] - reduction);
                        [self.closest addObject:[NSString stringWithFormat:@"%f - (%@,%@)", 1/fabs([[AllA.allReduc objectAtIndex:i] doubleValue]), [AllA.GearsHold objectAtIndex:i*2], [AllA.GearsHold objectAtIndex:i*2+1]]];
                        
                        
                    } else{
                        break;
                    }
                }
                
                
                
                break;
                
                case 2:
                
                for(int i = 0; i<[[DRC DallReducMeth] count]; i++){
                    if(fabs([[[DRC DallReducMeth] objectAtIndex:i] doubleValue] - reduction)<=closRed){
                        closRed = fabs([[[DRC DallReducMeth] objectAtIndex:i] doubleValue] - reduction);
                        [self.closest addObject:[NSString stringWithFormat:@"%f - (%@,%@), (%@,%@)", 1/fabs([[[DRC DallReducMeth] objectAtIndex:i] doubleValue]), [self.DGearsHold objectAtIndex:i*4], [self.DGearsHold objectAtIndex:i*4+1],[self.DGearsHold objectAtIndex:i*4+2],[self.DGearsHold objectAtIndex:i*4+3]]];
                        
                    } else{
                        break;
                    }
                }

                break;
                
                case 3:
                
                for(int i = 0; i<[self.TallReduc count]; i++){

                    if(fabs([[self.TallReduc objectAtIndex:i] doubleValue] - reduction)<=closRed){
                        closRed = fabs([[self.TallReduc objectAtIndex:i] doubleValue] - reduction);
                        [self.closest addObject:[NSString stringWithFormat:@"%f - (%@,%@), (%@,%@), (%@,%@)", 1/fabs([[self.TallReduc objectAtIndex:i] doubleValue]), [self.TGearsHold objectAtIndex:i*6], [self.TGearsHold objectAtIndex:i*6+1],[self.TGearsHold objectAtIndex:i*6+2],[self.TGearsHold objectAtIndex:i*6+3],[self.TGearsHold objectAtIndex:i*6+4],[self.TGearsHold objectAtIndex:i*6+5]]];
                        
                        
                    } else{
                        break;
                    }
                }
                break;
                
                /*case 4:
                for(int i = 0; i<[self.QallReduc count]; i++){
                    
                    if(fabs([[self.QallReduc objectAtIndex:i] doubleValue] - reduction)<=closRed){
                        closRed = fabs([[self.QallReduc objectAtIndex:i] doubleValue] - reduction);
                        finalReducOne = closRed+reduction;
                        [self.closest addObject:[NSString stringWithFormat:@"%f - (%@,%@), (%@,%@), (%@,%@), (%@,%@)", 1/fabs([[self.QallReduc objectAtIndex:i] doubleValue]), [self.QGearsHold objectAtIndex:i*8], [self.QGearsHold objectAtIndex:i*8+1],[self.QGearsHold objectAtIndex:i*8+2],[self.QGearsHold objectAtIndex:i*8+3],[self.QGearsHold objectAtIndex:i*8+4],[self.QGearsHold objectAtIndex:i*8+5],[self.QGearsHold objectAtIndex:i*8+6],[self.QGearsHold objectAtIndex:i*8+7]]];

                        
                        
                    } else{
                        break;
                    }
                }

                break;*/
                
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
                    for (int j = 0; j<[[self.DogGearsReduc objectAtIndex:i] count]; j++) {
                        toothSum = [[AllA.Gears objectAtIndex:j] intValue];
                        
                        ratioTwo = [self findSecGearRatio:toothSum :i];
                        if(fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue] - reductionOne) + fabs(ratioTwo-reductionTwo) <= closRed && ratioTwo!= NSIntegerMax){
                            closRed = fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue] - reductionOne) + fabs(ratioTwo-reductionTwo);
                            finalReducOne = [[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue];
                            finalReducTwo = ratioTwo;
                            [self.closest addObject:[NSString stringWithFormat:@"%f - (%@,%@) \n%f - (%ld,%ld)",1/finalReducOne,[self.DogGears objectAtIndex:i],[AllA.Gears objectAtIndex:j], 1/finalReducTwo, (long)self.secondDogGear, (long)self.secondRegGear]];

                           
                        }
                    }

                    
                }

                break;
                
                case 2:
                for(int i = 0; i<[self.DogGearsReduc count]; i++){
                    for (int j = 0; j<[[self.DogGearsReduc objectAtIndex:i] count]; j++) {
                        toothSum = [[AllA.Gears objectAtIndex:j] intValue];

                        ratioTwo = [self findSecGearRatio:toothSum :i];


                        for(int k = 0; k<[AllA.allReduc count]; k++){

                            if(fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[AllA.allReduc objectAtIndex:k] doubleValue] - reductionOne) + fabs(ratioTwo*[[AllA.allReduc objectAtIndex:k] doubleValue]-reductionTwo) <= closRed && ratioTwo!= NSIntegerMax){
                                closRed = fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[AllA.allReduc objectAtIndex:k] doubleValue] - reductionOne) + fabs(ratioTwo*[[AllA.allReduc objectAtIndex:k] doubleValue]-reductionTwo);

                                finalReducOne = [[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[AllA.allReduc objectAtIndex:k] doubleValue];
                                finalReducTwo = ratioTwo*[[AllA.allReduc objectAtIndex:k] doubleValue];
                                [self.closest addObject:[NSString stringWithFormat:@"%f - (%@,%@), (%@,%@) \n%f - (%ld,%ld)",1/finalReducOne,[self.DogGears objectAtIndex:i],[AllA.Gears objectAtIndex:j],[AllA.GearsHold objectAtIndex:(k*2)],[AllA.GearsHold objectAtIndex:(k*2)+1], 1/finalReducTwo, (long)self.secondDogGear, (long)self.secondRegGear]];
                                

                                
                            }
                        }
                        
                        
                    }
                    
                    
                }

                break;
                
            case 3:
                for(int i = 0; i<[self.DogGearsReduc count]; i++){
                    for (int j = 0; j<[[self.DogGearsReduc objectAtIndex:i] count]; j++) {
                        toothSum = [[AllA.Gears objectAtIndex:j] intValue];
                        ratioTwo = [self findSecGearRatio:toothSum :i];
                        
                        for(int k = 0; k<[[DRC DallReducMeth] count]; k++){
                            
                            if(fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[[DRC DallReducMeth] objectAtIndex:k] doubleValue] - reductionOne) + fabs(ratioTwo*[[[DRC DallReducMeth] objectAtIndex:k] doubleValue]-reductionTwo) <= closRed && ratioTwo!= NSIntegerMax){
                                closRed = fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[[DRC DallReducMeth] objectAtIndex:k] doubleValue] - reductionOne) + fabs(ratioTwo*[[[DRC DallReducMeth] objectAtIndex:k] doubleValue]-reductionTwo);
                                
                                finalReducOne = [[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[[DRC DallReducMeth] objectAtIndex:k] doubleValue];
                                finalReducTwo = ratioTwo*[[[DRC DallReducMeth] objectAtIndex:k] doubleValue];

                                [self.closest addObject:[NSString stringWithFormat:@"%f - (%@,%@), (%@,%@), (%@,%@) \n%f - (%ld,%ld)",1/finalReducOne,[self.DogGears objectAtIndex:i],[AllA.Gears objectAtIndex:j],[self.DGearsHold objectAtIndex:(k*4)],[self.DGearsHold objectAtIndex:(k*4)+1], [self.DGearsHold objectAtIndex:(k*4)+2],[self.DGearsHold objectAtIndex:(k*4)+3], 1/finalReducTwo, (long)self.secondDogGear, (long)self.secondRegGear]];

                            }
                        }
                        
                        
                    }
                    
                    
                }

                break;
                
            case 4:
                for(int i = 0; i<[self.DogGearsReduc count]; i++){
                    for (int j = 0; j<[[self.DogGearsReduc objectAtIndex:i] count]; j++) {
                        toothSum = [[AllA.Gears objectAtIndex:j] intValue];
                        //NSLog(@"Tooth Gear: %d", toothSum);
                        //NSLog(@"I: %d", i);
                        ratioTwo = [self findSecGearRatio:toothSum :i];
                        //NSLog(@"Switch done");
                        
                        for(int k = 0; k<[self.TallReduc count]; k++){
                            
                            if(fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[self.TallReduc objectAtIndex:k] doubleValue] - reductionOne) + fabs(ratioTwo*[[self.TallReduc objectAtIndex:k] doubleValue]-reductionTwo) <= closRed && ratioTwo!= NSIntegerMax){
                                closRed = fabs([[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[self.TallReduc objectAtIndex:k] doubleValue] - reductionOne) + fabs(ratioTwo*[[self.TallReduc objectAtIndex:k] doubleValue]-reductionTwo);
                                
                                finalReducOne = [[[self.DogGearsReduc objectAtIndex:i] objectAtIndex:j] doubleValue]*[[self.TallReduc objectAtIndex:k] doubleValue];
                                finalReducTwo = ratioTwo*[[self.TallReduc objectAtIndex:k] doubleValue];
                                [self.closest addObject:[NSString stringWithFormat:@"%f - (%@,%@), (%@,%@), (%@,%@), (%@,%@) \n%f - (%ld,%ld)",1/finalReducOne,[self.DogGears objectAtIndex:i],[AllA.Gears objectAtIndex:j],[self.TGearsHold objectAtIndex:(k*6)],[self.TGearsHold objectAtIndex:(k*6)+1], [self.TGearsHold objectAtIndex:(k*6)+2],[self.TGearsHold objectAtIndex:(k*6)+3],[self.TGearsHold objectAtIndex:(k*6)+4],[self.TGearsHold objectAtIndex:(k*6)+5], 1/finalReducTwo, (long)self.secondDogGear, (long)self.secondRegGear]];

                                
                            }
                        }
                        
                        
                    }
                    
                    
                }
                
                break;
                
                default:
                break;
        }
        
        
    }
    [self.tableView reloadData];
}


- (int)findPos:(NSMutableArray*)arr :(NSNumber*)nums :(NSInteger)start :(NSInteger) end{
    int mid = ((int)start + (int)end)/2 ;
    if(fabs([[arr objectAtIndex:mid] doubleValue] - [nums doubleValue])==0){
        return -2;
    }else if([[arr objectAtIndex:mid] doubleValue] > [nums doubleValue] && [nums doubleValue]>[[arr objectAtIndex:mid+1] doubleValue] ){
        return mid+1;
    } else if(mid == 0){
        return mid;
    }else if([[arr objectAtIndex:mid] doubleValue] > [nums doubleValue]){
        return [self findPos:arr :nums :mid :end];
    } else if([[arr objectAtIndex:mid] doubleValue] < [nums doubleValue]){
        return [self findPos:arr :nums :start :mid];
    } /*else if([[arr objectAtIndex:mid] doubleValue] == [nums doubleValue] && [nums doubleValue]==[[arr objectAtIndex:mid+1] doubleValue] ) {
        return -2;
    }*/else{
        return -1;
    }
    
    
}


-(double)findSecGearRatio:(int)sumTooth :(int) gearIndex{
    double reductionTwo = 1/[self.dReductionTwo.text doubleValue];
    int GearOne =100;
    int GearTwo =100;
    int GearThree =100;
    double RatioOne = NSIntegerMax;
    double RatioTwo = NSIntegerMax;
    double RatioThree = NSIntegerMax;
    AllArrays *AllA = [[AllArrays alloc] init];
    [AllA start];
    //NSLog(@"findSecGearRatio");
    
    switch (gearIndex) {
        case 0:
            
            if(sumTooth>=22){
                GearOne = sumTooth-4;
                RatioOne = [[[self.DogGearsReduc objectAtIndex:1] objectAtIndex:[AllA.Gears indexOfObject:[NSNumber numberWithInt:GearOne]]] doubleValue];
            }
            if(sumTooth>=28){
                GearTwo = sumTooth-10;
                RatioTwo = [[[self.DogGearsReduc objectAtIndex:2] objectAtIndex:[AllA.Gears indexOfObject:[NSNumber numberWithInt:GearTwo]]] doubleValue];
            };
            if(sumTooth>=38){
                GearThree = sumTooth-20;
                RatioThree = [[[self.DogGearsReduc objectAtIndex:3] objectAtIndex:[AllA.Gears indexOfObject:[NSNumber numberWithInt:GearThree]]] doubleValue];
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
                RatioOne = [[[self.DogGearsReduc objectAtIndex:0] objectAtIndex:[AllA.Gears indexOfObject:[NSNumber numberWithInt:GearOne]]] doubleValue];
            }
            if(sumTooth>=24){
                GearTwo = sumTooth-6;
                RatioTwo = [[[self.DogGearsReduc objectAtIndex:2] objectAtIndex:[AllA.Gears indexOfObject:[NSNumber numberWithInt:GearTwo]]] doubleValue];
            };
            if(sumTooth>=34){
                GearThree = sumTooth-16;
                RatioThree = [[[self.DogGearsReduc objectAtIndex:3] objectAtIndex:[AllA.Gears indexOfObject:[NSNumber numberWithInt:GearThree]]] doubleValue];
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
                RatioOne = [[[self.DogGearsReduc objectAtIndex:0] objectAtIndex:[AllA.Gears indexOfObject:[NSNumber numberWithInt:GearOne]]] doubleValue];
            }
            if(sumTooth<= 78){
                GearTwo = sumTooth+6;
                RatioTwo = [[[self.DogGearsReduc objectAtIndex:1] objectAtIndex:[AllA.Gears indexOfObject:[NSNumber numberWithInt:GearTwo]]] doubleValue];
            }
            if(sumTooth>=28){
                GearThree = sumTooth-10;
                RatioThree = [[[self.DogGearsReduc objectAtIndex:3] objectAtIndex:[AllA.Gears indexOfObject:[NSNumber numberWithInt:GearThree]]] doubleValue];
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
                RatioOne = [[[self.DogGearsReduc objectAtIndex:0] objectAtIndex:[AllA.Gears indexOfObject:[NSNumber numberWithInt:GearOne]]] doubleValue];
            }
            if (sumTooth<=68) {
                GearTwo = sumTooth + 16;
                RatioTwo = [[[self.DogGearsReduc objectAtIndex:1] objectAtIndex:[AllA.Gears indexOfObject:[NSNumber numberWithInt:GearTwo]]] doubleValue];
            }
            if (sumTooth<=74) {
                GearThree = sumTooth + 10;
                RatioThree = [[[self.DogGearsReduc objectAtIndex:2] objectAtIndex:[AllA.Gears indexOfObject:[NSNumber numberWithInt:GearThree]]] doubleValue];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Results";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.closest count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"customCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    tableView.rowHeight = UITableViewAutomaticDimension+80;

    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.closest objectAtIndex:[self.closest count] -1 -indexPath.row]];
    
    return cell;
   
}



@end
