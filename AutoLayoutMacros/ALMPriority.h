#if TARGET_OS_IPHONE

typedef struct ALMPriority {
    UILayoutPriority priority;
} ALMPriority;

ALMPriority ALM_PRIO(UILayoutPriority priority);

#define ALM_REQUIRED (PRIO(NSLayoutPriorityRequired))
#define ALM_HIGH (PRIO(NSLayoutPriorityDefaultHigh))
#define ALM_LOW (PRIO(NSLayoutPriorityDefaultLow))
#define ALM_FITTING_SIZE_COMPRESSION (PRIO(NSLayoutPriorityFittingSizeCompression))

#else

typedef struct ALMPriority {
    NSLayoutPriority priority;
} ALMPriority;

ALMPriority ALM_PRIO(NSLayoutPriority priority);

#define ALM_REQUIRED (PRIO(NSLayoutPriorityRequired))
#define ALM_HIGH (PRIO(NSLayoutPriorityDefaultHigh))
#define ALM_DRAG_THAT_CAN_RESIZE_WINDOW (PRIO(NSLayoutPriorityDragThatCanResizeWindow))
#define ALM_WINDOWS_SIZE_STAY_PUT (PRIO(NSLayoutPriorityWindowSizeStayPut))
#define ALM_DRAG_THAT_CANNOT_RESIZE_WINDOW (PRIO(NSLayoutPriorityDragThatCannotResizeWindow))
#define ALM_LOW (PRIO(NSLayoutPriorityDefaultLow))
#define ALM_FITTING_SIZE_COMPRESSION (PRIO(NSLayoutPriorityFittingSizeCompression))

#endif
