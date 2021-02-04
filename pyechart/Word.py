# 引入 word2vec
from gensim.models import word2vec

# 引入日志配置
import logging

logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)

# 引入数据集
# raw_sentences = ["the quick brown fox jumps over the lazy dogs", "yoyoyo you go home now to sleep"]

# 切分词汇
sentences = word2vec.LineSentence('test.txt')

# 构建模型
model = word2vec.Word2Vec(sentences=sentences,  size=20,window=5, min_count=1, workers=4)

# 进行相关性比较
# print(model.similarity('dogs', 'you'))
# print(model.vocabulary.)
print(model.wv['over'])




