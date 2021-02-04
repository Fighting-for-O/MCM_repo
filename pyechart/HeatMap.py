import random

from pyecharts import options as opts
from pyecharts.charts import HeatMap
from pyecharts.faker import Faker

# value = [[i, j, random.randint(0, 50)] for i in range(24) for j in range(7)]
value = [[0, 0, 1], [0, 1, 2], [1, 0, 3], [1, 1, 200]]
print(value)
c = (
    HeatMap()
        .add_xaxis(Faker.clock)
        .add_yaxis(
        "series0",
        Faker.week,
        value,
        label_opts=opts.LabelOpts(is_show=True, position="inside"),
    )
        .set_global_opts(
        title_opts=opts.TitleOpts(title="HeatMap-Label 显示"),
        visualmap_opts=opts.VisualMapOpts(),
    )
        .render("heatmap_with_label_show.html")
)
