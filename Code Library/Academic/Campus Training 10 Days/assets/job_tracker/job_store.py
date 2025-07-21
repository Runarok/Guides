"""
job_store.py
Implements a simple HashMap (dictionary) to store jobs.
"""

class JobStore:
    """
    Stores jobs using a Python dictionary.
    Keys are job IDs, values are Job objects.
    """
    def __init__(self):
        self.jobs = {}

    def add_job(self, job):
        """
        Adds a new job to the store.
        """
        self.jobs[job.id] = job

    def get_job(self, job_id):
        """
        Retrieves a job by job_id. Returns None if not found.
        """
        if job_id in self.jobs:
            return self.jobs[job_id]
        return None

    def delete_job(self, job_id):
        """
        Removes a job from the store by job_id.
        """
        if job_id in self.jobs:
            del self.jobs[job_id]

    def list_all_jobs(self):
        """
        Returns a list of all jobs.
        """
        return [job for job in self.jobs.values()]