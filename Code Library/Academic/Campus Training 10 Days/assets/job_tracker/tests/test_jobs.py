"""
test_jobs.py
Basic tests for job tracker components.
"""

import sys
sys.path.append("../")

from job_tracker.job import Job
from job_tracker.job_store import JobStore
from job_tracker.application_queue import ApplicationQueue
from job_tracker.undo_stack import UndoStack
from job_tracker.job_tree import JobTree
from job_tracker.job_manager import JobManager

def test_job_store():
    """
    Tests JobStore functions.
    """
    store = JobStore()
    job1 = Job("1", "SWE", "Google", 100, 90)
    job2 = Job("2", "DevOps", "AWS", 110, 85)
    store.add_job(job1)
    store.add_job(job2)
    assert store.get_job("1") == job1
    assert store.get_job("2") == job2
    store.delete_job("1")
    assert store.get_job("1") is None

def test_application_queue():
    """
    Tests ApplicationQueue functions.
    """
    queue = ApplicationQueue()
    queue.enqueue("1")
    queue.enqueue("2")
    assert queue.peek() == "1"
    assert queue.dequeue() == "1"
    assert queue.dequeue() == "2"
    assert queue.dequeue() is None

def test_undo_stack():
    """
    Tests UndoStack functions.
    """
    stack = UndoStack()
    stack.push("1")
    stack.push("2")
    assert stack.peek() == "2"
    assert stack.pop() == "2"
    assert stack.pop() == "1"
    assert stack.pop() is None

def test_job_tree():
    """
    Tests JobTree sorting by score.
    """
    tree = JobTree()
    job1 = Job("1", "SWE", "Google", 100, 90)
    job2 = Job("2", "DevOps", "AWS", 110, 85)
    job3 = Job("3", "Tester", "Meta", 95, 95)
    tree.insert_job(job1)
    tree.insert_job(job2)
    tree.insert_job(job3)
    sorted_jobs = tree.in_order()
    assert [job.score for job in sorted_jobs] == [85, 90, 95]

def test_job_manager():
    """
    Tests JobManager workflow.
    """
    manager = JobManager()
    job1 = Job("1", "SWE", "Google", 100, 90)
    job2 = Job("2", "DevOps", "AWS", 110, 85)
    manager.add_job(job1)
    manager.add_job(job2)
    manager.enqueue_application("1")
    applied_job = manager.process_next_application()
    assert applied_job.status == "applied"
    undo_job = manager.undo_last_application()
    assert undo_job.status == "open"

if __name__ == "__main__":
    test_job_store()
    test_application_queue()
    test_undo_stack()
    test_job_tree()
    test_job_manager()
    print("All tests passed!")