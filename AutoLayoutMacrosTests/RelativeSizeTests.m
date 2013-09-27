#import "AutoLayoutMacrosShort.h"
#import "ConstraintMatchers.h"

@interface RelativeSizeTests : XCTestCase
@end

@implementation RelativeSizeTests {
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
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, _b);
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeWidth));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(0));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

#pragma mark - const and multiplier

- (void)testWithConst {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, _b, 20);
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeWidth));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

- (void)testWithMultiplier {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, _b, TIMES(20));
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeWidth));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(0));
    assertThatDouble(constraint.multiplier, equalToDouble(20));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

- (void)testWithConstAndMultiplier {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, _b, TIMES(20), 10);
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeWidth));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(10));
    assertThatDouble(constraint.multiplier, equalToDouble(20));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

#pragma mark - relation

- (void)testWithRelation {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, GE(_b));
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeWidth));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(0));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

- (void)testWithConstRelation {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, GE(_b, 20));
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeWidth));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

- (void)testWithMultiplierRelation {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, GE(_b, TIMES(20)));
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeWidth));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(0.0));
    assertThatDouble(constraint.multiplier, equalToDouble(20.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

- (void)testWithConstAndMultiplierRelation {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, GE(_b, TIMES(20), 10));
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeWidth));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(10.0));
    assertThatDouble(constraint.multiplier, equalToDouble(20.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

#pragma mark - priority

- (void)testWithPriority {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, _b, ALM_HIGH);
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeWidth));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(0));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

- (void)testWithPriorityAndConst {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, _b, 20, ALM_HIGH);
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeWidth));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

- (void)testWithPriorityAndMultiplier {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, _b, TIMES(20), ALM_HIGH);
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeWidth));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(0));
    assertThatDouble(constraint.multiplier, equalToDouble(20));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

- (void)testWithPriorityConstAndMultiplier {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, _b, TIMES(20), 10, ALM_HIGH);
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeWidth));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(10));
    assertThatDouble(constraint.multiplier, equalToDouble(20));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

- (void)testWithPriorityAndRelation {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, GE(_b, 20), ALM_HIGH);
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

#pragma mark - relation types

- (void)testGreaterEqualRelation {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, GE(_b, 20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
}

- (void)testEqualRelation {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, EQ(20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
}

- (void)testLessEqualRelation {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, LE(_b, 20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationLessThanOrEqual));
}

#pragma mark - size types

- (void)testWidth {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, _b);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeWidth));
}

- (void)testHeight {
    NSLayoutConstraint *constraint = PIN_HEIGHT(_a, _b);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeHeight));
}

@end
