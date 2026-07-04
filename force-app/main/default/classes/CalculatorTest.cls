@IsTest
private class CalculatorTest {

    @IsTest
    static void testAdd() {
        Integer result = Calculator.add(10, 5);
        System.assertEquals(15, result);
    }

    @IsTest
    static void testSubtract() {
        Integer result = Calculator.subtract(10, 5);
        System.assertEquals(5, result);
    }

    @IsTest
    static void testMultiply() {
        Integer result = Calculator.multiply(10, 5);
        System.assertEquals(50, result);
    }

    @IsTest
    static void testDivide() {
        Decimal result = Calculator.divide(10, 5);
        System.assertEquals(2, result);
    }

    @IsTest
    static void testDivideByZero() {
        try {
            Calculator.divide(10, 0);
            System.assert(false, 'Exception should have been thrown.');
        } catch (IllegalArgumentException e) {
            System.assertEquals('Cannot divide by zero', e.getMessage());
        }
    }
}