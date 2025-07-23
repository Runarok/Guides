class Question:
    def __init__(self, question_id, text, question_type, difficulty_level):
        self.question_id = question_id
        self.text = text
        self.question_type = question_type  # 'multiple_choice', 'true_false', 'short_answer'
        self.difficulty_level = difficulty_level  # 1-5 (1=easy, 5=hard)
        self.options = []  # For multiple choice questions
        self.correct_answer = None
        self.explanation = ""
        self.points = 1
        self.category = ""
        self.tags = []
        self.created_at = datetime.now()
        self.usage_count = 0
        self.success_rate = 0.0
    
    def add_option(self, option_text, is_correct=False):
        """Add option for multiple choice questions"""
        option = {
            'text': option_text,
            'is_correct': is_correct,
            'option_id': len(self.options)
        }
        self.options.append(option)
        
        if is_correct:
            self.correct_answer = option['option_id']
    
    def check_answer(self, user_answer):
        """Check if user answer is correct"""
        if self.question_type == 'multiple_choice':
            return user_answer == self.correct_answer
        elif self.question_type == 'true_false':
            return user_answer == self.correct_answer
        elif self.question_type == 'short_answer':
            return self.check_short_answer(user_answer)
        return False
    
    def check_short_answer(self, user_answer):
        """Check short answer with some flexibility"""
        if not self.correct_answer:
            return False
        
        user_lower = user_answer.lower().strip()
        correct_lower = self.correct_answer.lower().strip()
        
        # Exact match
        if user_lower == correct_lower:
            return True
        
        # Check for common variations
        similarity = self.calculate_similarity(user_lower, correct_lower)
        return similarity > 0.8  # 80% similarity threshold
    
    def calculate_similarity(self, text1, text2):
        """Calculate text similarity using edit distance"""
        # Simple implementation of normalized edit distance
        if len(text1) == 0:
            return 0 if len(text2) == 0 else 0
        if len(text2) == 0:
            return 0
        
        # Implementation would include full edit distance algorithm
        return 0.9  # Placeholder
    
    def update_statistics(self, was_correct):
        """Update question usage statistics"""
        self.usage_count += 1
        
        # Update success rate using moving average
        if self.usage_count == 1:
            self.success_rate = 1.0 if was_correct else 0.0
        else:
            # Weighted average favoring recent attempts
            weight = 0.1
            self.success_rate = (1 - weight) * self.success_rate + weight * (1.0 if was_correct else 0.0)
    
    def get_difficulty_multiplier(self):
        """Get point multiplier based on difficulty"""
        multipliers = {1: 1.0, 2: 1.2, 3: 1.5, 4: 1.8, 5: 2.0}
        return multipliers.get(self.difficulty_level, 1.0)

class Quiz:
    def __init__(self, quiz_id, title, description, creator_id):
        self.quiz_id = quiz_id
        self.title = title
        self.description = description
        self.creator_id = creator_id
        self.questions = QuestionLinkedList()
        self.time_limit = None  # in minutes
        self.max_attempts = 1
        self.passing_score = 70  # percentage
        self.shuffle_questions = False
        self.shuffle_options = False
        self.is_published = False
        self.created_at = datetime.now()
        self.last_modified = datetime.now()
        self.total_points = 0
        self.category = ""
        self.difficulty_level = "medium"
    
    def add_question(self, question):
        """Add question to quiz"""
        self.questions.append(question)
        self.total_points += question.points * question.get_difficulty_multiplier()
        self.last_modified = datetime.now()
    
    def remove_question(self, question_id):
        """Remove question from quiz"""
        removed_question = self.questions.remove_by_id(question_id)
        if removed_question:
            self.total_points -= removed_question.points * removed_question.get_difficulty_multiplier()
            self.last_modified = datetime.now()
            return True
        return False
    
    def get_questions(self, shuffle=None):
        """Get quiz questions, optionally shuffled"""
        questions = self.questions.to_list()
        
        if shuffle or (shuffle is None and self.shuffle_questions):
            import random
            questions = questions.copy()
            random.shuffle(questions)
        
        return questions
    
    def calculate_score(self, user_answers):
        """Calculate quiz score based on user answers"""
        total_points = 0
        earned_points = 0
        correct_count = 0
        total_count = 0
        
        questions = self.questions.to_list()
        
        for i, question in enumerate(questions):
            total_count += 1
            question_points = question.points * question.get_difficulty_multiplier()
            total_points += question_points
            
            if i < len(user_answers):
                user_answer = user_answers[i]
                if question.check_answer(user_answer):
                    earned_points += question_points
                    correct_count += 1
                    question.update_statistics(True)
                else:
                    question.update_statistics(False)
        
        percentage = (earned_points / total_points * 100) if total_points > 0 else 0
        
        return {
            'earned_points': earned_points,
            'total_points': total_points,
            'percentage': percentage,
            'correct_count': correct_count,
            'total_count': total_count,
            'passed': percentage >= self.passing_score
        }
    
    def generate_certificate_data(self, user_id, score_data):
        """Generate data for completion certificate"""
        return {
            'user_id': user_id,
            'quiz_title': self.title,
            'score_percentage': score_data['percentage'],
            'points_earned': score_data['earned_points'],
            'completion_date': datetime.now(),
            'passed': score_data['passed'],
            'certificate_id': f"CERT_{self.quiz_id}_{user_id}_{int(time.time())}"
        }
    
    def publish(self):
        """Publish quiz for public access"""
        if len(self.questions.to_list()) > 0:
            self.is_published = True
            return True
        return False
    
    def unpublish(self):
        """Unpublish quiz"""
        self.is_published = False
                                

class QuizResult:
    def __init__(self, result_id, user_id, quiz_id, attempt_number):
        self.result_id = result_id
        self.user_id = user_id
        self.quiz_id = quiz_id
        self.attempt_number = attempt_number
        self.start_time = datetime.now()
        self.end_time = None
        self.user_answers = []
        self.score_data = None
        self.time_taken = None
        self.is_completed = False
        self.ip_address = None
        self.user_agent = None
        self.cheating_flags = []
    
    def record_answer(self, question_index, answer, time_spent):
        """Record user answer for a question"""
        answer_data = {
            'question_index': question_index,
            'answer': answer,
            'time_spent': time_spent,
            'timestamp': datetime.now()
        }
        
        # Ensure we have enough slots in the answers list
        while len(self.user_answers) <= question_index:
            self.user_answers.append(None)
        
        self.user_answers[question_index] = answer_data
    
    def complete_quiz(self, quiz):
        """Complete the quiz and calculate final score"""
        self.end_time = datetime.now()
        self.time_taken = (self.end_time - self.start_time).total_seconds()
        
        # Extract just the answers for scoring
        answers_only = []
        for answer_data in self.user_answers:
            if answer_data:
                answers_only.append(answer_data['answer'])
            else:
                answers_only.append(None)
        
        self.score_data = quiz.calculate_score(answers_only)
        self.is_completed = True
        
        # Check for potential cheating indicators
        self.detect_cheating_patterns(quiz)
        
        return self.score_data
    
    def detect_cheating_patterns(self, quiz):
        """Detect potential cheating based on patterns"""
        if not self.time_taken:
            return
        
        questions = quiz.questions.to_list()
        
        # Check if completed too quickly
        min_expected_time = len(questions) * 30  # 30 seconds per question minimum
        if self.time_taken < min_expected_time:
            self.cheating_flags.append("Completed too quickly")
        
        # Check answer patterns
        self.check_answer_patterns()
        
        # Check time spent per question
        self.check_time_distribution()
    
    def check_answer_patterns(self):
        """Check for suspicious answer patterns"""
        if len(self.user_answers) < 4:
            return
        
        # Check for all same answers in multiple choice
        multiple_choice_answers = []
        for answer_data in self.user_answers:
            if answer_data and isinstance(answer_data['answer'], int):
                multiple_choice_answers.append(answer_data['answer'])
        
        if len(multiple_choice_answers) >= 4:
            if len(set(multiple_choice_answers)) == 1:
                self.cheating_flags.append("All identical answers")
    
    def check_time_distribution(self):
        """Check for suspicious time distribution"""
        times = []
        for answer_data in self.user_answers:
            if answer_data:
                times.append(answer_data['time_spent'])
        
        if times:
            avg_time = sum(times) / len(times)
            very_quick = [t for t in times if t < avg_time * 0.2]
            
            if len(very_quick) > len(times) * 0.5:
                self.cheating_flags.append("Inconsistent time distribution")
    
    def get_detailed_results(self, quiz):
        """Get detailed results with question-by-question breakdown"""
        if not self.is_completed:
            return None
        
        questions = quiz.questions.to_list()
        detailed_results = []
        
        for i, question in enumerate(questions):
            answer_data = self.user_answers[i] if i < len(self.user_answers) else None
            user_answer = answer_data['answer'] if answer_data else None
            
            result = {
                'question_id': question.question_id,
                'question_text': question.text,
                'user_answer': user_answer,
                'correct_answer': question.correct_answer,
                'is_correct': question.check_answer(user_answer) if user_answer is not None else False,
                'points_earned': question.points * question.get_difficulty_multiplier() if question.check_answer(user_answer) else 0,
                'time_spent': answer_data['time_spent'] if answer_data else 0,
                'explanation': question.explanation
            }
            detailed_results.append(result)
        
        return detailed_results
                                

class QuestionNode:
    def __init__(self, question):
        self.question = question
        self.next = None
        self.prev = None

class QuestionLinkedList:
    def __init__(self):
        self.head = None
        self.tail = None
        self.size = 0
        self.current_position = 0
    
    def append(self, question):
        """Add question to end of list"""
        new_node = QuestionNode(question)
        
        if not self.head:
            self.head = self.tail = new_node
        else:
            new_node.prev = self.tail
            self.tail.next = new_node
            self.tail = new_node
        
        self.size += 1
    
    def prepend(self, question):
        """Add question to beginning of list"""
        new_node = QuestionNode(question)
        
        if not self.head:
            self.head = self.tail = new_node
        else:
            new_node.next = self.head
            self.head.prev = new_node
            self.head = new_node
        
        self.size += 1
    
    def insert_at_position(self, position, question):
        """Insert question at specific position"""
        if position <= 0:
            self.prepend(question)
            return
        
        if position >= self.size:
            self.append(question)
            return
        
        new_node = QuestionNode(question)
        current = self.head
        
        for _ in range(position):
            current = current.next
        
        new_node.next = current
        new_node.prev = current.prev
        current.prev.next = new_node
        current.prev = new_node
        
        self.size += 1
    
    def remove_by_id(self, question_id):
        """Remove question by ID"""
        current = self.head
        
        while current:
            if current.question.question_id == question_id:
                # Update links
                if current.prev:
                    current.prev.next = current.next
                else:
                    self.head = current.next
                
                if current.next:
                    current.next.prev = current.prev
                else:
                    self.tail = current.prev
                
                self.size -= 1
                return current.question
            
            current = current.next
        
        return None
    
    def get_question_at_position(self, position):
        """Get question at specific position"""
        if position < 0 or position >= self.size:
            return None
        
        current = self.head
        for _ in range(position):
            current = current.next
        
        return current.question
    
    def move_question(self, from_position, to_position):
        """Move question from one position to another"""
        if (from_position < 0 or from_position >= self.size or
            to_position < 0 or to_position >= self.size):
            return False
        
        if from_position == to_position:
            return True
        
        # Get the question to move
        question = self.get_question_at_position(from_position)
        if not question:
            return False
        
        # Remove from current position
        self.remove_by_id(question.question_id)
        
        # Insert at new position
        self.insert_at_position(to_position, question)
        
        return True
    
    def to_list(self):
        """Convert linked list to Python list"""
        result = []
        current = self.head
        
        while current:
            result.append(current.question)
            current = current.next
        
        return result
    
    def shuffle(self):
        """Shuffle questions randomly"""
        import random
        questions = self.to_list()
        random.shuffle(questions)
        
        # Rebuild the linked list with shuffled order
        self.clear()
        for question in questions:
            self.append(question)
    
    def clear(self):
        """Clear all questions"""
        self.head = self.tail = None
        self.size = 0
        self.current_position = 0
                                

class UserScoreHashMap:
    def __init__(self, initial_capacity=64):
        self.capacity = initial_capacity
        self.size = 0
        self.buckets = [[] for _ in range(self.capacity)]
        self.load_factor_threshold = 0.75
    
    def _hash(self, key):
        """Hash function for user-quiz combinations"""
        return hash(key) % self.capacity
    
    def _make_key(self, user_id, quiz_id):
        """Create composite key for user-quiz combination"""
        return f"{user_id}_{quiz_id}"
    
    def store_score(self, user_id, quiz_id, score_data):
        """Store user score for a quiz"""
        key = self._make_key(user_id, quiz_id)
        
        if self.size >= self.capacity * self.load_factor_threshold:
            self._resize()
        
        index = self._hash(key)
        bucket = self.buckets[index]
        
        # Check if score already exists (update)
        for i, (stored_key, value) in enumerate(bucket):
            if stored_key == key:
                bucket[i] = (key, score_data)
                return
        
        # Add new score
        bucket.append((key, score_data))
        self.size += 1
    
    def get_score(self, user_id, quiz_id):
        """Get user score for a specific quiz"""
        key = self._make_key(user_id, quiz_id)
        index = self._hash(key)
        bucket = self.buckets[index]
        
        for stored_key, value in bucket:
            if stored_key == key:
                return value
        return None
    
    def get_user_scores(self, user_id):
        """Get all scores for a specific user"""
        user_scores = []
        user_prefix = f"{user_id}_"
        
        for bucket in self.buckets:
            for key, value in bucket:
                if key.startswith(user_prefix):
                    quiz_id = key[len(user_prefix):]
                    user_scores.append({
                        'quiz_id': quiz_id,
                        'score_data': value
                    })
        
        return user_scores
    
    def get_quiz_scores(self, quiz_id):
        """Get all scores for a specific quiz"""
        quiz_scores = []
        quiz_suffix = f"_{quiz_id}"
        
        for bucket in self.buckets:
            for key, value in bucket:
                if key.endswith(quiz_suffix):
                    user_id = key[:-len(quiz_suffix)]
                    quiz_scores.append({
                        'user_id': user_id,
                        'score_data': value
                    })
        
        return quiz_scores
    
    def get_top_scores(self, quiz_id, limit=10):
        """Get top scores for a quiz"""
        quiz_scores = self.get_quiz_scores(quiz_id)
        
        # Sort by percentage score (descending)
        sorted_scores = sorted(
            quiz_scores,
            key=lambda x: x['score_data']['percentage'],
            reverse=True
        )
        
        return sorted_scores[:limit]
    
    def calculate_user_statistics(self, user_id):
        """Calculate statistics for a user across all quizzes"""
        user_scores = self.get_user_scores(user_id)
        
        if not user_scores:
            return {'total_quizzes': 0, 'average_score': 0, 'best_score': 0}
        
        percentages = [score['score_data']['percentage'] for score in user_scores]
        
        return {
            'total_quizzes': len(user_scores),
            'average_score': sum(percentages) / len(percentages),
            'best_score': max(percentages),
            'worst_score': min(percentages),
            'quizzes_passed': len([s for s in user_scores if s['score_data']['passed']])
        }
    
    def _resize(self):
        """Resize hash map when load factor exceeds threshold"""
        old_buckets = self.buckets
        self.capacity *= 2
        self.size = 0
        self.buckets = [[] for _ in range(self.capacity)]
        
        for bucket in old_buckets:
            for key, value in bucket:
                # Re-hash with new capacity
                index = self._hash(key)
                self.buckets[index].append((key, value))
                self.size += 1

from collections import deque
import time

class ExamFlowQueue:
    def __init__(self):
        self.waiting_queue = deque()  # Users waiting to start
        self.active_exams = {}  # Currently taking exams
        self.completed_exams = []  # Finished exams
        self.exam_sessions = {}  # Session management
        self.max_concurrent_exams = 100
    
    def enqueue_user(self, user_id, quiz_id, priority=0):
        """Add user to exam waiting queue"""
        exam_request = {
            'user_id': user_id,
            'quiz_id': quiz_id,
            'priority': priority,
            'enqueue_time': datetime.now(),
            'estimated_start_time': self.calculate_estimated_start_time()
        }
        
        self.waiting_queue.append(exam_request)
        return exam_request
    
    def start_next_exam(self):
        """Start exam for next user in queue"""
        if (len(self.active_exams) >= self.max_concurrent_exams or 
            not self.waiting_queue):
            return None
        
        exam_request = self.waiting_queue.popleft()
        session_id = self.create_exam_session(exam_request)
        
        if session_id:
            self.active_exams[session_id] = {
                'user_id': exam_request['user_id'],
                'quiz_id': exam_request['quiz_id'],
                'start_time': datetime.now(),
                'current_question': 0,
                'answers': []
            }
            
            return session_id
        
        return None
    
    def create_exam_session(self, exam_request):
        """Create new exam session"""
        session_id = f"session_{exam_request['user_id']}_{int(time.time())}"
        
        session_data = {
            'session_id': session_id,
            'user_id': exam_request['user_id'],
            'quiz_id': exam_request['quiz_id'],
            'created_at': datetime.now(),
            'expires_at': datetime.now() + timedelta(hours=2),  # 2-hour session
            'is_active': True
        }
        
        self.exam_sessions[session_id] = session_data
        return session_id
    
    def submit_answer(self, session_id, question_index, answer):
        """Submit answer for current question"""
        if session_id in self.active_exams:
            exam_data = self.active_exams[session_id]
            
            # Ensure answers list is long enough
            while len(exam_data['answers']) <= question_index:
                exam_data['answers'].append(None)
            
            exam_data['answers'][question_index] = {
                'answer': answer,
                'timestamp': datetime.now()
            }
            
            exam_data['current_question'] = question_index + 1
            return True
        
        return False
    
    def complete_exam(self, session_id, final_score=None):
        """Complete exam and move to completed queue"""
        if session_id in self.active_exams:
            exam_data = self.active_exams[session_id]
            exam_data['end_time'] = datetime.now()
            exam_data['final_score'] = final_score
            
            # Move to completed exams
            self.completed_exams.append(exam_data)
            del self.active_exams[session_id]
            
            # Mark session as inactive
            if session_id in self.exam_sessions:
                self.exam_sessions[session_id]['is_active'] = False
            
            return True
        
        return False
    
    def get_queue_status(self):
        """Get current queue status"""
        return {
            'waiting_count': len(self.waiting_queue),
            'active_exams': len(self.active_exams),
            'completed_today': len([e for e in self.completed_exams 
                                  if e['end_time'].date() == datetime.now().date()]),
            'capacity_utilization': len(self.active_exams) / self.max_concurrent_exams
        }
    
    def calculate_estimated_start_time(self):
        """Calculate estimated start time for queued users"""
        if not self.waiting_queue:
            return datetime.now()
        
        # Assume average exam time of 45 minutes
        avg_exam_time = 45  # minutes
        
        # Calculate how many users are ahead
        available_slots = max(0, self.max_concurrent_exams - len(self.active_exams))
        queue_position = len(self.waiting_queue)
        
        if available_slots > 0:
            estimated_minutes = 0
        else:
            estimated_minutes = (queue_position / self.max_concurrent_exams) * avg_exam_time
        
        return datetime.now() + timedelta(minutes=estimated_minutes)
    
    def cleanup_expired_sessions(self):
        """Remove expired exam sessions"""
        current_time = datetime.now()
        expired_sessions = []
        
        for session_id, session_data in self.exam_sessions.items():
            if current_time > session_data['expires_at']:
                expired_sessions.append(session_id)
        
        for session_id in expired_sessions:
            # Complete any active exams
            if session_id in self.active_exams:
                self.complete_exam(session_id)
            
            del self.exam_sessions[session_id]
                                

def calculate_weighted_score(answers, questions, scoring_method='standard'):
    """
    Calculate quiz score using various scoring methods
    Time Complexity: O(n) where n is number of questions
    """
    if scoring_method == 'standard':
        return calculate_standard_score(answers, questions)
    elif scoring_method == 'weighted_difficulty':
        return calculate_difficulty_weighted_score(answers, questions)
    elif scoring_method == 'negative_marking':
        return calculate_negative_marking_score(answers, questions)
    elif scoring_method == 'adaptive':
        return calculate_adaptive_score(answers, questions)

def calculate_standard_score(answers, questions):
    """Standard scoring: 1 point per correct answer"""
    correct_count = 0
    total_count = len(questions)
    
    for i, question in enumerate(questions):
        if i < len(answers) and answers[i] is not None:
            if question.check_answer(answers[i]):
                correct_count += 1
    
    percentage = (correct_count / total_count * 100) if total_count > 0 else 0
    
    return {
        'correct_count': correct_count,
        'total_count': total_count,
        'percentage': percentage,
        'total_points': correct_count,
        'max_points': total_count,
        'scoring_method': 'standard'
    }

def calculate_difficulty_weighted_score(answers, questions):
    """Difficulty-weighted scoring: harder questions worth more points"""
    earned_points = 0
    max_points = 0
    correct_count = 0
    
    for i, question in enumerate(questions):
        question_points = question.points * question.get_difficulty_multiplier()
        max_points += question_points
        
        if i < len(answers) and answers[i] is not None:
            if question.check_answer(answers[i]):
                earned_points += question_points
                correct_count += 1
    
    percentage = (earned_points / max_points * 100) if max_points > 0 else 0
    
    return {
        'correct_count': correct_count,
        'total_count': len(questions),
        'percentage': percentage,
        'total_points': earned_points,
        'max_points': max_points,
        'scoring_method': 'weighted_difficulty'
    }

def calculate_negative_marking_score(answers, questions, penalty_factor=0.25):
    """Negative marking: deduct points for wrong answers"""
    earned_points = 0
    max_points = 0
    correct_count = 0
    incorrect_count = 0
    
    for i, question in enumerate(questions):
        question_points = question.points * question.get_difficulty_multiplier()
        max_points += question_points
        
        if i < len(answers) and answers[i] is not None:
            if question.check_answer(answers[i]):
                earned_points += question_points
                correct_count += 1
            else:
                # Negative marking
                earned_points -= question_points * penalty_factor
                incorrect_count += 1
    
    # Ensure score doesn't go below 0
    earned_points = max(0, earned_points)
    percentage = (earned_points / max_points * 100) if max_points > 0 else 0
    
    return {
        'correct_count': correct_count,
        'incorrect_count': incorrect_count,
        'total_count': len(questions),
        'percentage': percentage,
        'total_points': earned_points,
        'max_points': max_points,
        'penalty_applied': incorrect_count * penalty_factor,
        'scoring_method': 'negative_marking'
    }

def calculate_adaptive_score(answers, questions):
    """Adaptive scoring: adjust points based on question performance"""
    earned_points = 0
    max_points = 0
    correct_count = 0
    
    for i, question in enumerate(questions):
        # Base points adjusted by question difficulty and success rate
        base_points = question.points
        difficulty_multiplier = question.get_difficulty_multiplier()
        
        # Questions with lower success rates are worth more
        success_rate_multiplier = 2.0 - question.success_rate  # Range: 1.0 to 2.0
        
        question_points = base_points * difficulty_multiplier * success_rate_multiplier
        max_points += question_points
        
        if i < len(answers) and answers[i] is not None:
            if question.check_answer(answers[i]):
                earned_points += question_points
                correct_count += 1
    
    percentage = (earned_points / max_points * 100) if max_points > 0 else 0
    
    return {
        'correct_count': correct_count,
        'total_count': len(questions),
        'percentage': percentage,
        'total_points': earned_points,
        'max_points': max_points,
        'scoring_method': 'adaptive'
    }
                                

import random

def generate_random_quiz(question_pool, num_questions, difficulty_distribution=None):
    """
    Generate random quiz from question pool with difficulty distribution
    Time Complexity: O(n log n) where n is pool size
    """
    if difficulty_distribution is None:
        difficulty_distribution = {1: 0.1, 2: 0.2, 3: 0.4, 4: 0.2, 5: 0.1}
    
    # Group questions by difficulty
    questions_by_difficulty = {}
    for question in question_pool:
        difficulty = question.difficulty_level
        if difficulty not in questions_by_difficulty:
            questions_by_difficulty[difficulty] = []
        questions_by_difficulty[difficulty].append(question)
    
    selected_questions = []
    
    for difficulty, proportion in difficulty_distribution.items():
        if difficulty in questions_by_difficulty:
            questions_needed = int(num_questions * proportion)
            available_questions = questions_by_difficulty[difficulty]
            
            if len(available_questions) >= questions_needed:
                selected = random.sample(available_questions, questions_needed)
            else:
                selected = available_questions.copy()
            
            selected_questions.extend(selected)
    
    # Fill remaining slots if needed
    while len(selected_questions) < num_questions:
        remaining_questions = [q for q in question_pool if q not in selected_questions]
        if not remaining_questions:
            break
        selected_questions.append(random.choice(remaining_questions))
    
    # Shuffle the final selection
    random.shuffle(selected_questions)
    return selected_questions[:num_questions]

def generate_adaptive_quiz(question_pool, user_performance_history, target_difficulty=3):
    """
    Generate personalized quiz based on user's past performance
    Time Complexity: O(n) where n is question pool size
    """
    user_weak_topics = analyze_user_weaknesses(user_performance_history)
    user_avg_performance = calculate_average_performance(user_performance_history)
    
    # Adjust target difficulty based on user performance
    if user_avg_performance > 80:
        target_difficulty = min(5, target_difficulty + 1)
    elif user_avg_performance < 60:
        target_difficulty = max(1, target_difficulty - 1)
    
    # Score questions based on relevance to user
    scored_questions = []
    
    for question in question_pool:
        score = 0
        
        # Prefer questions in user's weak topics
        if question.category in user_weak_topics:
            score += 3
        
        # Prefer questions near target difficulty
        difficulty_diff = abs(question.difficulty_level - target_difficulty)
        score += (5 - difficulty_diff)
        
        # Prefer questions user hasn't seen recently
        if not recently_answered(question, user_performance_history):
            score += 2
        
        # Prefer questions with appropriate success rate
        if 0.3 <= question.success_rate <= 0.7:  # Challenging but fair
            score += 1
        
        scored_questions.append((question, score))
    
    # Sort by score and select top questions
    scored_questions.sort(key=lambda x: x[1], reverse=True)
    
    # Take top 50% and randomly select from them for variety
    top_half = scored_questions[:len(scored_questions)//2]
    selected_questions = [q[0] for q in random.sample(top_half, min(20, len(top_half)))]
    
    return selected_questions

def shuffle_question_options(questions):
    """
    Shuffle options for multiple choice questions
    Time Complexity: O(n * m) where n = questions, m = avg options per question
    """
    shuffled_questions = []
    
    for question in questions:
        if question.question_type == 'multiple_choice' and question.options:
            # Create a copy of the question
            new_question = copy.deepcopy(question)
            
            # Create mapping of old to new positions
            original_options = new_question.options.copy()
            random.shuffle(new_question.options)
            
            # Update correct answer index
            for new_index, option in enumerate(new_question.options):
                if option['is_correct']:
                    new_question.correct_answer = new_index
                    break
            
            shuffled_questions.append(new_question)
        else:
            shuffled_questions.append(question)
    
    return shuffled_questions

def analyze_user_weaknesses(performance_history):
    """Analyze user performance to identify weak topics"""
    topic_performance = {}
    
    for result in performance_history:
        for question_result in result.get('question_results', []):
            topic = question_result.get('category', 'general')
            
            if topic not in topic_performance:
                topic_performance[topic] = {'correct': 0, 'total': 0}
            
            topic_performance[topic]['total'] += 1
            if question_result.get('is_correct', False):
                topic_performance[topic]['correct'] += 1
    
    # Find topics with performance below 70%
    weak_topics = []
    for topic, stats in topic_performance.items():
        if stats['total'] > 0:
            performance = stats['correct'] / stats['total']
            if performance < 0.7:
                weak_topics.append(topic)
    
    return weak_topics
