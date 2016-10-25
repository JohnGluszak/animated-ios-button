# Animated Button
A ready-to-use Objective-C button with bounce and fade animations.


## Install

If you use [Cocoapods](https://cocoapods.org/), add this line to your podfile:
```
pod 'AnimatedButton'
```

## Usage

### Bouncing Button

![Bounce](https://github.com/JohnGluszak/animated-ios-button/blob/master/Images/AnimatedButtonBounce.gif)

```objective-c
ABAnimatedButton *button = [ABAnimatedButton buttonWithAnimationType:ABAnimationTypeBounce];
// Now customize the button appearance like a normal UIButton
```


### Fading Button

![Fade](https://github.com/JohnGluszak/animated-ios-button/blob/master/Images/AnimatedButtonFade.gif)

```objective-c
ABAnimatedButton *button = [ABAnimatedButton buttonWithAnimationType:ABAnimationTypeFade];
button.tintColor = [UIColor ...]; // Set the fade animation color
// Now customize the button appearance like a normal UIButton
```
* Note the fade color is set by the ```tintColor``` of the button.


### Customizing

You can fully customize the behavior of the button animations by altering the ```ABAnimatedButton``` properties. These allow you to change:
* Animation duration
* Fade color
* Bounce damping & velocity
* Bounce scale



## Contributing

Please open Github issues for bugs, questions, or feature requests.


## License

This project is released under an MIT License. See LICENSE file for details.
