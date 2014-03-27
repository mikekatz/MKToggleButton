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

@interface MKToggleButton ()
@property (nonatomic, weak) CAShapeLayer* shapeLayer;
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
    
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = self.bounds;
    _shapeLayer.path = path.CGPath;
    _shapeLayer.lineWidth = 2.f;
    _shapeLayer.strokeColor = self.tintColor.CGColor;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
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
        [self.layer addSublayer:self.shapeLayer];
    } else {
        [self.shapeLayer removeFromSuperlayer];
    }
    //    [self setNeedsDisplay];
}

- (void) updateBackground
{
    self.backgroundColor = self.selected ? self.tintColor : [UIColor clearColor];
}

- (void) changed:(UIButton*)button
{
    self.selected = !self.selected;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    [self updateBackground];
}

- (CGSize)intrinsicContentSize
{
    CGSize s = [super intrinsicContentSize];
    return s;
}

@end
