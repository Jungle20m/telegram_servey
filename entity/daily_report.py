

class Row():
    TYPE = {
        "1": {
            "align": "center",
            "border": 1,
            "font_name" : "Times New Roman",
            "font_size": 10,
            "valign": "vcenter",
            "text_wrap" : 1
        },
        "2": {
            "align": "center",
            "border": 1,
            "font_name" : "Times New Roman",
            "font_size": 10,
            "fg_color": "ffdf61",
            "valign": "vcenter"  
        }
    }
    BASIC_TYPE = "1"
    TOTAL_TYPE = "2" 
    
    def __init__(self, department="", name="", sum_of_empl="", early_minute="", 
                 reward="", penalty="", average_penalty="", note="", type_row=""):
        self.department = department
        self.name = name
        self.sum_of_empl = sum_of_empl
        self.early_minute = early_minute
        self.reward = reward
        self.penalty = penalty
        self.reward = reward
        self.average_penalty =average_penalty
        self.note = note
        self.type_row = type_row
        
    def to_dict(self):
        return {
                "department": self.department,
                "name": self.name,
                "sum_of_empl": self.sum_of_empl,
                "checkin": self.checkin,
                "early_minute": self.early_minute,
                "lately_minute": self.lately_minute,
                "reward": self.reward,
                "penalty": self.penalty,
                "average_penalty": self.average_penalty,
                "note": self.note,
                "type_row": self.TYPE[self.type_row]
                }