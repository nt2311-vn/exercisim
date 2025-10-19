class IllegalOperationException extends RuntimeException {
  public IllegalOperationException(String message) {
    super(message);
  }

  public IllegalOperationException(String message, Throwable cause) {
    super(message, cause);
  }
}

class CalculatorConundrum {

  public String calculate(int operand1, int operand2, String operation) {
    if (operation == null) throw new IllegalArgumentException("Operation cannot be null");

    if (operation.isEmpty()) throw new IllegalArgumentException("Operation cannot be empty");

    if (!operation.equals("+") && !operation.equals("*") && !operation.equals("/"))
      throw new IllegalOperationException("Operation '" + operation + "' does not exist");

    int result;

    try {
      switch (operation) {
        case "+":
          result = operand1 + operand2;
          break;
        case "*":
          result = operand1 * operand2;
          break;
        case "/":
          result = operand1 / operand2; // can throw ArithmeticException
          break;
        default:
          throw new IllegalOperationException("Unknown operation");
      }
    } catch (ArithmeticException e) {
      throw new IllegalOperationException("Division by zero is not allowed", e);
    }

    return operand1 + " " + operation + " " + operand2 + " = " + result;
  }
}
