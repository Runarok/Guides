# expression_tree.py - Expression tree classes and traversals

class TreeNode:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

def inorder(node):
    if node is None:
        return ""
    left = inorder(node.left)
    right = inorder(node.right)
    if left and right:
        return f"({left} {node.value} {right})"
    return f"{node.value}"

def preorder(node):
    if node is None:
        return ""
    left = preorder(node.left)
    right = preorder(node.right)
    return f"{node.value} {left}{right}".strip()

def postorder(node):
    if node is None:
        return ""
    left = postorder(node.left)
    right = postorder(node.right)
    return f"{left}{right}{node.value} ".strip()