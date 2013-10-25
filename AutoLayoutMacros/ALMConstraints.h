#import "ALMRelations.h"
#import "ALMPriority.h"

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    _ALMRelation relation);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    CGFloat c);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    _ALMItemRelation relation);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, _ALMRelation relation);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, CGFloat c);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, _ALMMultiplier m);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, _ALMMultiplier m, CGFloat c);

#pragma mark - priority

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    _ALMRelation relation,
    ALMPriority priority);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    CGFloat c,
    ALMPriority priority);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    _ALMItemRelation relation,
    ALMPriority priority);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem,
    ALMPriority priority);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, _ALMRelation relation,
    ALMPriority priority);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, CGFloat c,
    ALMPriority priority);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, _ALMMultiplier m,
    ALMPriority priority);

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, _ALMMultiplier m, CGFloat c,
    ALMPriority priority);

#pragma mark - alignment

#define _ALMAlignMake(attribute, item, to, ...) \
_ALMConstraintMake(item, attribute, attribute, to, ## __VA_ARGS__)

#define ALM_ALIGN_LEADING(item, to, ...) \
_ALMAlignMake(NSLayoutAttributeLeading, item, to, ## __VA_ARGS__)
#define ALM_ALIGN_TRAILING(item, to, ...) \
_ALMAlignMake(NSLayoutAttributeTrailing, item, to, ## __VA_ARGS__)

#define ALM_ALIGN_LEFT(item, to, ...) \
_ALMAlignMake(NSLayoutAttributeLeft, item, to, ## __VA_ARGS__)
#define ALM_ALIGN_RIGHT(item, to, ...) \
_ALMAlignMake(NSLayoutAttributeRight, item, to, ## __VA_ARGS__)
#define ALM_ALIGN_CENTER_X(item, to, ...) \
_ALMAlignMake(NSLayoutAttributeCenterX, item, to, ## __VA_ARGS__)

#define ALM_ALIGN_TOP(item, to, ...) \
_ALMAlignMake(NSLayoutAttributeTop, item, to, ## __VA_ARGS__)
#define ALM_ALIGN_BOTTOM(item, to, ...) \
_ALMAlignMake(NSLayoutAttributeBottom, item, to, ## __VA_ARGS__)
#define ALM_ALIGN_CENTER_Y(item, to, ...) \
_ALMAlignMake(NSLayoutAttributeCenterY, item, to, ## __VA_ARGS__)

#define ALM_ALIGN_BASELINE(item, to, ...) \
_ALMAlignMake(NSLayoutAttributeBaseline, item, to, ## __VA_ARGS__)

#pragma mark - inset

#define _ALMInsetMake(attribute, view, ...) \
_ALMConstraintMake(view, attribute, attribute, view.superview, ## __VA_ARGS__)
#define _ALMInsetMakeInverse(attribute, view, ...) \
_ALMConstraintMake(view.superview, attribute, attribute, view, ## __VA_ARGS__)

#define ALM_INSET_LEADING(view, ...) \
_ALMInsetMake(NSLayoutAttributeLeading, view, ## __VA_ARGS__)
#define ALM_INSET_TRAILING(view, ...) \
_ALMInsetMakeInverse(NSLayoutAttributeTrailing, view, ## __VA_ARGS__)

#define ALM_INSET_LEFT(view, ...) \
_ALMInsetMake(NSLayoutAttributeLeft, view, ## __VA_ARGS__)
#define ALM_INSET_RIGHT(view, ...) \
_ALMInsetMakeInverse(NSLayoutAttributeRight, view, ## __VA_ARGS__)

#define ALM_INSET_TOP(view, ...) \
_ALMInsetMake(NSLayoutAttributeTop, view, ## __VA_ARGS__)
#define ALM_INSET_BOTTOM(view, ...) \
_ALMInsetMakeInverse(NSLayoutAttributeBottom, view, ## __VA_ARGS__)

#pragma mark - spacing

#define ALM_HSPACE(leftItem, rightItem, ...) \
_ALMConstraintMake(rightItem, NSLayoutAttributeLeft, NSLayoutAttributeRight, leftItem, ## __VA_ARGS__)

#define ALM_VSPACE(upperItem, lowerItem, ...) \
_ALMConstraintMake(lowerItem, NSLayoutAttributeTop, NSLayoutAttributeBottom, upperItem, ## __VA_ARGS__)

#pragma mark - sizes

#define _ALMSizeMake(attr, item, to, ...) \
_ALMConstraintMake(item, attr, attr, to, ## __VA_ARGS__)

#define ALM_PIN_WIDTH(item, to, ...) \
_ALMSizeMake(NSLayoutAttributeWidth, item, to, ## __VA_ARGS__)
#define ALM_PIN_HEIGHT(item, to, ...) \
_ALMSizeMake(NSLayoutAttributeHeight, item, to, ## __VA_ARGS__)
