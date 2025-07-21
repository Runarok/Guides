# symbol_table.py - HashMap for variable storage

class SymbolTable:
    def __init__(self):
        self.data = {}

    def set(self, name, value):
        self.data[name] = value

    def get(self, name):
        if name in self.data:
            return self.data[name]
        raise KeyError(f"Variable '{name}' not defined.")

    def __contains__(self, name):
        return name in self.data