<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/banner.png?raw=true" width="256"/>

# ImageFX

Powered by Metal with [AsyncGraphics](https://github.com/heestand-xyz/AsyncGraphics)

## Install

### Swift Package

```swift
.package(url: "https://github.com/heestand-xyz/ImageFX", from: "2.0.0")
```

> In version `2.0.0` spatial values are not relative anymore, they are absolute in pixel space

## Effects

> All examples work with `UIImage` and `NSImage`

<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/in.jpg?raw=true" width="128"/>

```swift
let image: UIImage = UIImage(named: "Kite")!
```

### Blur
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_blur.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxBlur(100)
```

### Edge
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_edge.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxEdge()
```

### Clamp
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_clamp.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxClamp(low: 0.25, high: 0.75)
```

### Kaleidoscope
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_kaleidoscope.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxKaleidoscope()
```

### Levels: Brightness
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_brightness.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxBrightness(2.0)
```

### Levels: Gamma
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_gamma.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxGamma(0.5)
```

### Levels: Invert
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_inverted.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxInvert()
```

### Levels: Opacity 
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_opacity.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxOpacity(0.5)
```


### Levels: Contrast
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_contrast.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxContrast(2.0)
```

### Quantize
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_quantize.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxQuantize(0.125)
```

### Sharpen
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_sharpen.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxSharpen(2.0)
```

### Slope
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_slope.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxSlope()
```

### Threshold
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_threshold.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxThreshold()
```

### Sepia
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_sepia.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxSepia(color: .orange)
```

### Range
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_range.jpg?raw=true" width="128"/>

```swift
let fxImageA: UIImage = try await image.fxRange(inLow: 0.0, inHigh: 1.0, outLow: 0.0, outHigh: 0.5)
```

### Saturation
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_saturation.jpg?raw=true" width="128"/>

```swift
let fxImageA: UIImage = try await image.fxSaturation(0.5)
let fxImageB: UIImage = try await image.fxMonochrome()
```

### Hue
<img src="https://github.com/heestand-xyz/ImageFX/blob/main/Assets/fx/out_hue.jpg?raw=true" width="128"/>

```swift
let fxImage: UIImage = try await image.fxHue(.degrees(180))
```

## Custom Effects

```swift
import AsyncGraphics
```

```swift
let fxImage: UIImage = try await image
    .fx { graphic in
        let noise: Graphic = try await .coloredNoise(resolution: graphic.resolution)
        return try await graphic.displaced(with: noise, offset: 100)
    }
```
