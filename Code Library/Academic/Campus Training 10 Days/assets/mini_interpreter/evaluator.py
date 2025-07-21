# evaluator.py - Evaluate postfix expressions using stack

def evaluate_postfix(postfix_tokens, symbol_table):
    stack = []
    for token in postfix_tokens:
        if token.isdigit():
            stack.append(int(token))
        elif token.isalpha():
            stack.append(symbol_table.get(token))
        elif token in "+-*/":
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
                res = a // b
            stack.append(res)
        else:
            raise ValueError(f"Invalid token {token}")
    if len(stack) != 1:
        raise ValueError("Malformed expression.")
    return stack[0]