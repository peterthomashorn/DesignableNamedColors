import AppKit

@IBDesignable class DesignableView: NSView {
    var color: NSColor?

    func initializeColor() {
        guard let color = NSColor(named: "AccentColor") else {
            assertionFailure("Failed to load color named \"AccentColor\"!")
            return
        }

        self.color = color
    }

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        initializeColor()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeColor()
    }
}
