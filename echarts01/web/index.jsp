
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>$Title$</title>
  <script src="js/echarts.min.js" type="text/javascript"></script>
  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=tTpV96swvp95Z4xcXHwsZN9eO2EBeDOv">

  </script>
  <script>
      function f1() {
          var myChart= echarts.init(document.getElementById('first'));
          var option={
              title:{
                  text:"学习过程"
              },
              legend: {
                  data:['销量']
              },
              xAxis:{
                  data:["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
              },

              yAxis: {},
              series: [{
                  name: '销量',
                  type: 'bar',
                  data: [5, 20, 36, 10, 10, 20]
              }]
          }
          myChart.setOption(option);
      }


  </script>
  <script>
    function  f2() {
        var map=new BMap.Map("first");
        var point = new BMap.Point(116.404, 39.915);  // 创建点坐标
        map.centerAndZoom(point, 15);
    }
    function f3() {
        var ad=new BMap.Geolocation();
        ad.getCurrentPosition(function (data) {
            var p=new BMap.Point(data.point.lng,data.point.lat);
            var coder=new BMap.Geocoder();
            var area=coder.getLocation(p,function (d) {
                alert(d.address);
            })
            
        })
    }
    function f4(){

        var map = new BMap.Map("first");
        map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
        var local = new BMap.LocalSearch(map, {
            renderOptions:{map: map}
        });
        local.search("天安门");

    }
  </script>

</head>

<body>
<div id="first" style="width:400px;height:400px"></div>
<button onclick="f1()">柱状图</button>
<button onclick="f2()">地图</button>
<button onclick="f3()">定位</button>
<button onclick="f4()">搜索</button>
</body>
</html>
