from pyecharts.charts import Liquid
from pyecharts import options as opts

data = [0.9]
liquid = Liquid()

liquid.add('Liquid', data,
           is_outline_show=True,  # 是否显示外边框(默认为False)
           is_animation=True,  # 是否显示动画效果(默认为True)
           shape='rect'  # 边框形状

           )
liquid.set_global_opts(
    title_opts=opts.TitleOpts(
        title='Liquid-基本示例'
    )
)

liquid.render('liquid_test.html')
