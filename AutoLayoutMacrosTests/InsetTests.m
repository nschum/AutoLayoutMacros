#import "AutoLayoutMacrosShort.h"
#import "ConstraintMatchers.h"

@interface InsetTests : XCTestCase
@end

@implementation InsetTests {
    NSView *_a;
    NSView *_superview;
}

- (void)setUp {
    [super setUp];
    _a = [NSView new];
    _superview = [NSView new];
    [_superview addSubview:_a];
}

#pragma mark - tests

- (void)testBasic {
    NSLayoutConstraint *constraint = INSET_LEADING(_a);
    assertThat(constraint, constraintWithItems(_a, _superview));
    assertThat(constraint, constraintWithStandardValues());
}

#pragma mark - const

- (void)testWithConst {
    NSLayoutConstraint *constraint = INSET_LEADING(_a, 20);
    assertThat(constraint, constraintWithItems(_a, _superview));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

#pragma mark - relation

- (void)testWithConstRelation {
    NSLayoutConstraint *constraint = INSET_LEADING(_a, GE(20));
    assertThat(constraint, constraintWithItems(_a, _superview));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

#pragma mark - priority

- (void)testWithPriority {
    NSLayoutConstraint *constraint = INSET_LEADING(_a, ALM_HIGH);
    assertThat(constraint, constraintWithItems(_a, _superview));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(0));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

- (void)testWithPriorityAndConst {
    NSLayoutConstraint *constraint = INSET_LEADING(_a, 20, ALM_HIGH);
    assertThat(constraint, constraintWithItems(_a, _superview));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

- (void)testWithPriorityAndRelation {
    NSLayoutConstraint *constraint = INSET_LEADING(_a, GE(20), ALM_HIGH);
    assertThat(constraint, constraintWithItems(_a, _superview));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

#pragma mark - relation types

- (void)testGreaterEqualRelation {
    NSLayoutConstraint *constraint = INSET_LEADING(_a, GE(20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
}

- (void)testEqualRelation {
    NSLayoutConstraint *constraint = INSET_LEADING(_a, EQ(20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
}

- (void)testLessEqualRelation {
    NSLayoutConstraint *constraint = INSET_LEADING(_a, LE(20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationLessThanOrEqual));
}

#pragma mark - inset types

- (void)testInsetLeading {
    NSLayoutConstraint *constraint = INSET_LEADING(_a);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeLeading));
    assertThat(constraint, constraintWithItems(_a, _superview));
}

- (void)testInsetTrailing {
    NSLayoutConstraint *constraint = INSET_TRAILING(_a);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeTrailing));
    assertThat(constraint, constraintWithItems(_superview, _a));
}

- (void)testInsetLeft {
    NSLayoutConstraint *constraint = INSET_LEFT(_a);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeLeft));
    assertThat(constraint, constraintWithItems(_a, _superview));
}

- (void)testInsetRight {
    NSLayoutConstraint *constraint = INSET_RIGHT(_a);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeRight));
    assertThat(constraint, constraintWithItems(_superview, _a));
}

- (void)testInsetTop {
    NSLayoutConstraint *constraint = INSET_TOP(_a);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeTop));
    assertThat(constraint, constraintWithItems(_a, _superview));
}

- (void)testInsetBottom {
    NSLayoutConstraint *constraint = INSET_BOTTOM(_a);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeBottom));
    assertThat(constraint, constraintWithItems(_superview, _a));
}

@end
