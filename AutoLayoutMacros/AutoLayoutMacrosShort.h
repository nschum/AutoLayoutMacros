/**
 * Contains non-namespaced, shorter version of the macros.
 */
#import "AutoLayoutMacros.h"

#define ALIGN_LEADING(item, toItem, ...) ALM_ALIGN_LEADING(item, toItem, ## __VA_ARGS__)
#define ALIGN_TRAILING(item, toItem, ...) ALM_ALIGN_TRAILING(item, toItem, ## __VA_ARGS__)
#define ALIGN_LEFT(item, toItem, ...) ALM_ALIGN_LEFT(item, toItem, ## __VA_ARGS__)
#define ALIGN_RIGHT(item, toItem, ...) ALM_ALIGN_RIGHT(item, toItem, ## __VA_ARGS__)
#define ALIGN_CENTER_X(item, toItem, ...) ALM_ALIGN_CENTER_X(item, toItem, ## __VA_ARGS__)
#define ALIGN_TOP(item, toItem, ...) ALM_ALIGN_TOP(item, toItem, ## __VA_ARGS__)
#define ALIGN_BOTTOM(item, toItem, ...) ALM_ALIGN_BOTTOM(item, toItem, ## __VA_ARGS__)
#define ALIGN_CENTER_Y(item, toItem, ...) ALM_ALIGN_CENTER_Y(item, toItem, ## __VA_ARGS__)
#define ALIGN_BASELINE(item, toItem, ...) ALM_ALIGN_BASELINE(item, toItem, ## __VA_ARGS__)

#define HSPACE(leftItem, rightItem, ...) ALM_HSPACE(leftItem, rightItem, ## __VA_ARGS__)
#define VSPACE(leftItem, rightItem, ...) ALM_VSPACE(leftItem, rightItem, ## __VA_ARGS__)

#define PIN_WIDTH(item, to, ...) \
ALM_PIN_WIDTH(item, to, ## __VA_ARGS__)
#define PIN_HEIGHT(item, to, ...) \
ALM_PIN_HEIGHT(item, to, ## __VA_ARGS__)

#define GE(greaterThanOrEqual, ...) ALM_GE(greaterThanOrEqual, ## __VA_ARGS__)
#define EQ(equal, ...) ALM_EQ(equal, ## __VA_ARGS__)
#define LE(lessThanOrEqual, ...) ALM_LE(lessThanOrEqual, ## __VA_ARGS__)

#define PRIO ALM_PRIO
#define REQUIRED ALM_REQUIRED
#define HIGH ALM_HIGH
#define LOW ALM_LOW
