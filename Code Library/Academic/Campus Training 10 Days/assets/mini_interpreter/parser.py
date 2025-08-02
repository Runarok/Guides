# parser.py
# Converts infix tokens to postfix (using Shunting Yard algorithm) and builds the binary expression tree.

from mini_interpreter.expression_tree import TreeNode

def precedence(op):
    """
    Returns the precedence of the given operator.
    Higher number means higher precedence.
    """
    if op in ('+', '-'):
        return 1
    if op in ('*', '/'):
        return 2
    return 0

def infix_to_postfix(tokens):
    """
    Converts a list of infix tokens to a list of postfix tokens (Reverse Polish Notation).
    Uses a stack for operators.
    """
    output = []
    stack = []
    for token in tokens:
        if token.isdigit() or token.isalpha():
            # Numbers and variable names go directly to output
            output.append(token)
        elif token == "(":
            # Left parenthesis goes on stack
            stack.append(token)
        elif token == ")":
            # Pop operators until left parenthesis
            while stack and stack[-1] != "(":
                output.append(stack.pop())
            if stack and stack[-1] == "(":
                stack.pop()
        else:
            # Operator: pop operators of higher or equal precedence
            while stack and precedence(stack[-1]) >= precedence(token):
                output.append(stack.pop())
            stack.append(token)
    # Pop any remaining operators
    while stack:
        output.append(stack.pop())
    return output

def build_expression_tree(postfix_tokens):
    """
    Builds a binary expression tree from postfix tokens.
    Returns the root node of the tree.
    """
    stack = []
    for token in postfix_tokens:
        if token.isdigit() or token.isalpha():
            # Operand: create a leaf node
            stack.append(TreeNode(token))
        else:
            # Operator: pop two nodes for right and left children
            right = stack.pop()
            left = stack.pop()
            node = TreeNode(token)
            node.left = left
            node.right = right
            stack.append(node)
    # The last item in the stack is the root
    return stack[-1]