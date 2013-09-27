#import "ConstraintMatchers.h"

id<HCMatcher> layoutConstraint() {
    return instanceOf([NSLayoutConstraint class]);
}

id<HCMatcher> constraintWithStandardValues() {
    return allOf(
        layoutConstraint(),
        hasProperty(@"relation", equalTo(@(NSLayoutRelationEqual))),
        hasProperty(@"constant", equalTo(@0.0)),
        hasProperty(@"multiplier", equalTo(@1.0)),
        hasProperty(@"priority", equalTo(@(NSLayoutPriorityRequired))),
        nil);
}

id<HCMatcher> constraintWithItems(id firstItem, id secondItem) {
    return allOf(
        layoutConstraint(),
        hasProperty(@"firstItem", sameInstance(firstItem)),
        hasProperty(@"secondItem", sameInstance(secondItem)),
        nil);
}

id<HCMatcher> constraintWithAttribute(NSLayoutAttribute attribute) {
    return allOf(
        layoutConstraint(),
        hasProperty(@"firstAttribute", @(attribute)),
        hasProperty(@"secondAttribute", @(attribute)),
        nil);
}
