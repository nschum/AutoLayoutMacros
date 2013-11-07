#import "ALMRelations.h"

_ALMMultiplier TIMES(CGFloat m) {
    return (_ALMMultiplier) {.multiplier = m};
}

#pragma mark -

__attribute__((overloadable))
_ALMRelation _ALMRelationMake(NSLayoutRelation relation, CGFloat c) {
    return (_ALMRelation) {
        .relation = relation,
        .constant = c,
    };
}

#pragma mark -

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, id item, CGFloat m, CGFloat c) {
    NSCAssert(item, @"Item in relation must not be nil");
    return (_ALMItemRelation) {
        .relation = relation,
        .item = item,
        .constant = c,
        .multiplier = m,
    };
}

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(id item, _ALMRelation relation) {
    return _ALMItemRelationMake(relation.relation, item, 1.0, relation.constant);
}

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, id item) {
    return _ALMItemRelationMake(relation, item, 1.0, 0.0);
}

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, id item, CGFloat c) {
    return _ALMItemRelationMake(relation, item, 1.0, c);
}

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, id item, _ALMMultiplier m,
                                      CGFloat c) {
    return _ALMItemRelationMake(relation, item, m.multiplier, c);
}

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, id item, _ALMMultiplier m) {
    return _ALMItemRelationMake(relation, item, m, 0);
}

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, CGFloat c) {
    return _ALMItemRelationMake(relation, nil, 1.0, c);
}

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, CGFloat c, _ALMMultiplier m) {
    return _ALMItemRelationMake(relation, nil, m.multiplier, c);
}

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, _ALMMultiplier m) {
    return _ALMItemRelationMake(relation, nil, m, 0.0);
}
