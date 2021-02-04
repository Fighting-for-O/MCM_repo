from pyecharts.charts import Line
from pyecharts import options as opts
from pyecharts.globals import ThemeType, SymbolType
from pyecharts.faker import Faker

line = Line()

line.add_xaxis(Faker.choose())
line.add_yaxis(
    '商家A', Faker.values(), is_smooth=False,
    areastyle_opts=opts.AreaStyleOpts(
        opacity=1,  # 不透明度
        # color = '#000'  #面积区域填充纯色
        color={
            'type': 'linear',
            'x': 0,
            'y': 0,
            'x2': 0,
            'y2': 1,
            'colorStops': [
                {'offset': 0, 'color': 'red'},
                {'offset': 1, 'color': 'blue'},
            ]
        }  # 面积区域填充渐变纹理
    )
)
line.add_yaxis(
    '商家A', Faker.values(), is_smooth=True,
    areastyle_opts=opts.AreaStyleOpts(
        opacity=1,  # 不透明度
        # color = '#000'  #面积区域填充纯色
        color={
            'type': 'linear',
            'x': 0,
            'y': 0,
            'x2': 0,
            'y2': 1,
            'colorStops': [
                {'offset': 0, 'color': 'green'},
                {'offset': 1, 'color': 'blue'},
            ]
        }  # 面积区域填充渐变纹理
    )
)
line.set_global_opts(
    title_opts=opts.TitleOpts(title='Line-基本示例')
)

line.render('linearea_test.html')
line.render_notebook()
