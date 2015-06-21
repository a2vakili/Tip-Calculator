//
//  ViewController.m
//  Tip-Calculator
//
//  Created by Arsalan Vakili on 2015-06-19.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountBill;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)calculateTip:(id)sender {
    
    
    //NSNumber *number= [[NSNumber alloc] initWithDouble:self.tipPercentageTextField.text];
//    double billAmountEntered= [self.billAmountTextField.text doubleValue];
//    double tipPercentageEntered= [self.tipPercentageTextField.text doubleValue]/100;
//    double tipCalculated= billAmountEntered * tipPercentageEntered;
//    NSString *mystring= [NSString stringWithFormat:@"%0.2f",tipCalculated];
//    self.tipAmountLabel.text = mystring;
    NSNumberFormatter *numberformat= [[NSNumberFormatter  alloc] init];
    NSNumberFormatter *currencyformat= [[NSNumberFormatter alloc]init];
    
    numberformat.numberStyle= NSNumberFormatterDecimalStyle;
    currencyformat.numberStyle= NSNumberFormatterCurrencyStyle;
    NSNumber *billTotal= [currencyformat  numberFromString:self.billAmountTextField.text];
    NSNumber *percentagetip= [numberformat numberFromString:self.tipPercentageTextField.text];
  

    
    if (billTotal == nil || percentagetip== nil){
        self.tipAmountLabel.text= @"please enter a valid number";
    }
    else{
        double billAmountEntered=  [billTotal doubleValue ];
        double tipPercentageEntered= [percentagetip doubleValue]  /100;
        double tipCalculated= billAmountEntered * tipPercentageEntered;
        NSString *mytipInString= [NSString stringWithFormat:@"$%0.2f",tipCalculated];
        self.tipAmountLabel.text= mytipInString;
        double totalAmountBill= billAmountEntered + tipCalculated;
        NSString *myBillInString= [NSString stringWithFormat:@"$%0.1f",totalAmountBill];
        self.totalAmountBill.text= myBillInString;
    }


}
- (IBAction)calculatorchange:(id)sender {
}
                                  
@end
