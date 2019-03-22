package com.example.zhengai.utils;
import  com.github.abel533.echarts.*;
import com.github.abel533.echarts.axis.CategoryAxis;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.Orient;
import com.github.abel533.echarts.code.Tool;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.data.Data;
import com.github.abel533.echarts.data.PieData;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Line;
import com.github.abel533.echarts.series.Pie;

import java.util.*;

public class EchartsUtil {

    public Option selectRemoveCauses() {

//查询前20
//数据库查询获取统计数据
        List<Map<String, Object>> list = new ArrayList<>();

        for (int i = 0; i < 10; i++) {
            Map<String, Object> map = new HashMap<>();
            map.put("NAME", "张三" + i);
            map.put("TOTAL", new Random().nextInt(50));
            list.add(map);
        }


//创建Option
        Option option = new Option();
        option.title("剔除药品").tooltip(Trigger.axis).legend("金额（元）");
//横轴为值轴
        option.xAxis(new ValueAxis().boundaryGap(0d, 0.01));
//创建类目轴
        CategoryAxis category = new CategoryAxis();

//柱状数据
        Bar bar = new Bar("金额（元）");
//饼图数据
        Pie pie = new Pie("金额（元）");

//循环数据
        for (Map<String, Object> objectMap : list) {
//设置类目
            category.data(objectMap.get("NAME"));

//类目对应的柱状图
            bar.data(objectMap.get("TOTAL"));
//饼图数据

            pie.data(new PieData(objectMap.get("NAME").toString(), objectMap.get("TOTAL")));
        }

//设置类目轴
        option.yAxis(category);
//饼图的圆心和半径
        pie.center(900, 380).radius(100);
//设置数据
        option.series(bar, pie);
//由于药品名字过长，图表距离左侧距离设置180，关于grid可以看ECharts的官方文档
        option.grid().x(180);
//返回Option
        return option;
    }
/*[{"legend": {},"tooltip": {},"dataset": {"dimensions": ["product", "2015", "2016", "2017"],"source": [{"2015": 43.3,"2016": 85.8,"2017": 93.7,"product": "Matcha Latte"}, {"2015": 83.1,"2016": 73.4,"2017": 55.1,"product": "Milk Tea"}, {"2015": 86.4,"2016": 65.2,"2017": 82.5,"product": "Cheese Cocoa"}, {"2015": 72.4,"2016": 53.9,"2017": 39.1,"product": "Walnut Brownie"}]},
"xAxis": {"type": "category"},"yAxis": {},"series": [{"type": "bar"}, {"type": "bar"}, {"type": "bar"}]},
 */
/*{"title": {},"tooltip": {"trigger": "item","formatter": "{a} <br/>{b} : {c} ({d}%)"},"legend": {"orient": "vertical","left": "left","data": ["直接访问", "邮件营销", "联盟广告", "视频广告", "搜索引擎"]},"series": [{"name": "访问来源","type": "pie","radius": "55%","center": ["50%", "60%"],"data": [{"value": 335,"name": "直接访问"}, {"value": 310,"name": "邮件营销"}, {"value": 234,"name": "联盟广告"}, {"value": 135,"name": "视频广告"}, {"value": 1548,"name": "搜索引擎"}],"itemStyle": {"emphasis": {"shadowBlur": 10,"shadowOffsetX": 0,"shadowColor": "rgba(0, 0, 0, 0.5)"}}}]},
*/
/*{"xAxis": {"type": "category","boundaryGap": false,"data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]},"yAxis": {"type": "value"},"series": [{"data": [820, 932, 901, 934, 1290, 1330, 1320],"type": "line","areaStyle": {}}]},
 */
    public static Option SetOption(String type,String title,List xname,List<Map<String,Object>> pieDatas){


        Option option = new GsonOption();

        //2.设置标题  可选
        option.title().text(title);//将标题传入即可 并且支持链式调用 设置显示位置 居左
        if (type=="bar"){
            //3.设置图例  可选
            option.legend();
            //4.设置工具栏  可选
            option.toolbox().show(true).feature(Tool.mark,
                    Tool.magicType); //设置可标记

            //5.设置显示工具
            option.tooltip().show(true).
                    formatter("{a}</br>{b}:{c}");//设置显示的格式 当鼠标放到柱状图上时的显示格式

            //6.设置x轴数据
            CategoryAxis categoryAxis = new CategoryAxis();
            categoryAxis.data(xname);
            option.xAxis(categoryAxis);

            //7.设置y轴 这里不给指定数据  自动调整
            ValueAxis valueAxis = new ValueAxis();
            option.yAxis(valueAxis);

            //8.填充柱状图数据
            Bar bar = new Bar();
            bar.data(pieDatas);//指定路段装入指定数据
            //装入数据表中
            option.series(bar);
        }

        if(type=="pie"){
            //设置标题  二级标题  标题位置
            option.title().text(title);

            //设置工具栏 展示  能标记
            option.toolbox().show(true).feature(Tool.mark);

            //设置显示工具格式
            option.tooltip().show(true).formatter("{a}</br>{b}：{c}/个");

            //设置图例  图例位置  图例对齐方式 竖列对齐
            option.legend().data(xname).orient(Orient.vertical);

            //填充数据
            Pie pie = new Pie();//创建饼图对象

            //设置饼图的标题 半径、位置
            pie.name(title).radius("55%").center("50%","50%");
                pie.data(pieDatas);
            option.series(pie); //设置数据

        }

        if(type=="line"){
            option.title().text(title);


            option.tooltip().show(true);
            option.toolbox().show(true).feature(Tool.magicType,Tool.dataZoom);

            CategoryAxis categoryAxis = new CategoryAxis();

            categoryAxis.data(xname);
            option.xAxis(categoryAxis);
            option.yAxis(new ValueAxis());

                Line line = new Line();

                line.name(type);

                    line.data(pieDatas);
                option.series(line);

        }
        return  option;
    }


}
