typedef struct _ALMMultiplier {
    CGFloat multiplier;
} _ALMMultiplier;

_ALMMultiplier TIMES(CGFloat m);

#pragma mark -

typedef struct _ALMRelation {
    NSLayoutRelation relation;
    CGFloat constant;
} _ALMRelation;

__attribute__((overloadable))
_ALMRelation _ALMRelationMake(NSLayoutRelation relation, CGFloat c);

// Dummy interface to make _ALM_PICK and __builtin_choose_expr compile.
__attribute__((overloadable))
_ALMRelation _ALMRelationMake(NSLayoutRelation relation, id item);

#pragma mark -

typedef struct _ALMItemRelation {
    NSLayoutRelation relation;
    __unsafe_unretained id item;
    CGFloat constant;
    CGFloat multiplier;
} _ALMItemRelation;

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(id item, _ALMRelation relation);

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, id item);

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, id item, CGFloat c);

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, id item, _ALMMultiplier m,
                                      CGFloat c);

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, id item, _ALMMultiplier m);

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, CGFloat c);

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, CGFloat c, _ALMMultiplier m);

__attribute__((overloadable))
_ALMItemRelation _ALMItemRelationMake(NSLayoutRelation relation, _ALMMultiplier m);

#define _ALM_BUMP_2(_0, _1, _2, N, ...) N

#define _ALM_PICK(relation, to, ...) \
_ALM_BUMP_2(, ## __VA_ARGS__, \
_ALMItemRelationMake(relation, to, ## __VA_ARGS__), \
_ALMItemRelationMake(relation, to, ## __VA_ARGS__), \
__builtin_choose_expr(__builtin_types_compatible_p(typeof(to), id), \
_ALMItemRelationMake(relation, to, ## __VA_ARGS__), \
_ALMRelationMake(relation, to) \
))

#define ALM_GE(greaterThanOrEqual, ...) \
_ALM_PICK(NSLayoutRelationGreaterThanOrEqual, greaterThanOrEqual, ## __VA_ARGS__)
#define ALM_EQ(equal, ...) \
_ALM_PICK(NSLayoutRelationEqual, equal, ## __VA_ARGS__)
#define ALM_LE(lessThanOrEqual, ...) \
_ALM_PICK(NSLayoutRelationLessThanOrEqual, lessThanOrEqual, ## __VA_ARGS__)
