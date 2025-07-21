# queue_executor.py - Queue for deferred execution

class QueueExecutor:
    def __init__(self):
        self.queue = []

    def enqueue_statement(self, line):
        self.queue.append(line)

    def process_queue(self, interpreter_callback):
        while self.queue:
            statement = self.queue.pop(0)
            interpreter_callback(statement)