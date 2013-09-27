#import "AutoLayoutMacrosShort.h"
#import "ConstraintMatchers.h"

@interface AlignTests : XCTestCase
@end

@implementation AlignTests {
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
    NSLayoutConstraint *constraint = ALIGN_LEADING(_a, _b);
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThat(constraint, constraintWithStandardValues());
}

#pragma mark - const

- (void)testWithConst {
    NSLayoutConstraint *constraint = ALIGN_LEADING(_a, _b, 20);
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

#pragma mark - relation

- (void)testWithRelation {
    NSLayoutConstraint *constraint = ALIGN_LEADING(_a, GE(_b));
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(0));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

- (void)testWithConstRelation {
    NSLayoutConstraint *constraint = ALIGN_LEADING(_a, GE(_b, 20));
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToInteger(NSLayoutPriorityRequired));
}

#pragma mark - priority

- (void)testWithPriority {
    NSLayoutConstraint *constraint = ALIGN_LEADING(_a, _b, ALM_HIGH);
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(0));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

- (void)testWithPriorityAndConst {
    NSLayoutConstraint *constraint = ALIGN_LEADING(_a, _b, 20, ALM_HIGH);
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

- (void)testWithPriorityAndRelation {
    NSLayoutConstraint *constraint = ALIGN_LEADING(_a, GE(_b, 20), ALM_HIGH);
    assertThat(constraint, constraintWithItems(_a, _b));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
    assertThatDouble(constraint.constant, equalToDouble(20));
    assertThatDouble(constraint.multiplier, equalToDouble(1.0));
    assertThatFloat(constraint.priority, equalToFloat(NSLayoutPriorityDefaultHigh));
}

#pragma mark - relation types

- (void)testGreaterEqualRelation {
    NSLayoutConstraint *constraint = ALIGN_LEADING(_a, GE(_b, 20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationGreaterThanOrEqual));
}

- (void)testEqualRelation {
    NSLayoutConstraint *constraint = ALIGN_LEADING(_a, EQ(_b, 20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationEqual));
}

- (void)testLessEqualRelation {
    NSLayoutConstraint *constraint = ALIGN_LEADING(_a, LE(_b, 20));
    assertThatInteger(constraint.relation, equalToInteger(NSLayoutRelationLessThanOrEqual));
}

#pragma mark - alignment types

- (void)testAlignLeading {
    NSLayoutConstraint *constraint = ALIGN_LEADING(_a, _b);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeLeading));
}

- (void)testAlignTrailing {
    NSLayoutConstraint *constraint = ALIGN_TRAILING(_a, _b);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeTrailing));
}

- (void)testAlignLeft {
    NSLayoutConstraint *constraint = ALIGN_LEFT(_a, _b);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeLeft));
}

- (void)testAlignRight {
    NSLayoutConstraint *constraint = ALIGN_RIGHT(_a, _b);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeRight));
}

- (void)testAlignCenterX {
    NSLayoutConstraint *constraint = ALIGN_CENTER_X(_a, _b);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeCenterX));
}

- (void)testAlignTop {
    NSLayoutConstraint *constraint = ALIGN_TOP(_a, _b);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeTop));
}

- (void)testAlignBottom {
    NSLayoutConstraint *constraint = ALIGN_BOTTOM(_a, _b);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeBottom));
}

- (void)testAlignCenterY {
    NSLayoutConstraint *constraint = ALIGN_CENTER_Y(_a, _b);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeCenterY));
}

- (void)testAlignBaseline {
    NSLayoutConstraint *constraint = ALIGN_BASELINE(_a, _b);
    assertThat(constraint, constraintWithAttribute(NSLayoutAttributeBaseline));
}

@end
