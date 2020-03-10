#if os(macOS)
import Cocoa
#else
import UIKit
#endif
import LiveValues
import RenderKit
import PixelKit

#if os(macOS)
public typealias _Image = NSImage
public typealias _Color = NSColor
#else
public typealias _Image = UIImage
public typealias _Color = UIColor
#endif

var didSetup: Bool = false
var didSetLib: Bool = false

func setup() {
//    guard didSetLib else { return }
    guard !didSetup else { return }
    frameLoopRenderThread = .background
    PixelKit.main.render.engine.renderMode = .manual
    PixelKit.main.disableLogging()
//    #if DEBUG
//    PixelKit.main.logDebug()
//    #endif
    didSetup = true
}

func setLib(url: URL) -> Bool {
    guard !didSetLib else { return false }
    guard FileManager.default.fileExists(atPath: url.path) else { return false }
    pixelKitMetalLibURL = url
    didSetLib = true
    setup()
    return true
}

public func fxMetalLib(url: URL) {
    if setLib(url: url) {
        print("New FX Metal Lib Linked")
    }
}

func fx(_ image: _Image, edit: (ImagePIX) -> (PIX & NODEOut)) -> _Image {
    if !didSetup {
        print("note, if using swiftpm, call fxMetalLib(url:) first. this is auto for pods.")
        setup()
    }
//    #if DEBUG && os(macOS)
//    setLib(url: FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Code/Frameworks/Production/PixelKit/Resources/Metal Libs/PixelKitShaders-macOS.metallib"))
//    #endif
//    guard didSetup else { fatalError("please call fxMetalLib(url:)") }
    let imagePix = ImagePIX()
    imagePix.image = image
    let editPix = edit(imagePix)
    return render(pix: editPix)
}

func render(pix: PIX) -> _Image {
    var outImg: _Image?
    let group = DispatchGroup()
    group.enter()
    try! PixelKit.main.render.engine.manuallyRender {
        outImg = pix.renderedImage
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
        fx(self) { $0._blur(LiveFloat(value)) }
    }
    
    func fxRainbowBlur(_ value: CGFloat) -> _Image {
        fx(self) { $0._rainbowBlur(LiveFloat(value)) }
    }
    
    func fxEdge(_ value: CGFloat = 10) -> _Image {
        fx(self) { $0._edge(LiveFloat(value)) }
    }
    
    func fxClamp(low: CGFloat = 0.0, high: CGFloat = 1.0) -> _Image {
        fx(self) { $0._clamp(low: LiveFloat(low), high: LiveFloat(high)) }
    }
    
    func fxKaleidoscope(divisions: Int = 12, mirror: Bool = true) -> _Image {
        fx(self) { $0._kaleidoscope(divisions: LiveInt(divisions), mirror: LiveBool(mirror)) }
    }
    
    func fxBrightness(_ value: CGFloat) -> _Image {
        fx(self) { $0._brightness(LiveFloat(value)) }
    }
    
    func fxDarkness(_ value: CGFloat) -> _Image {
        fx(self) { $0._darkness(LiveFloat(value)) }
    }
    
    func fxContrast(_ value: CGFloat) -> _Image {
        fx(self) { $0._contrast(LiveFloat(value)) }
    }
    
    func fxGamma(_ value: CGFloat) -> _Image {
        fx(self) { $0._gamma(LiveFloat(value)) }
    }
    
    func fxInvert() -> _Image {
        fx(self) { $0._invert() }
    }
    
    func fxOpacity(_ value: CGFloat) -> _Image {
        fx(self) { $0._opacity(LiveFloat(value)) }
    }
    
    func fxQuantize(fraction: CGFloat = 0.1) -> _Image {
        fx(self) { $0._quantize(LiveFloat(fraction)) }
    }
    
    func fxSharpen(_ value: CGFloat = 2.0) -> _Image {
        fx(self) { $0._sharpen(LiveFloat(value)) }
    }
    
    func fxSlope(_ value: CGFloat = 1.0) -> _Image {
        fx(self) { $0._slope(LiveFloat(value)) }
    }
    
    func fxThreshold(_ value: CGFloat = 0.5) -> _Image {
        fx(self) { $0._threshold(LiveFloat(value)) }
    }
    
    func fxTwirl(_ value: CGFloat = 2.0) -> _Image {
        fx(self) { $0._twirl(LiveFloat(value)) }
    }
    
    func fxRange(inLow: _Color = .black, inHigh: _Color = .white, outLow: _Color = .black, outHigh: _Color = .white) -> _Image {
        fx(self) { $0._range(inLow: LiveColor(inLow), inHigh: LiveColor(inHigh), outLow: LiveColor(outLow), outHigh: LiveColor(outHigh)) }
    }
    
    func fxRange(inLow: CGFloat = 0.0, inHigh: CGFloat = 1.0, outLow: CGFloat = 0.0, outHigh: CGFloat = 1.0) -> _Image {
        fx(self) { $0._range(inLow: LiveFloat(inLow), inHigh: LiveFloat(inHigh), outLow: LiveFloat(outLow), outHigh: LiveFloat(outHigh)) }
    }
    
    func fxSaturation(_ value: CGFloat) -> _Image {
        fx(self) { $0._saturation(LiveFloat(value)) }
    }
    
    func fxMonochrome() -> _Image {
        fxSaturation(0.0)
    }
    
    func fxHue(_ value: CGFloat) -> _Image {
        fx(self) { $0._hue(LiveFloat(value)) }
    }
    
    func fxSepia(color: _Color) -> _Image {
        fx(self) { imagePix in
            let sepiaPix = SepiaPIX()
            sepiaPix.input = imagePix
            sepiaPix.color = LiveColor(color)
            return sepiaPix
        }
    }
    
    func fxFlipX() -> _Image {
        fx(self) { $0._flipX() }
    }
    
    func fxFlipY() -> _Image {
        fx(self) { $0._flipY() }
    }
    
    func fxFlopLeft() -> _Image {
        fx(self) { $0._flopLeft() }
    }
    
    func fxFlopRight() -> _Image {
        fx(self) { $0._flopRight() }
    }
    
}
