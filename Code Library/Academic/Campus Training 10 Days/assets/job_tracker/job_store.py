class JobStore:
    def __init__(self):
        self.jobs = {}

    def add_job(self, job):
        self.jobs[job.id] = job

    def get_job(self, job_id):
        if job_id in self.jobs:
            return self.jobs[job_id]
        return None

    def delete_job(self, job_id):
        if job_id in self.jobs:
            del self.jobs[job_id]

    def list_all_jobs(self):
        return [job for job in self.jobs.values()]