from html import escape

def get_symbol(code):
    """Return printable symbol or label for ASCII code."""
    if code == 32:
        return "(space)"
    elif code == 127:
        return "DEL"
    elif code < 32:
        return f"CTRL-{code}"
    else:
        try:
            return escape(chr(code))
        except:
            return ""

def generate_ascii_table_html(pairs_per_row=3):
    """
    Generate an HTML table with ASCII codes 0-255.
    Each row contains 'pairs_per_row' pairs of Code + Symbol.
    """
    # Header columns: twice pairs_per_row (code + symbol)
    headers = "".join([f"<th>Code</th><th>Symbol</th>" for _ in range(pairs_per_row)])
    
    rows = []
    for start_code in range(0, 256, pairs_per_row):
        row_cells = []
        for offset in range(pairs_per_row):
            code = start_code + offset
            if code < 256:
                symbol = get_symbol(code)
                row_cells.append(f"<td>{code}</td><td>{symbol}</td>")
            else:
                # Fill empty cells if we exceed 255
                row_cells.append("<td></td><td></td>")
        row_html = "<tr>" + "".join(row_cells) + "</tr>"
        rows.append(row_html)

    table_html = f"<table>\n<tr>{headers}</tr>\n"
    table_html += "\n".join(rows)
    table_html += "\n</table>"
    return table_html


# Example usage:

# Uncomment the one you want!

# 1 pair per row (2 columns)
# print(generate_ascii_table_html(1))

# 2 pairs per row (4 columns)
# print(generate_ascii_table_html(2))

# 3 pairs per row (6 columns)
# print(generate_ascii_table_html(3))

# 4 pairs per row (8 columns)
# print(generate_ascii_table_html(4))
