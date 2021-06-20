<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/banner.png?raw=true" width="256"/>

# ImageFX

Powered by Metal with [PixelKit](https://github.com/heestand-xyz/pixelkit)


## Install

### Swift Package

```swift
.package(url: "https://github.com/heestand-xyz/ImageFX", from: "1.0.0")
```

Important when using the Swift Package, link the metal library by calling `fxMetalLib(url:)` in `application didFinishLaunchingWithOptions` in the `AppDelegate`, before using any effects: 

```swift
#if os(iOS)
fxMetalLib(url: Bundle.main.url(forResource: "PixelKitShaders-iOS", withExtension: "metallib")!)
#elseif os(macOS)
fxMetalLib(url: URL(fileURLWithPath: "/path/to/PixelKitShaders-macOS.metallib"))
#endif
```

You can find the latest Metal library from PixelKit [here](https://github.com/heestand-xyz/PixelKit/tree/master/Resources/Metal%20Libs).



## Effects

<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/in.jpg?raw=true" width="128"/>

Source image

### Blur
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_blur.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxBlur(0.1)
```

### Edge
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_edge.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxEdge()
```

### Clamp
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_clamp.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxClamp(low: 0.25, high: 0.75)
```

### Kaleidoscope
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_kaleidoscope.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxKaleidoscope()
```

### Levels: Brightness
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_brightness.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxBrightness(2.0)
```

### Levels: Gamma
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_gamma.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxGamma(0.5)
```

### Levels: Invert
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_inverted.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxInvert()
```

### Levels: Opacity 
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_opacity.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxOpacity(0.5)
```


### Levels: Contrast
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_contrast.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxContrast(2.0)
```

### Quantize
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_quantize.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxQuantize(0.125)
```

### Sharpen
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_sharpen.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxSharpen(2.0)
```

### Slope
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_slope.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxSlope()
```

### Threshold
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_threshold.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxThreshold()
```

### Twirl
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_twirl.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxTwirl()
```

### Transform
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_transform.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.
```

### Sepia
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_sepia.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxSepia(color: .orange)
```

### Range
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_range.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxRange(inLow: 0.0, inHigh: 1.0, outLow: 0.0, outHigh: 0.5)
let fxImage: UIImage = image.fxRange(inLow: .black, inHigh: .white, outLow: .black, outHigh: .gray)
```

### Saturation
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_saturation.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxSaturation(0.5)
let fxImage: UIImage = image.fxMonochrome()
```

### Hue
<img src="https://github.com/heestand-xyz/ImageFX/blob/master/Assets/fx/out_hue.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = image.fxHue(0.5)
```
