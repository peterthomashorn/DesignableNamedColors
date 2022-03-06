import AppKit

@IBDesignable class DesignableView: NSView {
    var color: NSColor?

    func initializeColor() {
        // Explicitly defining the bundle of the named color enables it successful loading.
        // It appears like the IBDesignable agent uses a different bundle.

        let bundle = Bundle(for: AppDelegate.self)

        guard let color = NSColor(named: "AccentColor", bundle: bundle) else {
            assertionFailure("Failed to load color named \"AccentColor\"!")
            return
        }

        self.color = color

        wantsLayer = true
        layer?.backgroundColor = color.cgColor
    }

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        initializeColor()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeColor()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initializeColor()
    }
}
