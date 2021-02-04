from pyecharts import options as opts
from pyecharts.charts import Pie
from pyecharts.faker import Faker
from pyecharts.globals import ThemeType, SymbolType

v = Faker.choose()
c = (
    Pie(init_opts=opts.InitOpts(theme=ThemeType.LIGHT,
                                width='768px',
                                height='432px'
                                ),
        ).
        add(
        "",
        [list(z) for z in zip(v, Faker.values())],
        radius=["30%", "75%"],
        center=["25%", "50%"],
        rosetype="radius",
        label_opts=opts.LabelOpts(is_show=False, position='right'),
    )
        .set_global_opts(title_opts=opts.TitleOpts(title="Pie-玫瑰图示例"),

                         legend_opts=opts.LegendOpts(pos_right='center',orient='vertical'))
        .render("pie_rosetype.html")
)
