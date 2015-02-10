//
//  DXViewController.m
//  DayX
//
//  Created by Julien Guanzon on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DXViewController.h"

static NSString *subjectKey = @"subject"; //title textField
static NSString *entryKey = @"entry";  //text textView
static NSString *journalKey = @"journal";  // entry textField and textView Dictionary in save method

@interface DXViewController () <UITextFieldDelegate, UITextViewDelegate>

@property(nonatomic, strong) UITextField *textField;
@property(nonatomic, strong) UITextView *textView;

@end

@implementation DXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Day X";
    self.view.backgroundColor = [UIColor grayColor];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, 200, 30)];
    self.textField.placeholder = @"Subject";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
    
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(30, 130, self.view.frame.size.width - 60, self.view.frame.size.height - 300)];
    self.textView.backgroundColor = [UIColor blackColor];
    self.textView.delegate = self;
    self.textView.textColor = [UIColor whiteColor];
    [self.view addSubview:self.textView];
    
    UIButton *clearButton = [[UIButton alloc] initWithFrame:CGRectMake(230,  80, 50, 30)];
    clearButton.backgroundColor = [UIColor grayColor];
    [clearButton setTitle:@"clear" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearButton];
    
    NSDictionary *journal = [[NSUserDefaults standardUserDefaults] objectForKey:journalKey];
    [self updateWithDictionary:journal];
    
    
}

- (void)buttonPressed{
    self.textField.text = @"";
    self.textView.text = @"";
}


- (void) updateWithDictionary:(NSDictionary *)dictionary {
    self.textField.text = dictionary [subjectKey];
    self.textView.text = dictionary [entryKey];
    
    
    
}

- (void)save {
    
    NSMutableDictionary *journalDictionary = [NSMutableDictionary new];
    journalDictionary[subjectKey] = self.textField.text;
    journalDictionary[entryKey] = self.textView.text;
    
    
    [[NSUserDefaults standardUserDefaults] setObject:journalDictionary forKey:journalKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(void) textFieldDidEndEditing:(UITextField *)textField {
    [self save];
}


-(void)textViewDidChange:(UITextView *)textView {
    [self save];
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
