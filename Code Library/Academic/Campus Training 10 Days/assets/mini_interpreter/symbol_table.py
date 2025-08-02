# symbol_table.py
# Implements a HashMap for variable storage and lookup.

class SymbolTable:
    """
    SymbolTable stores variables and their values.
    Uses a Python dictionary internally (no built-in sum/add for logic).
    """
    def __init__(self):
        self.data = {}

    def set(self, name, value):
        """
        Sets the variable 'name' to the given 'value'.
        """
        self.data[name] = value

    def get(self, name):
        """
        Gets the value of variable 'name'.
        Raises KeyError if the variable is not defined.
        """
        if name in self.data:
            return self.data[name]
        raise KeyError(f"Variable '{name}' not defined.")

    def __contains__(self, name):
        """
        Checks if the variable 'name' exists in the symbol table.
        """
        return name in self.data