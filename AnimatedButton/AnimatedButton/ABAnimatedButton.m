//
//  ABAnimatedButton.m
//  animated-button
//
//  Created by John Gluszak on 9/6/16.
//  Copyright © 2016 johngluszak. All rights reserved.
//

#import "ABAnimatedButton.h"

#pragma mark - Constants

static NSString * const BACKGROUND_COLOR_KEY            = @"backgroundColor";
static NSTimeInterval const DEFAULT_BOUNCE_IN_DURATION  = 0.08;
static NSTimeInterval const DEFAULT_BOUNCE_OUT_DURATION = 0.25;
static NSTimeInterval const DEFAULT_FADE_IN_DURATION    = 0.05;
static NSTimeInterval const DEFAULT_FADE_OUT_DURATION   = 0.20;
static CGFloat const DEFAULT_BOUNCE_DAMPING             = 0.45;
static CGFloat const DEFAULT_BOUNCE_VELOCITY            = 15.0;
static CGFloat const DEFAULT_BOUNCE_SHRINK_SCALE        = 0.9;


@interface ABAnimatedButton ()

@property (nonatomic, assign) ABAnimationType animationType;

@end


@implementation ABAnimatedButton

+ (instancetype)buttonWithAnimationType:(ABAnimationType)type {
    ABAnimatedButton *button = [ABAnimatedButton buttonWithType:UIButtonTypeCustom];
    button.animationType     = type;
    
    switch (type) {
        case ABAnimationTypeBounce:
            button.animateInDuration     = DEFAULT_BOUNCE_IN_DURATION;
            button.animateOutDuration    = DEFAULT_BOUNCE_OUT_DURATION;
            button.touchUpBounceVelocity = DEFAULT_BOUNCE_VELOCITY;
            button.touchUpBounceDamping  = DEFAULT_BOUNCE_DAMPING;
            button.touchDownBounceScale  = DEFAULT_BOUNCE_SHRINK_SCALE;
            break;
            
        case ABAnimationTypeFade:
            button.animateInDuration  = DEFAULT_FADE_IN_DURATION;
            button.animateOutDuration = DEFAULT_FADE_OUT_DURATION;
            break;
    }
    
    return button;
}


#pragma mark - UIResponder

- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches
              withEvent:event];
    
    [self animateIn];
}

- (void)touchesEnded:(NSSet *)touches
           withEvent:(UIEvent *)event {
    
    [super touchesEnded:touches
              withEvent:event];
    
    [self animateOut];
}

- (void)touchesCancelled:(NSSet *)touches
               withEvent:(UIEvent *)event {
    
    [super touchesCancelled:touches
                  withEvent:event];
    
    [self animateOut];
}


#pragma mark - General Animations

- (void)animateIn {
    switch (self.animationType) {
        case ABAnimationTypeBounce: {
            [self bounceIn];
            break;
        }
        case ABAnimationTypeFade: {
            [self fadeIn];
            break;
        }
        default:
            break;
    }
}

- (void)animateOut {
    switch (self.animationType) {
        case ABAnimationTypeBounce: {
            [self bounceOut];
            break;
        }
        case ABAnimationTypeFade: {
            [self fadeOut];
            break;
        }
        default:
            break;
    }
}


#pragma mark - Bounce Animations

- (void)bounceIn {
    [UIView animateWithDuration:self.animateInDuration
                     animations:^{
                         self.transform = CGAffineTransformMakeScale(self.touchDownBounceScale,
                                                                     self.touchDownBounceScale);
                     }
                     completion:nil];
}

- (void)bounceOut {
    [UIView animateWithDuration:self.animateOutDuration
                          delay:0.0f
         usingSpringWithDamping:self.touchUpBounceDamping
          initialSpringVelocity:self.touchUpBounceVelocity
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.transform = CGAffineTransformIdentity;
                     }
                     completion:nil];
}


#pragma mark - Fade Animations

- (void)fadeIn {
    [self.layer removeAnimationForKey:BACKGROUND_COLOR_KEY];
    
    CABasicAnimation *fadeIn   = [CABasicAnimation animationWithKeyPath:BACKGROUND_COLOR_KEY];
    fadeIn.toValue             = (id)self.tintColor.CGColor;
    fadeIn.fromValue           = (id)[UIColor clearColor].CGColor;
    fadeIn.fillMode            = kCAFillModeForwards;
    fadeIn.duration            = self.animateInDuration;
    fadeIn.removedOnCompletion = NO;
    
    [self.layer addAnimation:fadeIn
                      forKey:BACKGROUND_COLOR_KEY];
}

- (void)fadeOut {
    [self.layer removeAnimationForKey:BACKGROUND_COLOR_KEY];
    
    CABasicAnimation *fadeOut = [CABasicAnimation animationWithKeyPath:BACKGROUND_COLOR_KEY];
    fadeOut.toValue           = (id)[UIColor clearColor].CGColor;
    fadeOut.fromValue         = (id)self.tintColor.CGColor;
    fadeOut.fillMode          = kCAFillModeForwards;
    fadeOut.duration          = self.animateOutDuration;
    
    [self.layer addAnimation:fadeOut
                      forKey:BACKGROUND_COLOR_KEY];
}

@end
