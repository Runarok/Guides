# parser.py - infix to postfix and expression tree builder

from mini_interpreter.expression_tree import TreeNode

def precedence(op):
    if op in ('+', '-'):
        return 1
    if op in ('*', '/'):
        return 2
    return 0

def infix_to_postfix(tokens):
    output = []
    stack = []
    for token in tokens:
        if token.isdigit() or token.isalpha():
            output.append(token)
        elif token == "(":
            stack.append(token)
        elif token == ")":
            while stack and stack[-1] != "(":
                output.append(stack.pop())
            stack.pop()  # remove '('
        else:
            while stack and precedence(stack[-1]) >= precedence(token):
                output.append(stack.pop())
            stack.append(token)
    while stack:
        output.append(stack.pop())
    return output

def build_expression_tree(postfix_tokens):
    stack = []
    for token in postfix_tokens:
        if token.isdigit() or token.isalpha():
            stack.append(TreeNode(token))
        else:
            right = stack.pop()
            left = stack.pop()
            node = TreeNode(token)
            node.left = left
            node.right = right
            stack.append(node)
    return stack[-1]