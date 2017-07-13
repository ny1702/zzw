
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=tTpV96swvp95Z4xcXHwsZN9eO2EBeDOv"></script>
    <script src="js/echarts.min.js" type="text/javascript"></script>
    <script src="js/china.js" type="text/javascript"></script>
    <script src="js/bmap.js" type="text/javascript"></script>
    <script>
    var map;
    //获取地理位置
    function getLocation() {
        var geo= new BMap.Geolocation();
        geo.getCurrentPosition(function (data) {
            add(data);
        })
    }
    function add(data) {
        map=new BMap.Map("first")
        var point=new BMap.Point(data.point.lng,data.point.lat);
        map.centerAndZoom(point,15);
        addMarker(point);
    }
    //添加覆盖物
    function addMarker(point) {
        //设置图片
        var icon=new BMap.Icon("images/principle-color.png",new BMap.Size(80,80));
        //marker标注表示地图上的点，可自定义标注的图标
        var market=new BMap.Marker(point);
        market.setIcon(icon);
        //给图片添加监听事件
        market.addEventListener("click",function (e) {
            //弹出弹框
            var w2=new BMap.InfoWindow("班长二狗拉面馆",{width:100,height:100,title:"系统提示"});
            map.openInfoWindow(w2,point);
        });
        //可以使用map.addOverlay方法向地图添加覆盖物
        map.addOverlay(market);
    }
    function pm() {
     var chart=echarts.init(document.getElementById("first"));
     var option={
         tooltip:{
           trigger:"item",
             formatter:"{b}<br/>{c}"
         },
         bmap:{
             center:[113.65,34.76],
             zoom:8
         },
         series:{
             type:"effectScatter",
             coordinateSystem:"bmap",
             data:[
                 {name:"郑州",value:[113.65,34.76,200]}
             ]
         }
     };
     chart.setOption(option);
    }
</script>
</head>
<body>
   <div id="first"  style="width: 900px;height: 900px"></div>
   <button onclick="getLocation()">覆盖物</button>
   <button onclick="pm()">PM2.5</button>
</body>
</html>
