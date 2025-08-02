# main.py
# Command-line interpreter shell for mini language.
# Supports variable assignments, arithmetic expressions, and print statements.

from mini_interpreter.lexer import tokenize
from mini_interpreter.parser import infix_to_postfix, build_expression_tree
from mini_interpreter.expression_tree import inorder
from mini_interpreter.symbol_table import SymbolTable
from mini_interpreter.evaluator import evaluate_postfix
from mini_interpreter.queue_executor import QueueExecutor

def handle_statement(line, symbol_table):
    """
    Handles a single statement: assignment or print.
    Tokenizes, parses, evaluates, and updates symbol_table.
    Prints the value for 'print' statements, and shows the expression tree for assignments.
    """
    tokens = tokenize(line)
    if not tokens:
        return
    if tokens[0] == "print":
        # Print statement: print variable value
        var_name = tokens[1]
        if var_name in symbol_table:
            print(symbol_table.get(var_name))
        else:
            print(f"Variable '{var_name}' not defined.")
        return
    # Assignment: var = expression
    if "=" in tokens:
        var_name = tokens[0]
        expr_tokens = tokens[2:]  # tokens after '='
        postfix = infix_to_postfix(expr_tokens)
        value = evaluate_postfix(postfix, symbol_table)
        symbol_table.set(var_name, value)
        tree = build_expression_tree(postfix)
        print(f"Expression Tree (inorder): {inorder(tree)}")
        return

def main():
    """
    Main interpreter loop.
    Reads statements from user and executes them until 'exit' is typed.
    """
    symbol_table = SymbolTable()
    queue_executor = QueueExecutor()
    print("Mini Interpreter. Type statements. 'exit' to quit.")
    while True:
        try:
            line = input("> ")
        except EOFError:
            # End of input (Ctrl+D)
            break
        if line.strip() == "exit":
            break
        if line.strip() == "":
            continue
        # Enqueue and process the statement
        queue_executor.enqueue_statement(line)
        queue_executor.process_queue(lambda stmt: handle_statement(stmt, symbol_table))

if __name__ == "__main__":
    main()