#import "AutoLayoutMacrosShort.h"
#import "ConstraintMatchers.h"

@interface SpaceTests : XCTestCase
@end

@implementation SpaceTests {
    NSView *_a;
    NSView *_b;
}

- (void)setUp {
    [super setUp];
    _a = [NSView new];
    _b = [NSView new];
}

#pragma mark - tests

- (void)testBasic {
    NSLayoutConstraint *constraint = HSPACE(_a, _b);
    assertThat(constraint, constraintWithItems(_b, _a));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(0));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

#pragma mark - const and multiplier

- (void)testWithConst {
    NSLayoutConstraint *constraint = HSPACE(_a, _b, 20);
    assertThat(constraint, constraintWithItems(_b, _a));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

#pragma mark - relation

- (void)testWithConstRelation {
    NSLayoutConstraint *constraint = HSPACE(_a, _b, GE(20));
    assertThat(constraint, constraintWithItems(_b, _a));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

#pragma mark - priority

- (void)testWithPriority {
    NSLayoutConstraint *constraint = HSPACE(_a, _b, ALM_HIGH);
    assertThat(constraint, constraintWithItems(_b, _a));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(0));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

- (void)testWithPriorityAndConst {
    NSLayoutConstraint *constraint = HSPACE(_a, _b, 20, ALM_HIGH);
    assertThat(constraint, constraintWithItems(_b, _a));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

- (void)testWithPriorityAndRelation {
    NSLayoutConstraint *constraint = HSPACE(_a, _b, GE(20), ALM_HIGH);
    assertThat(constraint, constraintWithItems(_b, _a));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

#pragma mark - relation types

- (void)testGreaterEqualRelation {
    NSLayoutConstraint *constraint = HSPACE(_a, _b, GE(20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
}

- (void)testEqualRelation {
    NSLayoutConstraint *constraint = HSPACE(_a, _b, EQ(20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
}

- (void)testLessEqualRelation {
    NSLayoutConstraint *constraint = HSPACE(_a, _b, LE(20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationLessThanOrEqual));
}

#pragma mark - spacing types

- (void)testHorizontalSpace {
    NSLayoutConstraint *constraint = HSPACE(_a, _b);
    assertThatInteger(constraint.firstAttribute, equalToInteger(NSLayoutAttributeLeft));
    assertThatInteger(constraint.secondAttribute, equalToInteger(NSLayoutAttributeRight));
}

- (void)testVerticalSpace {
    NSLayoutConstraint *constraint = VSPACE(_a, _b);
    assertThatInteger(constraint.firstAttribute, equalToInteger(NSLayoutAttributeTop));
    assertThatInteger(constraint.secondAttribute, equalToInteger(NSLayoutAttributeBottom));
}

@end
