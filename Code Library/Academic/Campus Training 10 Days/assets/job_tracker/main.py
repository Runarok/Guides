"""
main.py
Console interface for the job application tracker/interpreter.
Prompts user for actions and interacts with JobManager.
"""

from job_tracker.job import Job
from job_tracker.job_manager import JobManager

def main():
    """
    Main interactive loop for the job tracker system.
    """
    manager = JobManager()
    while True:
        print("\n--- Job Application Tracker ---")
        print("1. Add Job")
        print("2. Apply to Job")
        print("3. Undo Last Application")
        print("4. List Jobs by Score")
        print("5. Exit")
        choice = input("Enter choice: ")
        if choice == "1":
            # Add a new job
            job_id = input("Job ID: ")
            title = input("Title: ")
            company = input("Company: ")
            salary = int(input("Salary: "))
            score = int(input("Score: "))
            job = Job(job_id, title, company, salary, score)
            manager.add_job(job)
            print("Job added.")
        elif choice == "2":
            # Apply to a job by ID
            job_id = input("Enter Job ID to apply: ")
            if manager.job_store.get_job(job_id):
                manager.enqueue_application(job_id)
                applied_job = manager.process_next_application()
                if applied_job:
                    print(f"Applied to job: {applied_job}")
                else:
                    print("Could not apply to job.")
            else:
                print("Job ID not found.")
        elif choice == "3":
            # Undo last application
            undone_job = manager.undo_last_application()
            if undone_job:
                print(f"Undo successful for job: {undone_job}")
            else:
                print("Nothing to undo.")
        elif choice == "4":
            # List jobs sorted by score
            print("Jobs sorted by score:")
            manager.print_sorted_jobs_by_score()
        elif choice == "5":
            # Exit
            print("Exiting. Goodbye!")
            break
        else:
            print("Invalid choice!")

if __name__ == "__main__":
    main()