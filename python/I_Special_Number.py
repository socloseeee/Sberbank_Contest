"""
Ввод:
Адрес 5467\456. Номер 405\549
Вывод:
5467\00456
0405\00549
"""
import re


def good_number(s: str) -> None:

    # Поиск выражения формат "число/число"
    pattern: str = r"\d+\\\d+"
    matches = re.findall(pattern, s)

    # Вывод найденных совпадений и приведение их к хорошим номерам
    for match in matches:
        first, second = match.split("\\")
        first = first.zfill(4)
        second = second.zfill(5)
        print(first + '\\' + second)


string = input()
good_number(string)
