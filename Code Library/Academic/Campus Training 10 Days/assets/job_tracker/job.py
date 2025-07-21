class Job:
    def __init__(self, job_id, title, company, salary, score, status="open"):
        self.id = job_id
        self.title = title
        self.company = company
        self.salary = salary
        self.score = score
        self.status = status

    def __str__(self):
        return f"Job(id={self.id}, title={self.title}, company={self.company}, salary={self.salary}, score={self.score}, status={self.status})"