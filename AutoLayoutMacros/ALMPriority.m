#import "ALMPriority.h"

#if TARGET_OS_IPHONE

ALMPriority ALM_PRIO(UILayoutPriority priority) {
    return (ALMPriority) {.priority = priority};
}

#else

ALMPriority ALM_PRIO(NSLayoutPriority priority) {
    return (ALMPriority) {.priority = priority};
}

#endif
