"""
job_tree.py
Implements a Binary Tree to organize jobs by score.
"""

class JobTreeNode:
    """
    Node for the binary search tree.
    """
    def __init__(self, job):
        self.job = job
        self.left = None
        self.right = None

class JobTree:
    """
    Binary Search Tree to organize jobs by their score.
    In-order traversal returns jobs sorted by score.
    """
    def __init__(self):
        self.root = None

    def insert_job(self, job):
        """
        Inserts a job into the tree based on job.score.
        """
        def insert(node, job):
            if node is None:
                return JobTreeNode(job)
            # Lesser scores go left
            if job.score < node.job.score:
                node.left = insert(node.left, job)
            else:
                node.right = insert(node.right, job)
            return node
        self.root = insert(self.root, job)

    def in_order(self):
        """
        Performs in-order traversal and returns sorted list of jobs.
        """
        result = []
        def traverse(node):
            if node is not None:
                traverse(node.left)
                result.append(node.job)
                traverse(node.right)
        traverse(self.root)
        return result