#import "AutoLayoutMacrosShort.h"
#import "ConstraintMatchers.h"

@interface AbsoluteSizeTests : XCTestCase
@end

@implementation AbsoluteSizeTests {
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
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, 20.0);
    assertThat(constraint, constraintWithItems(_a, nil));
    assertThatInteger(constraint.firstAttribute, equalToInteger(NSLayoutAttributeWidth));
    assertThatInteger(constraint.secondAttribute, equalToInteger(NSLayoutAttributeNotAnAttribute));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(20.0));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

#pragma mark - relation

- (void)testWithConstRelation {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, GE(20));
    assertThat(constraint, constraintWithItems(_a, nil));
    assertThatInteger(constraint.firstAttribute, equalToInteger(NSLayoutAttributeWidth));
    assertThatInteger(constraint.secondAttribute, equalToInteger(NSLayoutAttributeNotAnAttribute));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

#pragma mark - priority

- (void)testWithPriority {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, 20.0, ALM_HIGH);
    assertThat(constraint, constraintWithItems(_a, nil));
    assertThatInteger(constraint.firstAttribute, equalToInteger(NSLayoutAttributeWidth));
    assertThatInteger(constraint.secondAttribute, equalToInteger(NSLayoutAttributeNotAnAttribute));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(20.0));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

- (void)testWithPriorityAndRelation {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, GE(20), ALM_HIGH);
    assertThat(constraint, constraintWithItems(_a, nil));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

#pragma mark - relation types

- (void)testGreaterEqualRelation {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, GE(20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
}

- (void)testEqualRelation {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, EQ(20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
}

- (void)testLessEqualRelation {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, LE(20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationLessThanOrEqual));
}

#pragma mark - size types

- (void)testWidth {
    NSLayoutConstraint *constraint = PIN_WIDTH(_a, 20.0);
    assertThatInteger(constraint.firstAttribute, equalToInteger(NSLayoutAttributeWidth));
    assertThatInteger(constraint.secondAttribute, equalToInteger(NSLayoutAttributeNotAnAttribute));
}

- (void)testHeight {
    NSLayoutConstraint *constraint = PIN_HEIGHT(_a, 20.0);
    assertThatInteger(constraint.firstAttribute, equalToInteger(NSLayoutAttributeHeight));
    assertThatInteger(constraint.secondAttribute, equalToInteger(NSLayoutAttributeNotAnAttribute));
}

@end
