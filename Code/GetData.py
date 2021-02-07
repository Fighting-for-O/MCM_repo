import pandas as pd
import numpy as np

dataDecom = {
    'species': [

    ],
    '10 °C': [],
    '16 °C': [],
    '22 °C': [],
    'geometric mean': []

}
dataEx = {
    'species': [

    ],
    '10 °C': [],
    '16 °C': [],
    '22 °C': [],


}


def findLab(items):
    ans = []

    for i in range(len(items)):
        if items[i] == '@':
            ans.append(i)

    return ans


if __name__ == '__main__':
    with open('Decompostion.txt', 'r')as f:
        lines = f.readlines()
        for lines in lines:
            items = lines.split()
            print(items)
            loc = findLab(items)
            print(loc)
            dataDecom['species'].append(' '.join(items[0:loc[0] - 1]))
            dataDecom['10 °C'].append(float(items[loc[0] - 1]))
            dataDecom['16 °C'].append(float(items[loc[1] - 1]))
            dataDecom['22 °C'].append(float(items[loc[2] - 1]))
            dataDecom['geometric mean'].append(float(items[-1]))

        print(dataDecom)

        deData = pd.DataFrame(dataDecom)
        deData.to_excel('deData.xlsx')

    with open('ExtensionRate.txt', 'r',encoding='utf-8')as f:
        lines = f.readlines()
        for lines in lines:
            items = lines.split()
            print(items)
            loc = findLab(items)
            print(loc)
            dataEx['species'].append(' '.join(items[0:loc[0] - 1]))
            dataEx['10 °C'].append(float(items[loc[0] - 1]))
            dataEx['16 °C'].append(float(items[loc[1] - 1]))
            dataEx['22 °C'].append(float(items[loc[2] - 1]))

        # print(dataEx)
        # print(len(dataEx['species']))
        # print(len(dataEx['10 °C']))
        # print(len(dataEx['16 °C']))
        # print(len(dataEx['22 °C']))
        exData = pd.DataFrame(dataEx)
        exData.to_excel('exData.xlsx')


