public class Calculator {

    public static Integer add(Integer a, Integer b) {
        return a + b;
    }

    public static Integer subtract(Integer a, Integer b) {
        return a - b;
    }

    public static Integer multiply(Integer a, Integer b) {
        return a * b;
    }

    public static Decimal divide(Integer a, Integer b) {
        if (b == 0) {
            throw new IllegalArgumentException('Cannot divide by zero');
        }
        return (Decimal)a / b;
    }
}