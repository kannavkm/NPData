class ScientificInterface:
    def __init__(self, db):
        self.db = db
        self.options = [
            '',
            'Book a Service',
            'Cancel a Booking',
            'Provide Feedback',
            'Exit'
        ]
        self.functions = [
            self.discover,
            self.do_a_booking,
            self.cancel_booking,
            self.give_feedback
        ]
        self.curr_opt = 0
