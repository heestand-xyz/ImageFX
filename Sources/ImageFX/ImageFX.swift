#if os(macOS)
import Cocoa
#else
import UIKit
#endif
import RenderKit
import PixelKit
import PixelColor

#if os(macOS)
public typealias _Image = NSImage
public typealias _Color = NSColor
#else
public typealias _Image = UIImage
public typealias _Color = UIColor
#endif

var didSetup: Bool = false

func setup() {
    frameLoopRenderThread = .background
    PixelKit.main.render.engine.renderMode = .manual
    PixelKit.main.disableLogging()
    didSetup = true
}

func fx(_ image: _Image, edit: (ImagePIX) -> (PIX & NODEOut)) -> _Image {
    
    if !didSetup {
        setup()
    }
    
    let imagePix = ImagePIX()
    imagePix.image = image
    
    let editPix = edit(imagePix)
    
    return render(pix: editPix)
}

func render(pix: PIX) -> _Image {
    var outImg: _Image?
    let group = DispatchGroup()
    group.enter()
    pix.manuallyRender { result in
        switch result {
        case .success:
            outImg = pix.renderedImage
        case .failure(let error):
            print("ImageFX Render Failed:", error)
        }
        group.leave()
    }
    group.wait()
    guard let img: _Image = outImg else {
        fatalError("fx render failed")
    }
    return img
}

public extension _Image {
    
    func fxBlur(_ value: CGFloat) -> _Image {
        fx(self) { $0.pixBlur(value) }
    }
    
    func fxRainbowBlur(_ value: CGFloat) -> _Image {
        fx(self) { $0.pixRainbowBlur(value) }
    }
    
    func fxEdge(_ value: CGFloat = 10) -> _Image {
        fx(self) { $0.pixEdge(value) }
    }
    
    func fxClamp(low: CGFloat = 0.0, high: CGFloat = 1.0) -> _Image {
        fx(self) { $0.pixClamp(low: low, high: high) }
    }
    
    func fxKaleidoscope(divisions: Int = 12, mirror: Bool = true) -> _Image {
        fx(self) { $0.pixKaleidoscope(divisions: divisions, mirror: mirror) }
    }
    
    func fxBrightness(_ value: CGFloat) -> _Image {
        fx(self) { $0.pixBrightness(value) }
    }
    
    func fxDarkness(_ value: CGFloat) -> _Image {
        fx(self) { $0.pixDarkness(value) }
    }
    
    func fxContrast(_ value: CGFloat) -> _Image {
        fx(self) { $0.pixContrast(value) }
    }
    
    func fxGamma(_ value: CGFloat) -> _Image {
        fx(self) { $0.pixGamma(value) }
    }
    
    func fxInvert() -> _Image {
        fx(self) { $0.pixInvert() }
    }
    
    func fxOpacity(_ value: CGFloat) -> _Image {
        fx(self) { $0.pixOpacity(value) }
    }
    
    func fxQuantize(fraction: CGFloat = 0.1) -> _Image {
        fx(self) { $0.pixQuantize(fraction) }
    }
    
    func fxSharpen(_ value: CGFloat = 2.0) -> _Image {
        fx(self) { $0.pixSharpen(value) }
    }
    
    func fxSlope(_ value: CGFloat = 1.0) -> _Image {
        fx(self) { $0.pixSlope(value) }
    }
    
    func fxThreshold(_ value: CGFloat = 0.5) -> _Image {
        fx(self) { $0.pixThreshold(value) }
    }
    
    func fxTwirl(_ value: CGFloat = 2.0) -> _Image {
        fx(self) { $0.pixTwirl(value) }
    }
    
    func fxRange(inLow: _Color = .black, inHigh: _Color = .white, outLow: _Color = .black, outHigh: _Color = .white) -> _Image {
        fx(self) { $0.pixRange(inLow: PixelColor(inLow), inHigh: PixelColor(inHigh), outLow: PixelColor(outLow), outHigh: PixelColor(outHigh)) }
    }
    
    func fxRange(inLow: CGFloat = 0.0, inHigh: CGFloat = 1.0, outLow: CGFloat = 0.0, outHigh: CGFloat = 1.0) -> _Image {
        fx(self) { $0.pixRange(inLow: inLow, inHigh: inHigh, outLow: outLow, outHigh: outHigh) }
    }
    
    func fxSaturation(_ value: CGFloat) -> _Image {
        fx(self) { $0.pixSaturation(value) }
    }
    
    func fxMonochrome() -> _Image {
        fxSaturation(0.0)
    }
    
    func fxHue(_ value: CGFloat) -> _Image {
        fx(self) { $0.pixHue(value) }
    }
    
    func fxSepia(color: _Color) -> _Image {
        fx(self) { imagePix in
            let sepiaPix = SepiaPIX()
            sepiaPix.input = imagePix
            sepiaPix.color = PixelColor(color)
            return sepiaPix
        }
    }
    
    func fxFlipX() -> _Image {
        fx(self) { $0.pixFlipX() }
    }
    
    func fxFlipY() -> _Image {
        fx(self) { $0.pixFlipY() }
    }
    
    func fxFlopLeft() -> _Image {
        fx(self) { $0.pixFlopLeft() }
    }
    
    func fxFlopRight() -> _Image {
        fx(self) { $0.pixFlopRight() }
    }
}
