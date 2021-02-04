import numpy as np
import pandas as pd
import time
import gc


def newpreprocessing(data: pd.DataFrame, time: str):
    '''

    :param data:
    :return:
    '''
    data.sort_values(by='stime', inplace=True)
    data = data[data['date'] == time]


def preprocessing(data: pd.DataFrame, limit: int, date: str):
    '''

    :param data:数据源
    :param limit:需要截取的数据的数量
    :return: 处理过的数据
    '''

    data.sort_values(by='stime', inplace=True)
    data = data[data['date'] == date]
    new_data = data[['mac', 'location_x', 'location_y']]

    groupbyNew = new_data.groupby(['mac']).filter(lambda x: len(x) >= limit)
    macSet = list(set(groupbyNew['mac'].values))
    ans = pd.DataFrame(
        columns=['mac'] + ['loc_x' + str(i) for i in range(limit)] + ['loc_y' + str(i) for i in range(limit)])
    s = time.time()

    print(len(macSet))
    for idx, mac in enumerate(macSet):
        t = new_data[new_data['mac'] == mac]
        t = t[:limit]
        t.reset_index(drop=True, inplace=True)
        t['xlabel'] = (t.index)
        t['xlabel'] = t['xlabel'].astype('str')
        t['xlabel'] = t['xlabel'].apply(lambda x: 'loc_x' + x)
        t['ylabel'] = (t.index)
        t['ylabel'] = t['ylabel'].astype('str')
        t['ylabel'] = t['ylabel'].apply(lambda x: 'loc_y' + x)

        txt = t.set_index(['mac', 'xlabel'])
        tyt = t.set_index(['mac', 'ylabel'])

        tx = txt['location_x'].unstack()
        ty = tyt['location_y'].unstack()

        finalt = pd.concat([tx, ty], axis=1)
        ans = pd.concat([ans, finalt], axis=0)
        del txt, tyt, tx, ty
        gc.collect()

        e1 = time.time()
        t_step = (e1 - s) / (idx + 1)
        t_est = t_step * (len(macSet) - idx - 1)
        h = t_est // 3600
        m = (t_est - 3600 * h) // 60
        sec = t_est - h * 3600 - m * 60
        print("{0}/{1},{2}:{3}:{4}".format(idx + 1, len(macSet), h, m, format(sec, '.2f')), end='\r')

    ans['mac']=ans.index
    ans.reset_index(drop=True, inplace=True)
    return ans


def mean_w2v_(x, model, size=100):
    try:
        i = 0
        for word in x.spilt(' '):
            if word in model.wv.vocab:
                i += 1
                if i == 1:
                    vec = np.zeros(size)
                else:
                    vec += model.wv[word]

        return vec / i
    except:

        return np.zeros(size)


import pandas as pd
from collections import Counter


def get_mean_w2v(df_data: pd.DataFrame, columns, model, size):
    data_array = []
    for index, row in df_data.iterrows():
        w2v = mean_w2v_(row[columns], model, size)
        data_array.append(w2v)
    return pd.DataFrame(data_array)


embeeding = get_mean_w2v()
