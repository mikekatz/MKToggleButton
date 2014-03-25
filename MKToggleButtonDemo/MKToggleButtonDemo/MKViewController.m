//
//  MKViewController.m
//  MKToggleButtonDemo
//
//  Created by Michael Katz on 3/25/14.
//  Copyright (c) 2014 Michael Katz.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "MKViewController.h"

@interface MKViewController ()

@end

@implementation MKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.normal setTitle:@"Normal" forState:UIControlStateNormal];
    [self.normal setTitle:@"Selected" forState:UIControlStateSelected];
    [self.normal addTarget:self action:@selector(selected:) forControlEvents:UIControlEventValueChanged];

    [self.selected setTitle:@"Normal" forState:UIControlStateNormal];
    [self.selected setTitle:@"Selected" forState:UIControlStateSelected];
    self.selected.selected = YES;
    [self.selected addTarget:self action:@selector(selected:) forControlEvents:UIControlEventValueChanged];

    [self.bordered setTitle:@"Bordered" forState:UIControlStateNormal];
    [self.bordered setTitle:@"Bordered Selected" forState:UIControlStateSelected];
    self.bordered.showsBorder = YES;
    [self.bordered addTarget:self action:@selector(selected:) forControlEvents:UIControlEventValueChanged];

}

- (void) selected:(MKToggleButton*) button
{
    NSString* title = [NSString stringWithFormat:@"Turned '%@' %@", button.titleLabel.text, button.selected ? @"On" : @"Off"];
    [[[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

@end
