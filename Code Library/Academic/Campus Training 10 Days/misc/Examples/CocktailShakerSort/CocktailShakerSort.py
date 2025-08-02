def cocktail_shaker_sort(arr):
    """
    Cocktail Shaker Sort: Like bubble sort, but passes in both directions.
    Time Complexity: O(n^2)
    Stable: Yes
    """
    n = len(arr)
    swapped = True
    start = 0
    end = n - 1
    while swapped:
        swapped = False
        for i in range(start, end):
            if arr[i] > arr[i + 1]:
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = True
        if not swapped:
            break
        swapped = False
        end -= 1
        for i in range(end - 1, start - 1, -1):
            if arr[i] > arr[i + 1]:
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = True
        start += 1

# Example usage:
# data = [5, 1, 4, 2, 8, 0, 2]
# cocktail_shaker_sort(data)
# print(data)  # [0, 1, 2, 2, 4, 5, 8]