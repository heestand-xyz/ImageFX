<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/banner.png?raw=true" width="256"/>

# ImageFX

Powered by Metal with [PixelKit](https://github.com/heestand-xyz/pixelkit)


## Install

### Swift Package

```swift
.package(url: "https://github.com/heestand-xyz/ImageFX", from: "1.0.0")
```


## Effects

<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/in.jpg?raw=true" width="128"/>

### Blur
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_blur.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxBlur(0.1)
```

### Edge
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_edge.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxEdge()
```

### Clamp
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_clamp.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxClamp(low: 0.25, high: 0.75)
```

### Kaleidoscope
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_kaleidoscope.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxKaleidoscope()
```

### Levels: Brightness
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_brightness.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxBrightness(2.0)
```

### Levels: Gamma
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_gamma.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxGamma(0.5)
```

### Levels: Invert
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_inverted.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxInvert()
```

### Levels: Opacity 
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_opacity.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxOpacity(0.5)
```


### Levels: Contrast
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_contrast.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxContrast(2.0)
```

### Quantize
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_quantize.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxQuantize(0.125)
```

### Sharpen
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_sharpen.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxSharpen(2.0)
```

### Slope
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_slope.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxSlope()
```

### Threshold
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_threshold.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxThreshold()
```

### Twirl
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_twirl.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxTwirl()
```

### Sepia
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_sepia.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxSepia(color: .orange)
```

### Range
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_range.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxRange(inLow: 0.0, inHigh: 1.0, outLow: 0.0, outHigh: 0.5)
let fxImage: UIImage = try async image.fxRange(inLow: .black, inHigh: .white, outLow: .black, outHigh: .gray)
```

### Saturation
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_saturation.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxSaturation(0.5)
let fxImage: UIImage = try async image.fxMonochrome()
```

### Hue
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_hue.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try async image.fxHue(0.5)
```
