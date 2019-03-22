package com.example.zhengai;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.zhengai.dao.*;
import com.example.zhengai.model.*;
import com.example.zhengai.query.MyChangData;
import com.example.zhengai.query.MyUT;
import com.example.zhengai.query.Uid;
import com.example.zhengai.service.*;
import com.github.abel533.echarts.*;
import com.github.abel533.echarts.axis.Axis;
import com.github.abel533.echarts.axis.AxisLabel;
import com.github.abel533.echarts.axis.CategoryAxis;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.*;
import com.github.abel533.echarts.feature.MagicType;
import com.github.abel533.echarts.series.Line;
import com.github.abel533.echarts.series.MarkLine;
import com.github.abel533.echarts.series.Series;
import com.github.abel533.echarts.style.ItemStyle;
import com.github.abel533.echarts.style.LineStyle;
import com.github.abel533.echarts.style.TextStyle;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.sql.DataSource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ZhengaiApplicationTests {

    @Autowired
    PersonService personService;
    @Autowired
    YzAccessService yzAccessService;
    @Autowired
    YzTargetService yzTargetService;
    @Autowired
    YzTargetSortService yzTargetSortService;
    @Autowired
    YzHomepageStyleService yzHomepageStyleService;
    @Autowired
     YzTransformConService yzTransformConService;
    @Autowired
   YzUserService yzUserService;
    @Autowired
    YzTargetViewService yzTargetViewService;

    @Autowired
    CreatTableDao creatTableDao;
    @Autowired
    YzDatasDao yzDatasDao;
    @Autowired
    BaseDatasDao baseDatasDao;

    @Autowired
    YzElementService yzElementService;



    @Test
    public void contextLoads() {
     Option option =new Option();
        option.title("挂科数量诊改频次");

        TextStyle textStyle=new TextStyle();
        textStyle.setFontSize(16);
        textStyle.setFontWeight("normal");

        option.getTitle().setTextStyle(textStyle);


        Grid grid =new Grid();
        grid.setLeft("5%");
        grid.setRight("3%");
        grid.setTop("15%");

        option.setGrid(grid);


        List<Axis> xList =new ArrayList<Axis>();



           Axis axis =new Axis() {
            @Override
            public AxisType type() {
                AxisType category = AxisType.category;

                return category;
            }

                    @Override
                    public List data() {
                        Data data = new Data() {
                            @Override
                            public Object data(Object... objects) {
                                String dataStr ="浙江\", \"江西\", \"新疆\", \"安徽\", \"河南\", \"湖北\", \"四川\", \"青海\", \"浙江\", \"江西\", \"新疆\", \"安徽\", \"河南\", \"湖北\", \"四川\"";
                                String[] split = dataStr.split(",");
                                List<String> list = Arrays.asList(split);
                                return list;
                            }
                        };
                        return (List)((Data) data).data() ;
                    }
                };
        xList.add(axis);


        option.setxAxis(xList);

     /*  "tooltip": {"trigger": "axis","axisPointer": {"type": "shadow"}},"yAxis": {"type": "value"},
        tooltip":{"axisPointer":{"type":"shadow"},"trigger":"axis"},"xAxis":[{}],"yAxis":[]}*/
        Tooltip tooltip =new Tooltip();

        AxisPointer axisPointer =new AxisPointer();

        axisPointer.setType(PointerType.shadow);

        tooltip.setTrigger(Trigger.axis);
        tooltip.setAxisPointer(axisPointer);

        option.setTooltip(tooltip);

        Axis axis1 =new Axis(){
            @Override
            public void setType(AxisType type) {
                type =AxisType.value;
            }
        };
        List<Axis> yList =new ArrayList<Axis>();
        yList.add(axis1);

        option.setyAxis(yList);

        /*series": [{"data": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
        "markLine": {"symbolSize": 0,"lineStyle": {"color": "#c05c6d"},
        "label": {"formatter": "{b}: {c}","position": "middle"},"data": [{"name": "标准值","yAxis": 10}]},"type": "bar"}]}*/

        Series series =new Series() {
            @Override
            public List data() {
                String dataStr ="1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15";
                String[] split = dataStr.split(",");
                List<String> list = Arrays.asList(split);
                List<Integer> list1 =new ArrayList<Integer>();
                for (String str:list){
                    list1.add(new Integer(str));
                }
                return list1;
            }

            @Override
            public MarkLine markLine() {
                MarkLine markLine =new MarkLine();
                markLine.setSymbolSize(0);
                LineStyle lineStyle =new LineStyle();
                lineStyle.color("#c05c6d");
             /* {"name": "标准值","yAxis": 10}*/
                List<Map<String,Object>> list2 =new ArrayList<Map<String,Object>>();
                Map<String,Object> map = new HashMap<String,Object>();
                map.put("name","标准值");
                map.put("yAxis",10);

                list2.add(map);

                markLine.setData(list2);

                return markLine;
            }

            @Override
            public SeriesType type() {
                return SeriesType.bar;
            }


        };
        List<Series> seriesList =new ArrayList<Series>();

        seriesList.add(series);

        option.setSeries(seriesList);

        System.out.println(JSON.toJSONString(option));

       /* creatTableDao.createTmpTable("test");*/
//动态建表
        /*List<YzDatas> yzDatas = yzDatasDao.selectAllDatas();
        for (YzDatas yzDatas1:yzDatas){
            String table = yzDatas1.getTable();
            if (table!=null){
                creatTableDao.createTmpTable("yz_"+table);

            }


        }*/

    }


    @Test
    public void text(){
        Option option =new Option();

        option.legend("高度(km)与气温(°C)变化关系");

        option.toolbox().show(true).feature(Tool.mark, Tool.dataView, new MagicType(Magic.line, Magic.bar), Tool.restore, Tool.saveAsImage);

        option.calculable(true);
        option.tooltip().trigger(Trigger.axis).formatter("Temperature : <br/>{b}km : {c}°C");

        ValueAxis valueAxis = new ValueAxis();
        valueAxis.axisLabel().formatter("{value} °C");
        option.xAxis(valueAxis);

        CategoryAxis categoryAxis = new CategoryAxis();
        categoryAxis.axisLine().onZero(false);
        categoryAxis.axisLabel().formatter("{value} km");
        categoryAxis.boundaryGap(false);
        categoryAxis.data(0, 10, 20, 30, 40, 50, 60, 70, 80);
        option.yAxis(categoryAxis);

        Line line = new Line();
        line.smooth(true).name("高度(km)与气温(°C)变化关系").data(15, -50, -56.5, -46.5, -22.1, -2.5, -27.7, -55.7, -76.5).itemStyle().normal().lineStyle().shadowColor("rgba(0,0,0,0.4)");
        option.series(line);

        System.out.println(JSON.toJSONString(option));

    }


    @Test
    public void text1(){
      /*  List<YzDatas> yzDatas = yzDatasDao.selectAllDatas();
        for (YzDatas yzDatas1:yzDatas){
            String table = yzDatas1.getTable();
            if (table!=null){
                creatTableDao.createTmpTable("yz_"+table);

            }
        }*/
    }

    @Test
    public void test1(){


    }

}

