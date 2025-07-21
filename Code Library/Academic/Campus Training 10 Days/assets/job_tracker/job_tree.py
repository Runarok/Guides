class JobTreeNode:
    def __init__(self, job):
        self.job = job
        self.left = None
        self.right = None

class JobTree:
    def __init__(self):
        self.root = None

    def insert_job(self, job):
        def insert(node, job):
            if node is None:
                return JobTreeNode(job)
            if job.score < node.job.score:
                node.left = insert(node.left, job)
            else:
                node.right = insert(node.right, job)
            return node
        self.root = insert(self.root, job)

    def in_order(self):
        result = []
        def traverse(node):
            if node is not None:
                traverse(node.left)
                result.append(node.job)
                traverse(node.right)
        traverse(self.root)
        return result