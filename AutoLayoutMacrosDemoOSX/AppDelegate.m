#import "AppDelegate.h"
#import "AutoLayoutMacrosShort.h"
#import "ColoredView.h"

@interface AppDelegate()

@property (nonatomic, copy) NSArray *constraints;

@end

@implementation AppDelegate {
    NSArray *_constraints;
    NSArray *_constraintChoices;
    u_long _choice;
    NSTimer *_timer;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self setupBlueView];
    [self setupConstraints];
    [self pickNextConstraints];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                              target:self
                                            selector:@selector(pickNextConstraints)
                                            userInfo:nil
                                             repeats:YES];
}

- (void)dealloc {
    [_timer invalidate];
}

- (void)setupBlueView {
    _blueView = [[ColoredView alloc] initWithColor:[NSColor blueColor]];
    _blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.window.contentView addSubview:_blueView];
}

- (void)setupConstraints {
    _constraintChoices = @[
        @[
            ALIGN_LEFT(_blueView, _redView, 10),
            ALIGN_TOP(_blueView, _redView, 10),
            ALIGN_RIGHT(_blueView, _redView, -10),
            ALIGN_BOTTOM(_blueView, _redView, -10),
        ],
        @[
            ALIGN_LEFT(_blueView, _redView, 10),
            ALIGN_TOP(_blueView, _redView, 10),
            PIN_WIDTH(_blueView, 100),
            PIN_HEIGHT(_blueView, 100),
        ],
        @[
            HSPACE(_redView, _blueView, 10),
            ALIGN_TOP(_redView, _blueView),
            PIN_WIDTH(_blueView, 100),
            PIN_HEIGHT(_blueView, _redView),
        ],
        @[
            VSPACE(_redView, _blueView, 10),
            ALIGN_LEFT(_redView, _blueView),
            PIN_WIDTH(_blueView, _redView),
            PIN_HEIGHT(_blueView, 100),
        ],
        @[
            HSPACE(_blueView, _redView, 10),
            ALIGN_BOTTOM(_redView, _blueView),
            PIN_WIDTH(_blueView, 100),
            PIN_HEIGHT(_blueView, _redView),
        ],
        @[
            VSPACE(_blueView, _redView, 10),
            ALIGN_RIGHT(_redView, _blueView),
            PIN_WIDTH(_blueView, _redView),
            PIN_HEIGHT(_blueView, 100),
        ],
        @[
            ALIGN_CENTER_X(_blueView, _redView),
            ALIGN_CENTER_Y(_blueView, _redView),
            PIN_WIDTH(_blueView, _redView, TIMES(.75)),
            PIN_HEIGHT(_blueView, _redView, TIMES(.5)),
        ],
        @[
            ALIGN_CENTER_X(_blueView, _redView),
            ALIGN_CENTER_Y(_blueView, _redView),
            PIN_WIDTH(_blueView, _redView, TIMES(.5), LOW),
            PIN_WIDTH(_blueView, GE(250)),
            PIN_HEIGHT(_blueView, _redView, TIMES(.5), LOW),
            PIN_HEIGHT(_blueView, GE(200)),
        ],
    ];
}

- (void)pickNextConstraints {
    self.constraints = _constraintChoices[_choice];
    _choice = (_choice + 1) % _constraintChoices.count;
}

- (void)setConstraints:(NSArray *)constraints {
    if (_constraints) {
        [self.window.contentView removeConstraints:_constraints];
    }
    _constraints = [constraints copy];
    if (_constraints) {
        [self.window.contentView addConstraints:_constraints];
    }
}

@end
