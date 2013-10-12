@interface ColoredView : NSView

@property (nonatomic, copy) NSColor *color;

- (id)initWithColor:(NSColor *)color;
@end
