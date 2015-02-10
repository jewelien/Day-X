//
//  DetailViewController.m
//  DayX
//
//  Created by Julien Guanzon on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()  <UITextFieldDelegate, UITextViewDelegate>



@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.textField.delegate = self;
    self.title = @"Day X";
    
    
}

- (IBAction)buttonPressed:(id)sender {
    self.textField.text = @"";
    self.textView.text = @"";
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
