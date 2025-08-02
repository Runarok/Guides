"""
job.py
Defines the Job class for storing job information.
"""

class Job:
    """
    Represents a single job listing.
    Attributes:
        id (str): Unique job identifier.
        title (str): Job title.
        company (str): Company name.
        salary (int): Salary offered for the job.
        score (int): Relevance score or rating for the job.
        status (str): Application status ("open", "applied", etc.).
    """
    def __init__(self, job_id, title, company, salary, score, status="open"):
        self.id = job_id
        self.title = title
        self.company = company
        self.salary = salary
        self.score = score
        self.status = status

    def __str__(self):
        """
        Returns a readable string representation of the job.
        """
        return (f"Job(id={self.id}, title={self.title}, company={self.company}, "
                f"salary={self.salary}, score={self.score}, status={self.status})")