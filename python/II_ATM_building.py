"""
На вход подаются натуральные числа n и k, а также n расстояний L,
где – расстояние между банкоматами i и  i+1. Напишите функцию,
которая добавляет k банкоматов таким образом,
чтобы максимальное расстояние между соседними банкоматами являлось минимально возможным,
и возвращает список новых расстояний между банкоматами.

Ввод:       Вывод:
5 3         50
100         50
180         90
50          90
60          50
150         60
            75
            75
Ввод:       Вывод:
15 10       50
100         50
180         90
50          90
60          50
150         30
100         30
180         75
50          75
60          50
150         50
100         90
180         90
50          50
60          60
150         75
            75
            50
            50
            90
            90
            50
            60
            75
            75
"""


def add_new_ATM(n: int, k: int, distances: list[int]) -> list:
    # Сортируем расстояния банкоматов и сохраняем k индексов в отсортированном порядке
    indexes = sorted(sorted(range(n), key=lambda x: distances[x], reverse=True)[:k])

    insert_count = 0
    for index in indexes:
        correct_index = index + insert_count
        distances[correct_index] = distances[correct_index] // 2
        distances.insert(correct_index, distances[correct_index])
        insert_count += 1

    return distances


n, k = list(map(int, input().split()))
dist = [int(input()) for _ in range(n)]  # L - расстояния между соседними банкоматами (i, i + 1...)

print(*add_new_ATM(n, k, dist), sep='\n')
