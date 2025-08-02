"""
job_manager.py
Central manager combining all data structures for job tracking.
"""

from job_tracker.job_store import JobStore
from job_tracker.application_queue import ApplicationQueue
from job_tracker.undo_stack import UndoStack
from job_tracker.job_tree import JobTree
from job_tracker.job import Job

class JobManager:
    """
    Combines job store, queue, stack, and tree to manage all job operations.
    """
    def __init__(self):
        self.job_store = JobStore()
        self.application_queue = ApplicationQueue()
        self.undo_stack = UndoStack()
        self.job_tree = JobTree()

    def add_job(self, job):
        """
        Adds a job to the store and binary tree.
        """
        self.job_store.add_job(job)
        self.job_tree.insert_job(job)

    def enqueue_application(self, job_id):
        """
        Adds a job application to the queue.
        """
        self.application_queue.enqueue(job_id)

    def process_next_application(self):
        """
        Processes the next job application in the queue.
        Updates job status and records for undo.
        Returns applied job object, or None if no job.
        """
        job_id = self.application_queue.dequeue()
        if job_id is not None:
            job = self.job_store.get_job(job_id)
            if job and job.status == "open":
                job.status = "applied"
                self.undo_stack.push(job_id)
                return job
        return None

    def undo_last_application(self):
        """
        Undoes the last applied job, setting its status back to open.
        Returns the undone job, or None if nothing to undo.
        """
        job_id = self.undo_stack.pop()
        if job_id is not None:
            job = self.job_store.get_job(job_id)
            if job and job.status == "applied":
                job.status = "open"
                return job
        return None

    def print_sorted_jobs_by_score(self):
        """
        Prints jobs sorted by score using in-order tree traversal.
        """
        jobs = self.job_tree.in_order()
        for job in jobs:
            print(job)