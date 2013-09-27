#import "ALMConstraints.h"

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    _ALMRelation relation) {

    return [NSLayoutConstraint constraintWithItem:item
                                        attribute:attribute
                                        relatedBy:relation.relation
                                           toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.0
                                         constant:relation.constant];
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    CGFloat c) {

    return _ALMConstraintMake(item, attribute, toAttribute, ALM_EQ(c));
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    _ALMItemRelation relation) {

    return [NSLayoutConstraint constraintWithItem:item
                                        attribute:attribute
                                        relatedBy:relation.relation
                                           toItem:relation.item
                                        attribute:toAttribute
                                       multiplier:relation.multiplier
                                         constant:relation.constant];
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem) {

    return _ALMConstraintMake(item, attribute, toAttribute, ALM_EQ(toItem));
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, _ALMRelation relation) {

    return _ALMConstraintMake(item, attribute, toAttribute, _ALMItemRelationMake(toItem, relation));
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, CGFloat c) {

    return _ALMConstraintMake(item, attribute, toAttribute, ALM_EQ(toItem, c));
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, _ALMMultiplier m) {

    return _ALMConstraintMake(item, attribute, toAttribute, ALM_EQ(toItem, m));
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, _ALMMultiplier m, CGFloat c) {

    return _ALMConstraintMake(item, attribute, toAttribute, ALM_EQ(toItem, m, c));
}

#pragma mark - priority

NSLayoutConstraint *withPriority(ALMPriority priority, NSLayoutConstraint *constraint) {
    constraint.priority = priority.priority;
    return constraint;
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    _ALMRelation relation,
    ALMPriority priority) {

    return withPriority(priority, _ALMConstraintMake(item, attribute, toAttribute, relation));
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    CGFloat c,
    ALMPriority priority) {

    return withPriority(priority, _ALMConstraintMake(item, attribute, toAttribute, c));
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    _ALMItemRelation relation,
    ALMPriority priority) {

    return withPriority(priority, _ALMConstraintMake(item, attribute, toAttribute, relation));
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem,
    ALMPriority priority) {

    return withPriority(priority, _ALMConstraintMake(item, attribute, toAttribute, toItem));
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, _ALMRelation relation,
    ALMPriority priority) {

    return withPriority(priority, _ALMConstraintMake(item, attribute, toAttribute, toItem, relation));
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, CGFloat c,
    ALMPriority priority) {

    return withPriority(priority, _ALMConstraintMake(item, attribute, toAttribute, toItem, c));
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, _ALMMultiplier m,
    ALMPriority priority) {

    return withPriority(priority, _ALMConstraintMake(item, attribute, toAttribute, toItem, m));
}

__attribute__((overloadable))
NSLayoutConstraint *_ALMConstraintMake(
    id item, NSLayoutAttribute attribute, NSLayoutAttribute toAttribute,
    id toItem, _ALMMultiplier m, CGFloat c,
    ALMPriority priority) {

    return withPriority(priority, _ALMConstraintMake(item, attribute, toAttribute, toItem, m, c));
}
