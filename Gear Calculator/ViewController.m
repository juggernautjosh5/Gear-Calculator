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
    [self.DogGears addObject:[NSNumber numberWithInt:40]];
    
    
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
    for (int i = 0; i<12; i++) {[self.TGearsHold removeObjectAtIndex:0];}
    
    //for (int i = 0; i<[self.TGearsHold count]; i++) { NSLog(@"%d - %@",i, [self.TGearsHold objectAtIndex:i]);};
    
    //for (int i = 0; i<[self.TallReduc count]; i++) {NSLog(@"%d - %f", i, [[self.TallReduc objectAtIndex:i] doubleValue]);}
    
    
    
    for(int i = 0; i<[self.TallReduc count]; i++){
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
    } else{
        self.dReductionTwo.hidden = false;
        self.dSpeedTwoLab.hidden = false;
    }
}


- (IBAction)calculate:(id)sender {

    [self.closest removeAllObjects];
    double closRed = 10000;
    double finalReduc = 0.0;
    
    if (self.segSpeed.selectedSegmentIndex==0) {
        double reduction = 1/[self.dReductionOne.text doubleValue];
        NSLog(@"@%f", reduction);
        
        switch (self.stages.text.integerValue){
                case 1:
                for(int i = 0; i<[self.allReduc count]; i++){
                    if(fabs([[self.allReduc objectAtIndex:i] doubleValue] - reduction)<=closRed){
                        closRed = fabs([[self.allReduc objectAtIndex:i] doubleValue] - reduction);
                        [self.closest addObject:[self.GearsHold objectAtIndex:i*2]];
                        [self.closest addObject:[self.GearsHold objectAtIndex:i*2+1]];;
                        [self.closest addObject:[NSNumber numberWithDouble:fabs([[self.allReduc objectAtIndex:i] doubleValue])]];
                        
                    } else{
                        break;
                    }
                }
                for(int i = 0; i<[self.closest count]; i++){NSLog(@"%@", [self.closest objectAtIndex:i]);}
                
                self.outputLabel.text = [NSString stringWithFormat:@"Your Reduction 1:%f or %f:1 ", reduction, 1/reduction];
                for(int i = [self.closest count]-1; i>=0 && i>[self.closest count]-[self.margin.text integerValue]*3; i-=3){
                    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:[NSString stringWithFormat:@"\n(%ld,%ld) This Reduction 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-2] integerValue],(long)[[self.closest objectAtIndex:i-1] integerValue], [[self.closest objectAtIndex:i] doubleValue],1/[[self.closest objectAtIndex:i] doubleValue]]];
                }
                
                
                break;
                
                case 2:
                
                for(int i = 0; i<[self.DallReduc count]; i++){
                    if(fabs([[self.DallReduc objectAtIndex:i] doubleValue] - reduction)<=closRed){
                        closRed = fabs([[self.DallReduc objectAtIndex:i] doubleValue] - reduction);
                        finalReduc = closRed+reduction;
                        [self.closest addObject:[self.DGearsHold objectAtIndex:i*4]];
                        [self.closest addObject:[self.DGearsHold objectAtIndex:i*4+1]];
                        [self.closest addObject:[self.DGearsHold objectAtIndex:i*4+2]];
                        [self.closest addObject:[self.DGearsHold objectAtIndex:i*4+3]];
                        [self.closest addObject:[NSNumber numberWithDouble:finalReduc]];
                        
                        
                    } else{
                        break;
                    }
                }
                //for(int i = 0; i<[self.closest count]; i++){NSLog(@"%@", [self.closest objectAtIndex:i]);}
                
                self.outputLabel.text = [NSString stringWithFormat:@"Your Reduction 1:%f or %f:1 ", reduction, 1/reduction];
                for (int i = [self.closest count]-1; i>=0 && i>[self.closest count]-[self.margin.text integerValue]*5; i-=5) {
                    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue],(long)[[self.closest objectAtIndex:i-1] integerValue], [[self.closest objectAtIndex:i] doubleValue],1/[[self.closest objectAtIndex:i] doubleValue]]];
                }
                

                break;
                
                case 3:
                
                for(int i = 0; i<[self.TallReduc count]; i++){

                    if(fabs([[self.TallReduc objectAtIndex:i] doubleValue] - reduction)<=closRed){
                        closRed = fabs([[self.TallReduc objectAtIndex:i] doubleValue] - reduction);
                        finalReduc = closRed+reduction;
                        [self.closest addObject:[self.TGearsHold objectAtIndex:i*6]];
                        [self.closest addObject:[self.TGearsHold objectAtIndex:i*6+1]];
                        [self.closest addObject:[self.TGearsHold objectAtIndex:i*6+2]];
                        [self.closest addObject:[self.TGearsHold objectAtIndex:i*6+3]];
                        [self.closest addObject:[self.TGearsHold objectAtIndex:i*6+4]];
                        [self.closest addObject:[self.TGearsHold objectAtIndex:i*6+5]];
                        [self.closest addObject:[NSNumber numberWithDouble:finalReduc]];
                        
                        
                    } else{
                        break;
                    }
                }
                //for(int i = 0; i<[self.closest count]; i++){NSLog(@"%@", [self.closest objectAtIndex:i]);}
                
                self.outputLabel.text = [NSString stringWithFormat:@"Your Reduction 1:%f or %f:1 ", reduction, 1/reduction];
                for (int i = [self.closest count]-1; i>=0 && i>[self.closest count]-[self.margin.text integerValue]*7; i-=7) {
                    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld), (%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-6] integerValue],(long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue],(long)[[self.closest objectAtIndex:i-2] integerValue],(long)[[self.closest objectAtIndex:i-1] integerValue], [[self.closest objectAtIndex:i] doubleValue],1/[[self.closest objectAtIndex:i] doubleValue]]];
                }
                break;
                
                case 4:
                for(int i = 0; i<[self.QallReduc count]; i++){
                    
                    if(fabs([[self.QallReduc objectAtIndex:i] doubleValue] - reduction)<=closRed){
                        closRed = fabs([[self.QallReduc objectAtIndex:i] doubleValue] - reduction);
                        finalReduc = closRed+reduction;
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+1]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+2]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+3]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+4]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+5]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+6]];
                        [self.closest addObject:[self.QGearsHold objectAtIndex:i*8+7]];
                        [self.closest addObject:[NSNumber numberWithDouble:finalReduc]];
                        
                        
                    } else{
                        break;
                    }
                }
                //for(int i = 0; i<[self.closest count]; i++){NSLog(@"%@", [self.closest objectAtIndex:i]);}
                
                self.outputLabel.text = [NSString stringWithFormat:@"Your Reduction 1:%f or %f:1 ", reduction, 1/reduction];
                for (int i = [self.closest count]-1; i>=0 && i>[self.closest count]-[self.margin.text integerValue]*9; i-=9) {
                    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:[NSString stringWithFormat:@"\n(%ld, %ld), (%ld, %ld), (%ld, %ld), (%ld, %ld) This Reduction 1:%f or %f:1", (long)[[self.closest objectAtIndex:i-8] integerValue],(long)[[self.closest objectAtIndex:i-7] integerValue],(long)[[self.closest objectAtIndex:i-6] integerValue],(long)[[self.closest objectAtIndex:i-5] integerValue],(long)[[self.closest objectAtIndex:i-4] integerValue],(long)[[self.closest objectAtIndex:i-3] integerValue], (long)[[self.closest objectAtIndex:i-2] integerValue],(long)[[self.closest objectAtIndex:i-1] integerValue], [[self.closest objectAtIndex:i] doubleValue],1/[[self.closest objectAtIndex:i] doubleValue]]];
                }
                break;
                
                default:
                break;
        }
        
    } else if (self.segSpeed.selectedSegmentIndex == 1){
        
        
        
    }
   
}


- (int)findPos:(NSMutableArray*) arr :(NSNumber*) nums: (NSInteger) start: (NSInteger) end{
    int mid = ((int)start + (int)end)/2 ;
    if([[arr objectAtIndex:mid] doubleValue] > [nums doubleValue] && [nums doubleValue]>[[arr objectAtIndex:mid+1] doubleValue] ){
        return mid+1;
    } else if(mid == 0){
        return mid;
    }else if([[arr objectAtIndex:mid] doubleValue] > [nums doubleValue]){
        [self findPos:arr :nums :mid :end];
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
    NSString *str = @"";
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

@end
