"""
application_queue.py
Implements a Queue for job applications.
"""

class ApplicationQueueNode:
    """
    Node for the application queue (linked list).
    """
    def __init__(self, job_id):
        self.job_id = job_id
        self.next = None

class ApplicationQueue:
    """
    FIFO queue for job applications.
    Use linked list for queue operations.
    """
    def __init__(self):
        self.front = None
        self.rear = None

    def enqueue(self, job_id):
        """
        Adds a job_id to the rear of the queue.
        """
        new_node = ApplicationQueueNode(job_id)
        if self.rear is None:
            # Queue is empty
            self.front = self.rear = new_node
        else:
            self.rear.next = new_node
            self.rear = new_node

    def dequeue(self):
        """
        Removes and returns the job_id from the front of the queue.
        Returns None if queue is empty.
        """
        if self.front is None:
            return None
        job_id = self.front.job_id
        self.front = self.front.next
        if self.front is None:
            self.rear = None
        return job_id

    def peek(self):
        """
        Returns job_id at the front without removing it.
        """
        if self.front is not None:
            return self.front.job_id
        return None

    def is_empty(self):
        """
        Checks if the queue is empty.
        """
        return self.front is None