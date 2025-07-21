class UndoStackNode:
    def __init__(self, job_id):
        self.job_id = job_id
        self.next = None

class UndoStack:
    def __init__(self):
        self.top = None

    def push(self, job_id):
        new_node = UndoStackNode(job_id)
        new_node.next = self.top
        self.top = new_node

    def pop(self):
        if self.top is None:
            return None
        job_id = self.top.job_id
        self.top = self.top.next
        return job_id

    def peek(self):
        if self.top is not None:
            return self.top.job_id
        return None

    def is_empty(self):
        return self.top is None