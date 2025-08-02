"""
undo_stack.py
Implements a Stack to support undo for job applications.
"""

class UndoStackNode:
    """
    Node for undo stack (linked list).
    """
    def __init__(self, job_id):
        self.job_id = job_id
        self.next = None

class UndoStack:
    """
    LIFO stack for undoing job applications.
    Uses linked list for stack operations.
    """
    def __init__(self):
        self.top = None

    def push(self, job_id):
        """
        Pushes a job_id onto the stack.
        """
        new_node = UndoStackNode(job_id)
        new_node.next = self.top
        self.top = new_node

    def pop(self):
        """
        Removes and returns the job_id from the top of the stack.
        Returns None if stack is empty.
        """
        if self.top is None:
            return None
        job_id = self.top.job_id
        self.top = self.top.next
        return job_id

    def peek(self):
        """
        Returns the job_id at the top without removing it.
        """
        if self.top is not None:
            return self.top.job_id
        return None

    def is_empty(self):
        """
        Checks if the stack is empty.
        """
        return self.top is None