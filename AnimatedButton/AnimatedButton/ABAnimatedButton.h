//
//  ABAnimatedButton.h
//  animated-button
//
//  Created by John Gluszak on 9/6/16.
//  Copyright © 2016 johngluszak. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ABAnimationType) {
    ABAnimationTypeBounce,
    ABAnimationTypeFade,
};


@interface ABAnimatedButton : UIButton


#pragma mark - Common Properties

/**
 *  The duration of the animation when the button is pressed down
 */
@property (nonatomic, assign) NSTimeInterval animateInDuration;

/**
 *  The duration of the animation when the button is released
 */
@property (nonatomic, assign) NSTimeInterval animateOutDuration;


#pragma mark - Bounce Properties

/**
 *  The animation damping of the button release
 *  To smoothly decelerate the animation without oscillation, use a value of 1
 *  A value closer to 0 will increase the oscillation
 */
@property (nonatomic, assign) CGFloat touchUpBounceDamping;

/**
 *  The animation velocity of the button release
 */
@property (nonatomic, assign) CGFloat touchUpBounceVelocity;

/**
 *  The scale to apply to the button when it's pressed down
 *  A value between 0 and 1 shrinks the button
 *  A value above 1 enlarges the button
 */
@property (nonatomic, assign) CGFloat touchDownBounceScale;


#pragma mark - Creation

/**
 *  Creates a button with a specific type of animation
 *
 *  @param type - the animation type
 *
 *  @return the initialized button
 */
+ (instancetype)buttonWithAnimationType:(ABAnimationType)type;

@end
