# evaluator.py
# Evaluates postfix (RPN) expressions using a stack.
# Supports looking up variable values from the symbol table.

def evaluate_postfix(postfix_tokens, symbol_table):
    """
    Evaluates a list of postfix tokens using a stack.
    Supports +, -, *, / operations and variable lookup.
    Returns the final integer result.
    """
    stack = []
    for token in postfix_tokens:
        if token.isdigit():
            # Token is an integer operand
            stack.append(int(token))
        elif token.isalpha():
            # Token is a variable; fetch from symbol table
            stack.append(symbol_table.get(token))
        elif token in "+-*/":
            # Token is an operator; pop two operands and apply
            b = stack.pop()
            a = stack.pop()
            if token == '+':
                res = a + b
            elif token == '-':
                res = a - b
            elif token == '*':
                res = a * b
            elif token == '/':
                if b == 0:
                    raise ZeroDivisionError("Division by zero")
                res = a // b  # Integer division
            stack.append(res)
        else:
            raise ValueError(f"Invalid token in postfix expression: {token}")
    if len(stack) != 1:
        raise ValueError("Malformed postfix expression.")
    return stack[0]