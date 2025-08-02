# expression_tree.py
# Defines the TreeNode for the binary expression tree and traversal methods.

class TreeNode:
    """
    Node class for the binary expression tree.
    Each node holds a value and optional left/right children.
    """
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

def inorder(node):
    """
    Returns the inorder (infix) traversal of the expression tree.
    Used to verify the structure and correctness.
    Parentheses are added for clarity.
    """
    if node is None:
        return ""
    left = inorder(node.left)
    right = inorder(node.right)
    if left and right:
        return f"({left} {node.value} {right})"
    return f"{node.value}"

def preorder(node):
    """
    Returns the preorder (prefix) traversal of the expression tree.
    """
    if node is None:
        return ""
    left = preorder(node.left)
    right = preorder(node.right)
    result = node.value
    if left:
        result += " " + left
    if right:
        result += " " + right
    return result

def postorder(node):
    """
    Returns the postorder (postfix) traversal of the expression tree.
    """
    if node is None:
        return ""
    left = postorder(node.left)
    right = postorder(node.right)
    result = ""
    if left:
        result += left + " "
    if right:
        result += right + " "
    result += node.value
    return result.strip()