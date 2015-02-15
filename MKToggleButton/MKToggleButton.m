//
//  MKToggleButton.m
//  MKToggleButton
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

#import "MKToggleButton.h"

@interface RoundView : UIView
@property (nonatomic, strong) UIBezierPath* path;
@end

@implementation RoundView

- (void)drawRect:(CGRect)rect
{
    self.path.lineWidth = [self.window.screen scale];
    [self.tintColor setStroke];
    [self.path stroke];
}

@end

@interface MKToggleButton ()
@property (nonatomic, strong) UIView* borderView;
@end

@implementation MKToggleButton

- (void) commonInit
{
    [self.titleLabel setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    [self addTarget:self action:@selector(changed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(4., 4.)];
    CAShapeLayer* mask = [CAShapeLayer layer];
    mask.path = path.CGPath;
    self.layer.mask = mask;
    
    _borderView = [[RoundView alloc] initWithFrame:self.bounds];
    _borderView.backgroundColor = [UIColor clearColor];
    _borderView.userInteractionEnabled =NO;
    ((RoundView*)_borderView).path = path;
    
    self.contentEdgeInsets = UIEdgeInsetsMake(4., 3., 5., 3.);
    
    [self updateBackground];
}

- (id)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(void)setTintColor:(UIColor *)tintColor {
    
    [super setTintColor:tintColor];
    [self updateBackground];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)setShowsBorder:(BOOL)showsBorder
{
    if (showsBorder) {
        [self addSubview:self.borderView];
    } else {
        [self.borderView removeFromSuperview];
    }
}

- (void) updateBackground
{
    self.backgroundColor = self.selected ? self.tintColor : [UIColor clearColor];
    [self.borderView setNeedsDisplay];
}

- (void) changed:(UIButton*)button
{
    self.selected = !self.selected;
}

- (void)setSelected:(BOOL)selected
{
    BOOL updated = selected != self.selected;
    [super setSelected:selected];
    if (updated) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
        [self updateBackground];
    }
}

- (void) setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    self.alpha = enabled ? 1.0 : 0.5;
}

@end
