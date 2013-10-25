AutoLayoutMacros
================

Macros for making Auto Layout more readable (and writable) without using strings.

Not using (visual format) strings means you can use variables and values directly. Works for iOS and OS X.

Examples
--------

    [view addConstraints:@[
        ALIGN_LEFT(view1, view2),
        ALIGN_TOP(view1, view2),
        PIN_WIDTH(view1, view2, TIMES(0.5))
    ]];

### Compare

<table>
<tr>
<th>AutoLayoutMacros</th>
<th>plain Auto Layout</th>
</tr>
<tr>
<td><code>
ALIGN_TOP(view1, view2)
</code></td>
<td><pre>
[NSLayoutConstraint constraintWithItem:view1
                             attribute:NSLayoutAttributeTop
                             relatedBy:NSLayoutRelationEqual
                                toItem:view2
                             attribute:NSLayoutAttributeTop
                            multiplier:1.0
                              constant:0.0]
</pre></td>
</tr>
<tr>
<td><code>
INSET_LEFT(view1, 50)
</code></td>
<td><pre>
[NSLayoutConstraint constraintWithItem:view1
                             attribute:NSLayoutAttributeLeft
                             relatedBy:NSLayoutRelationEqual
                                toItem:view1.superview
                             attribute:NSLayoutAttributeLeft
                            multiplier:1.0
                              constant:50.0]
</pre></td>
</tr>
<tr>
<td><code>
PIN_WIDTH(view1, LE(100))
</code></td>
<td><pre>
[NSLayoutConstraint constraintWithItem:view1
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationLessThanOrEqual
                                toItem:nil
                             attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                              constant:100.0]
</pre></td>
</tr>
<tr>
<td><code>
PIN_HEIGHT(view1, view2, TIMES(2.0))
</code></td>
<td><pre>
[NSLayoutConstraint constraintWithItem:view1
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                                toItem:nil
                             attribute:NSLayoutAttributeHeight
                            multiplier:2.0
                              constant:0.0]
</pre></td>
</tr>
<tr>
<td><code>
HSPACE(view1, view2, 50, PRIO(500))
</code></td>
<td><pre>
NSLayoutConstraint *constraint =
    [NSLayoutConstraint constraintWithItem:view2
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:view1
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:0.0]
constraint.priority = 500;
</pre></td>
</tr>
</table>

### Combinations

    ALIGN_LEADING(view1, view2)
    ALIGN_TRAILING(view1, view2)
    ALIGN_LEFT(view1, view2)
    ALIGN_RIGHT(view1, view2)
    ALIGN_CENTER_X(view1, view2)
    ALIGN_TOP(view1, view2)
    ALIGN_BOTTOM(view1, view2)
    ALIGN_CENTER_Y(view1, view2)
    ALIGN_BASELINE(view1, view2)

    ALIGN_LEADING(view1, view2, 20)
    ALIGN_LEADING(view1, GE(view2))
    ALIGN_LEADING(view1, LE(view2, 10))

    INSET_LEADING(view1)
    INSET_TRAILING(view1)
    INSET_LEFT(view1)
    INSET_RIGHT(view1)
    INSET_CENTER_X(view1)
    INSET_TOP(view1)
    INSET_BOTTOM(view1)
    INSET_CENTER_Y(view1)
    INSET_BASELINE(view1)

    INSET_LEADING(view1, -20)
    INSET_LEADING(view1, GE(50))

    PIN_WIDTH(view1, view2)
    PIN_HEIGHT(view1, view2)

    PIN_WIDTH(view1, view2, 20)
    PIN_WIDTH(view1, view2, TIMES(2))
    PIN_WIDTH(view1, view2, TIMES(2), 10)
    PIN_WIDTH(view1, EQ(view2, TIMES(2), 10))
    PIN_WIDTH(view1, LE(view2, 50), PRIO(500))

    PIN_WIDTH(view1, 100)
    ALIGN_HEIGHT(view1, 100)

    PIN_WIDTH(view1, GE(100))
    PIN_WIDTH(view1, 100, LOW)

    HSPACE(view1, view2)
    VSPACE(view1, view2)

    HSPACE(view1, view2, 10)
    HSPACE(view1, view2, GE(10))
    HSPACE(view1, view2, LE(10), HIGH)
    HSPACE(view1, view2, 10, REQUIRED)

### Prefix

All macros use the `ALM_` prefix by default, e.g. `ALM_ALIGN_LEFT` if you import `AutoLayoutMacros.h`. The shorter macros above are available in `AutoLayoutMacrosShort.h`.

Don't use functions that start with _ALM. These are for internal use.

Setup
-----

### CocoaPods ###

Add the following to your Podfile:

    pod 'AutoLayoutMacros'

Then run `pod install` as usual and `#import <AutoLayoutMacros/AutoLayoutMacros.h>` or `#import <AutoLayoutMacros/AutoLayoutMacrosShort.h>`.

### Manual Installation ###

If you don't use CocoaPods, copy the AutoLayoutMacros directory from the repository into your project.
