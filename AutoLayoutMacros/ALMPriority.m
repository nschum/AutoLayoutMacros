#import "ALMPriority.h"

ALMPriority ALM_PRIO(NSLayoutPriority priority) {
    return (ALMPriority) {.priority = priority};
}
