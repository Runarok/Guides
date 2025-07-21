class ApplicationQueueNode:
    def __init__(self, job_id):
        self.job_id = job_id
        self.next = None

class ApplicationQueue:
    def __init__(self):
        self.front = None
        self.rear = None

    def enqueue(self, job_id):
        new_node = ApplicationQueueNode(job_id)
        if self.rear is None:
            self.front = self.rear = new_node
        else:
            self.rear.next = new_node
            self.rear = new_node

    def dequeue(self):
        if self.front is None:
            return None
        job_id = self.front.job_id
        self.front = self.front.next
        if self.front is None:
            self.rear = None
        return job_id

    def peek(self):
        if self.front is not None:
            return self.front.job_id
        return None

    def is_empty(self):
        return self.front is None