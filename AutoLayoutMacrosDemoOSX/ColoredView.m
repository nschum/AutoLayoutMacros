#import "ColoredView.h"

@implementation ColoredView

- (id)initWithColor:(NSColor *)color {
    self = [self init];
    self.color = color;
    return self;
}

- (void)setColor:(NSColor *)color {
    _color = [color copy];
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
    [_color setFill];
    NSGraphicsContext *graphicsContext = [NSGraphicsContext currentContext];
    CGContextRef context = (CGContextRef)[graphicsContext graphicsPort];
    CGContextFillRect(context, dirtyRect);
}

@end
