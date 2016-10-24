# Animated Button
A ready-to-use Objective-C button with bounce and fade animations.


## Install

If you use [Cocoapods](https://cocoapods.org/), add this line to your podfile:
```
pod 'AnimatedButton'
```

## Usage

### Bouncing Button

Use the following code to create a button that bounces on touches:
```objective-c
ABAnimatedButton *button = [ABAnimatedButton buttonWithAnimationType:ABAnimationTypeBounce];
// Now customize the button appearance like a normal UIButton
```


### Fading Button

Use the following code to create a button that animates a color fade on touches.  
Note the fade color is set by the ```tintColor``` of the button.
```objective-c
ABAnimatedButton *button = [ABAnimatedButton buttonWithAnimationType:ABAnimationTypeFade];
button.tintColor = [UIColor ...]; // Set the fade animation color
// Now customize the button appearance like a normal UIButton
```


## Contributing

Please open Github issues for bugs, questions, or feature requests.


## License

This project is released under an MIT License. See LICENSE file for details.
