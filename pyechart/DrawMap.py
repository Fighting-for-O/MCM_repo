import folium

m = folium.Map(
    location=[38.96, 117.78],
    zoom_start=12,
    tiles='http://webrd02.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=7&x={x}&y={y}&z={z}',  # 高德街道图
    #         tiles='http://webst02.is.autonavi.com/appmaptile?style=6&x={x}&y={y}&z={z}', # 高德卫星图
    #         tiles='https://mt.google.com/vt/lyrs=s&x={x}&y={y}&z={z}', # google 卫星图
    # tiles='https://mt.google.com/vt/lyrs=h&x={x}&y={y}&z={z}', # google 地图
    attr='default'
)
folium.Marker(
    location=[38.96, 117.78],
    icon=folium.Icon(color='green')
).add_to(m)



folium.Circle(
    location=[38.96, 117.88],
    radius=800,
    fill=False,
    fill_color='#3186cc'
).add_to(m)
location=[
    [],[]




]