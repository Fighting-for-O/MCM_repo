from pyecharts.charts import Bar
from pyecharts import options as opts
from pyecharts.render import make_snapshot
from snapshot_selenium import snapshot
from pyecharts.globals import ThemeType, SymbolType
from pyecharts.faker import Faker

bar = Bar(
    init_opts=opts.InitOpts(theme=ThemeType.DARK,
                            width='768px',
                            height='432px'
                            )
)
# 创建柱状图对象
# init_opts: 初始化图表属性，不写则全部为默认值
# theme：切换图表主题颜色，可不写


xlst = ['衬衫', '毛衣', '领带', '裤子', '风衣', '高跟鞋', '袜子']
# x轴数据（必须为list）
ylst = [92, 134, 141, 96, 54, 59, 117]
# y轴数据（必须为list）


bar.add_xaxis(xlst)
# 添加数据到x轴
bar.add_yaxis('商家A', ylst, stack='stack1')
bar.add_yaxis('商家B', Faker.values(), stack='stack1')
# 添加数据到y轴，参数1为图例名
# stack:数据堆叠在stack1


# 全局设置
bar.set_global_opts(
    title_opts=opts.TitleOpts(title='我是主标题', subtitle='我是副标题', pos_left='200'),
    # pos_left控制标题距离容器左侧的距离，简直吃屎
    # pos_right

    # 设置图表标题
    xaxis_opts=opts.AxisOpts(axislabel_opts=opts.LabelOpts(rotate=0)),
    # 设置x轴标签文字旋转角度（-90~90间）
    # datazoom_opts=[opts.DataZoomOpts()]
    # # 添加窗口滑块/滚动条效果（默认在底部）
)

# 设置标记点/标记线
bar.set_series_opts(
    label_opts=opts.LabelOpts(is_show=True),  # 是否显示数字

    markpoint_opts=opts.MarkPointOpts(  # 标记点
        data=[
            opts.MarkPointItem(type_='max', name='最大值'),  # 标记出最大值
            opts.MarkPointItem(type_='min', name='最小值'),  # 标记出最小值
            opts.MarkPointItem(type_='average', name='平均值')  # 标记出平均值 → 存在疑问，更像是中位数
        ])
)

# bar.reversal_axis()
# x、y轴互换

bar.render('bar_test.html')
# # 定义输出路径，不填路径则默认为render.html
# bar.render_notebook()
# # 直接输出图表在notebook

# 生成图片格式
# make_snapshot(snapshot,bar.render(),'sdf.png')
