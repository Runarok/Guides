# queue_executor.py
# Implements a queue to allow deferring execution of statements.

class QueueExecutor:
    """
    QueueExecutor keeps a queue of statements to be executed.
    Allows enqueueing and batch processing.
    """
    def __init__(self):
        self.queue = []

    def enqueue_statement(self, line):
        """
        Adds a statement (string) to the execution queue.
        """
        self.queue.append(line)

    def process_queue(self, interpreter_callback):
        """
        Processes all statements in the queue, in order.
        interpreter_callback is a function that handles a statement.
        """
        while self.queue:
            statement = self.queue.pop(0)
            interpreter_callback(statement)