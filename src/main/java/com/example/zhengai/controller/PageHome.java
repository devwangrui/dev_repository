package com.example.zhengai.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.example.zhengai.dao.BaseDatasDao;
import com.example.zhengai.dao.CreatTableDao;
import com.example.zhengai.model.*;
import com.example.zhengai.query.*;
import com.example.zhengai.service.*;
import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.axis.CategoryAxis;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.Magic;
import com.github.abel533.echarts.code.Tool;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.feature.MagicType;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Line;
import com.github.abel533.echarts.series.Pie;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/PageHome")
public class PageHome {
    @Autowired
    private YzNewsService yzNewsService;
    @Autowired
    private YzTargetSortService yzTargetSortService;
    @Autowired
    private YzDatasChartService yzDatasChartService;
    @Autowired
    private YzHomepageStyleService yzHomepageStyleService;
    @Autowired
    private YzLayerService yzLayerService;
    @Autowired
    private YzUserService yzUserService;
    @Autowired
    private YzTargetService yzTargetService;
    @Autowired
    private YzTransformConService yzTransformConService;
    @Autowired
    private YzElementService yzElementService;
    @Autowired
    private YzTargetViewService yzTargetViewService;
    @Autowired
    private YzWarningService yzWarningService;
    @Autowired
    private YzValuesService yzValuesService;
    @Autowired
    private YzDicService yzDicService;
    @Autowired
    private YzTransformService yzTransformService;
    @Autowired
    private YzDatasService yzDatasService;
    @Autowired
    private BaseDatasService baseDatasService;
    @Autowired
    private CreatTableDao creatTableDao;

    @Autowired
    BaseDatasDao baseDatasDao;


    @RequestMapping("/toPageHomeR")
   public String toPageHomeR(Model model,YzUser user,HttpSession session){
        YzUser yzUser1 = yzUserService.selectById(2);
        session.setAttribute("user",yzUser1);
        List<ChartStyle> styleList = new ArrayList<ChartStyle>();//数据样式
        List<ChartDatas> chartDatasList = new ArrayList<ChartDatas>();//数据
        List<YzTargetSort> homePageDates =new ArrayList<YzTargetSort>();

        Integer x =0;                                          //初始化一个x y的布局数据
        Integer y =0;

        Integer count=-1;
        Integer maxY = yzHomepageStyleService.selectMaxY();             //查询出最大的XY布局数
        Integer maxX = yzHomepageStyleService.selectMaxX();
        Integer endX = yzHomepageStyleService.selectEndX();             //查询出如果已经有布局数据的话 最后一个X的值
        if (endX==null){
            endX=0;
        }

        YzUser yzUser = yzUserService.selectUserJoinElementByUId(2);//根据用户的ID查询出用户所处的部门
        List<YzUserElement> yzUserElements = yzUser.getYzUserElement();

        for (YzUserElement yzUserElement:yzUserElements){
            YzElement yzElement = yzUserElement.getYzElement();  //获得该用户的部门
            Integer elementId = yzElement.getId();

            YzElement yzElement1 = yzElementService.selectElementJoinAllTargetById(elementId);  //根据部门ID查询出部门对应的一级二级三级数据
            List<YzTargetSort> yzTargetSorts = yzElement1.getYzTargetSorts();
            for (YzTargetSort yzTargetSort:yzTargetSorts){
                homePageDates.add(yzTargetSort);
                List<TargerSortQuery> list = yzTargetSort.getList();
                for (TargerSortQuery targerSortQuery:list){
                    List<YzTarget> list1 = targerSortQuery.getList();
                    for (YzTarget yzTarget:list1){

                        Integer dataId = yzTarget.getDataId();
                        YzDatas yzDatas = yzDatasService.selectByPrimaryKey(dataId);
                        if (yzDatas!=null){   //如果存在
                            String table = "yz_"+yzDatas.getTable();
                            String sqlTable ="tables."+table;

                                List<Integer> dataKeys = baseDatasService.selectDataKey(sqlTable);
                                if (dataKeys.size()>0){                 //如果表里有数据
                                    count++;
                                    ChartDatas chartDatas =new ChartDatas();                              //new一个类来封装数据
                                    chartDatas.setTitle(yzTarget.getTitle());
                                    chartDatas.setrId(yzTarget.getId());
                                    chartDatas.setId(count);

                                    YzHomepageStyle yzHomepageStyle = yzHomepageStyleService.selectByTargeyId(dataId);
                                    if (yzHomepageStyle!=null){
                                                                                           //如果样式表里有样式的信息
                                            ChartStyle chartStyle =new ChartStyle();

                                            Integer chartId = yzHomepageStyle.getChartId();

                                            YzDatasChart yzDatasChart = yzDatasChartService.selectChartById(chartId);       //查询出对应的图表的类型
                                            chartDatas.setChartsType(yzDatasChart.getEchartstype());                         //设置给chartDatas

                                            chartStyle.setH(yzHomepageStyle.getH());                      //数据直接设置给chartStyle样式
                                            chartStyle.setX(yzHomepageStyle.getX());
                                            chartStyle.setY(yzHomepageStyle.getY());
                                            chartStyle.setW(yzHomepageStyle.getW());
                                            chartStyle.setEchartsType(yzDatasChart.getEchartstype());
                                            chartStyle.setTitle(yzTarget.getTitle());
                                            chartStyle.setI(count);
                                            chartStyle.setrId(yzTarget.getId());
                                            chartStyle.setOptKey(table);
                                            styleList.add(chartStyle);

                                    }else {                                                       //如果样式表没里有样式的信息 随机分配
                                        ChartStyle chartStyle =new ChartStyle();
                                        setHomepageStyle( chartStyle, chartDatas, maxX, maxY, x, y, count, endX, styleList, dataId,sqlTable,yzTarget.getTitle(),yzTarget);
                                    }

                                    List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
                                    List<String> nameList = new ArrayList<String>();
                                    List<Float> dataList = new ArrayList<Float>();
                                    for (Integer dataKey:dataKeys) {
                                        Map<String, Object> rmap = new HashMap<String, Object>();
                                        rmap.put("tableName", sqlTable);
                                        rmap.put("dataKey", dataKey);

                                        BaseDatas baseDatas = baseDatasDao.selectConditionData(rmap);
                                        chartDatas.setOptKey(table+":"+dataKey);

                                        Integer xyId = baseDatas.getXyId();
                                        Integer zyId = baseDatas.getZyId();
                                        String sheng = baseDatas.getSheng();
                                        Float num = baseDatas.getNum();
                                        Integer nj = baseDatas.getNj();
                                        Integer classId = baseDatas.getClassId();
                                        String title = baseDatas.getTitle();

                                        String zyName="";
                                        String xyName="";
                                        String className="";
                                        if (sheng==null){sheng="";}
                                        if (title==null){title="";}

                                        if (zyId!=null){
                                            YzDic yzDic1 = yzDicService.selectByPrimaryKey(zyId);
                                            zyName=yzDic1.getTitle();
                                        }
                                        if (xyId!=null){
                                            YzDic yzDic = yzDicService.selectByPrimaryKey(xyId);
                                            xyName=yzDic.getTitle();
                                        }
                                        if (classId!=null){
                                            YzDic yzDic = yzDicService.selectByPrimaryKey(classId);
                                            className=yzDic.getTitle();
                                        }

                                        String Xname =xyName+zyName+className+sheng+title;
                                        if (xyName==""&&zyName==""&&title==""&&className==""&&sheng==""&&nj!=null){
                                           Xname=nj.toString();
                                        }
                                        if (xyName==""&&zyName==""&&title==""&&className==""&&sheng==""&&nj==null){
                                            Xname=baseDatas.getAddTime();

                                        }

                                        nameList.add(Xname);
                                        dataList.add(num);

                                        Map<String,Object> map =new HashMap<String,Object>();
                                        map.put("name",Xname);
                                        map.put("value",num);

                                        mapList.add(map);

                                    }
                                    chartDatas.setXname(nameList);
                                    chartDatas.setData(dataList);
                                    chartDatas.setPiedata(mapList);


                                    chartDatasList.add(chartDatas);         //把chartDatas的属性赋值完了之后 加入到集合中
                                }

                        }
                    }
                }
            }
        }
        List<YzNews> newsList = yzNewsService.selectNewsToHomePage();

        String style = JSON.toJSONString(styleList);

        model.addAttribute("newsList", newsList);
        model.addAttribute("style", style);
        model.addAttribute("chartDatasList",JSON.toJSONString(chartDatasList));
        model.addAttribute("chartDatasList1",JSONArray.fromObject(chartDatasList));
        model.addAttribute("homePageDates", homePageDates);
        model.addAttribute("homePageDatesJSON", JSON.toJSONString(homePageDates));

        return "HomePage/index";
    }

    @ResponseBody
    @RequestMapping("/getValues")
    public String getValues(Integer targetId){
        System.out.println(targetId);
        Map<String,Object> map = new HashMap<String,Object>();
        YzTransform yzTransform = yzTransformService.selectTransformByTId(targetId);
        String firstAdd ="";
        String secondAdd  ="";
        String gotime  ="";
        String endtime  ="";
        if (yzTransform!=null){
            gotime = yzTransform.getGotime();
            endtime = yzTransform.getEndtime();
        }
        map.put("gotime",gotime==null?"":gotime);
        map.put("endtime",endtime==null?"":endtime);
        List<YzTransformCon> yzTransformCon = yzTransformConService.selectTransformConBySort2(targetId);

        if (yzTransformCon.size()>0){
            firstAdd = yzTransformCon.get(0).getAddTime();
            if (yzTransformCon.size()>1){
                secondAdd = yzTransformCon.get(1).getAddTime();
            }
        }
        map.put("firstAdd",firstAdd);
        map.put("secondAdd",secondAdd);

        YzTarget yzTarget = yzTargetService.selectById(targetId);
        Integer dataId = yzTarget.getDataId();
        YzDatas yzDatas = yzDatasService.selectByPrimaryKey(dataId);
        if (yzDatas!=null){   //如果存在
            String table = "yz_"+yzDatas.getTable();
            String sqlTable ="tables."+table;

            List<Integer> dataKeys = baseDatasService.selectDataKey(sqlTable);
            if (dataKeys.size()>0){                 //如果表里有数据
                map.put("text",yzTarget.getTitle());
                map.put("yAxis",yzTarget.getStand());

                List<String> xdatas=new ArrayList<String>();
                List<Float> vdatas =new ArrayList<Float>();
                for (Integer dataKey:dataKeys) {
                    Map<String, Object> rmap = new HashMap<String, Object>();
                    rmap.put("tableName", sqlTable);
                    rmap.put("dataKey", dataKey);

                    BaseDatas baseDatas = baseDatasDao.selectConditionData(rmap);
                    /*text(表名) xdata vdata yAxis(标准值) */
                    Integer xyId = baseDatas.getXyId();
                    Integer zyId = baseDatas.getZyId();
                    String sheng = baseDatas.getSheng();
                    Float num = baseDatas.getNum();
                    Integer nj = baseDatas.getNj();
                    Integer classId = baseDatas.getClassId();
                    String title = baseDatas.getTitle();

                    String zyName="";
                    String xyName="";
                    String className="";
                    if (sheng==null){sheng="";}
                    if (title==null){title="";}

                    if (zyId!=null){
                        YzDic yzDic1 = yzDicService.selectByPrimaryKey(zyId);
                        zyName=yzDic1.getTitle();
                    }
                    if (xyId!=null){
                        YzDic yzDic = yzDicService.selectByPrimaryKey(xyId);
                        xyName=yzDic.getTitle();
                    }
                    if (classId!=null){
                        YzDic yzDic = yzDicService.selectByPrimaryKey(classId);
                        className=yzDic.getTitle();
                    }

                    String Xname =xyName+zyName+className+sheng+title;
                    if (xyName==""&&zyName==""&&title==""&&className==""&&sheng==""&&nj!=null){
                        Xname=nj.toString();
                    }
                    if (xyName==""&&zyName==""&&title==""&&className==""&&sheng==""&&nj==null){
                        Xname=baseDatas.getAddTime();
                    }
                    xdatas.add(Xname);
                    vdatas.add(num);
                }
                map.put("xdatas",xdatas);
                map.put("vdatas",vdatas);
            }
        }
        return JSON.toJSONString(map);
    }


    @ResponseBody
    @RequestMapping("/getConditionDatas1")
    public ChartDatas getConditionDatas1(Integer targetId){
        ChartDatas chartDatas =new ChartDatas();

        YzTarget yzTarget = yzTargetService.selectTargetJoinDatasByTargetId(targetId);
        Integer dataId = yzTarget.getDataId();
        YzHomepageStyle yzHomepageStyle = yzHomepageStyleService.selectByTargeyId(dataId);
        Integer chartId = yzHomepageStyle.getChartId();

        YzDatasChart yzDatasChart = yzDatasChartService.selectChartById(chartId);
        String echartstype = yzDatasChart.getEchartstype();
        chartDatas.setChartsType(echartstype);

        YzDatas yzDatas = yzDatasService.selectByPrimaryKey(dataId);
        String table = "yz_"+yzDatas.getTable();
        String sqlTable ="tables."+table;

            List<Integer> dataKey = baseDatasService.selectDataKey(sqlTable);
            if (dataKey.size()>0){
                List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
                List<String> nameList = new ArrayList<String>();
                List<Float> dataList = new ArrayList<Float>();
                for (Integer key:dataKey){
                    chartDatas.setTitle(yzTarget.getTitle());
                    chartDatas.setrId(yzTarget.getId());
                    Map<String, Object> map =new HashMap<String,Object>();
                    map.put("tableName",sqlTable);
                    map.put("dataKey",key);
                    BaseDatas baseDatas = baseDatasDao.selectConditionData(map);

                    Integer xyId = baseDatas.getXyId();
                    Integer zyId = baseDatas.getZyId();
                    String sheng = baseDatas.getSheng();
                    Float num = baseDatas.getNum();
                    Integer nj = baseDatas.getNj();
                    Integer classId = baseDatas.getClassId();
                    String title = baseDatas.getTitle();

                    String zyName="";
                    String xyName="";
                    String className="";
                    if (sheng==null){sheng="";}
                    if (title==null){title="";}

                    if (zyId!=null){
                        YzDic yzDic1 = yzDicService.selectByPrimaryKey(zyId);
                        zyName=yzDic1.getTitle();
                    }
                    if (xyId!=null){
                        YzDic yzDic = yzDicService.selectByPrimaryKey(xyId);
                        xyName=yzDic.getTitle();
                    }
                    if (classId!=null){
                        YzDic yzDic = yzDicService.selectByPrimaryKey(classId);
                        className=yzDic.getTitle();
                    }

                    String Xname =xyName+zyName+className+sheng+title;
                    if (xyName==""&&zyName==""&&title==""&&className==""&&sheng==""&&nj!=null){
                        Xname=nj.toString();
                    }
                    if (xyName==""&&zyName==""&&title==""&&className==""&&sheng==""&&nj==null){
                        Xname=baseDatas.getAddTime();

                    }

                    nameList.add(Xname);
                    dataList.add(num);

                    Map<String,Object> map1 =new HashMap<String,Object>();
                    map1.put("name",Xname);
                    map1.put("value",num);
                    chartDatas.setXname(nameList);
                    chartDatas.setData(dataList);
                    chartDatas.setPiedata(mapList);
                    mapList.add(map1);

                }
            }

        return chartDatas;
    }

    @ResponseBody
    @RequestMapping("/submitStyle")
    public String submitStyle(String datas){

        List chartStyleList = JSON.parseObject(datas, List.class);

        for (Object obj:chartStyleList){
            ChartStyle chartStyle1 = JSON.parseObject(obj.toString(), ChartStyle.class);
            Integer targetId = chartStyle1.getrId();
            YzTarget yzTarget = yzTargetService.selectById(targetId);
            Integer dataId = yzTarget.getDataId();

            YzHomepageStyle yzHomepageStyle =new YzHomepageStyle();
            yzHomepageStyle.setH(chartStyle1.getH());
            yzHomepageStyle.setW(chartStyle1.getW());
            yzHomepageStyle.setX(chartStyle1.getX());
            yzHomepageStyle.setY(chartStyle1.getY());
            yzHomepageStyle.setTargId(dataId);
           /* yzHomepageStyle.setUserId();*///待完善


            String echartsType = chartStyle1.getEchartsType();
            switch (echartsType){
                case "pie":
                    yzHomepageStyle.setChartId(1);
                    break;
                case "bar":
                    yzHomepageStyle.setChartId(2);
                    break;
                case "line":
                    yzHomepageStyle.setChartId(3);
                    break;
            }

            yzHomepageStyleService.updateStyle(yzHomepageStyle);
        }
        return "yes";
    }

    @ResponseBody
    @RequestMapping("/getDatas")
    public List<Map<String,Object>> getDatas(Integer targetId){

        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        YzTarget yzTarget = yzTargetService.selectById(targetId);
        if (yzTarget!=null){
            Integer dataId = yzTarget.getDataId();
            YzDatas yzDatas = yzDatasService.selectByPrimaryKey(dataId);
            String table = yzDatas.getTable();

            String exit = creatTableDao.isExit("yz_" + table);
            if (exit!=null){
                List<Integer> dataKey = baseDatasService.selectDataKey("yz_" + table);
                if (dataKey.size()>0){
                    for (Integer key:dataKey){
                        /*optKey":"yz_stu_bk_num_xy:1*/
                        Map<String, Object> map =new HashMap<String,Object>();
                        map.put("tableName","yz_" + table);
                        map.put("dataKey",key);
                        List<BaseDatas> baseDatasList = baseDatasService.selectDatas(map);
                        Integer zyId = baseDatasList.get(0).getZyId();
                        Integer xyId = baseDatasList.get(0).getXyId();

                        String zyName="";
                        String xyName="";
                        Map<String, Object> map1 =new HashMap<String,Object>();

                        if (zyId!=null){
                            YzDic yzDic1 = yzDicService.selectByPrimaryKey(zyId);
                            zyName=yzDic1.getTitle();
                        }
                        if (xyId!=null){
                            YzDic yzDic = yzDicService.selectByPrimaryKey(xyId);
                            xyName=yzDic.getTitle();
                        }


                        String dataTitle =xyName+":"+zyName+":"+yzTarget.getTitle();

                        map1.put("dataTitle",dataTitle);
                        map1.put("targetId",targetId);
                        map1.put("optKey","yz_"+table+":"+key);

                        list.add(map1);
                    }
                }
            }


        }

        return list;
    }

    @RequestMapping("/look")
    public String look(Model model){

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

        /**/
        Bar bar = new Bar();
        Pie pie =new Pie();
        Line line = new Line();
        /*pie.name("高度(km)与气温(°C)变化关系").data(15, -50, -56.5, -46.5, -22.1, -2.5, -27.7, -55.7, -76.5).itemStyle().normal().lineStyle().shadowColor("rgba(0,0,0,0.4)");*/
        pie.name("高度(km)与气温(°C)变化关系").data(15, -50, -56.5, -46.5, -22.1, -2.5, -27.7, -55.7, -76.5).itemStyle().normal().label().show(true).formatter("{b} : {c} ({d}%)'");

        option.series(pie);
        model.addAttribute("optionList",JSON.toJSONString(option));

        return "HomePage/index1";
    }

@RequestMapping("/myChange")
    public String myChange(Model model,Integer targetId,YzUser user){

    List<MyChangData> changDataList = new ArrayList<MyChangData>();
    addUserZhengaiData(changDataList,1,targetId);

    List<MyChangData> changDataList1 = new ArrayList<MyChangData>();
    addUserZhengaiData(changDataList1,2,targetId);

    YzUser yzUser = yzUserService.selectUserJoinElementByUId(2);

    List<YzUserElement> yzUserElements = yzUser.getYzUserElement();
    List<MyChangUser> changUserList = new ArrayList<MyChangUser>();
    for (YzUserElement yzUserElement:yzUserElements){
        Integer idOne = yzUserElement.geteIdOne();
        YzElement yzElement = yzElementService.selectElementJoinUserByElementId(idOne);
        List<YzUserElement> yzUserElements1 = yzElement.getYzUserElements();
        for (YzUserElement yzUserElement1:yzUserElements1){
            YzUser yzUser1 = yzUserElement1.getYzUser();

            Integer idOne1 = yzUserElement1.geteIdOne();
            Integer idTwo = yzUserElement1.geteIdTwo();
            Integer idT = yzUserElement1.geteIdT();

            MyChangUser changUser =new MyChangUser();
            Integer id = yzUser1.getId();
            changUser.setId(id);
            changUser.setName(yzUser1.getName());

            List<YzTransformCon> yzTransformConsList = yzTransformConService.selectTargetViewByTid(targetId);

            if(yzTransformConsList!=null){
                for(YzTransformCon yzTransformCon:yzTransformConsList){
                    Integer uId = yzTransformCon.getuId();
                    if (uId==id){
                        changUser.setSelect(true);
                        break;
                    }
                }
            }

            String title ="";
            String title2 ="";
            String title3 ="";
            if (idOne1!=null){
                YzElement yzElement1 = yzElementService.selectYzElementById(idOne1);
                title = yzElement1.getTitle();
            }
            if(idTwo!=null){
                YzElement yzElement2 = yzElementService.selectYzElementById(idTwo);
                title2 = yzElement2.getTitle();
            }
            if(idT!=null){
                YzElement yzElement3 = yzElementService.selectYzElementById(idT);
                title3 = yzElement3.getTitle();
            }

            changUser.setPosition(title+" "+title2+" "+title3);
            changUserList.add(changUser);


        }

    }

    /*List<Integer> uIds = yzTransformConService.selectAllUIdByTId(targetId);*/
    YzTransform yzTransform = yzTransformService.selectTransformByTId(targetId);
    String getuId = yzTransform.getuId();
    String[] split = getuId.split("-");
    List<String> list = Arrays.asList(split);

    List<Map<String,Object>> userViewList =new ArrayList<Map<String, Object>>();

    if (list.size()>0){
        for (String uId:list){
            List<YzTransformCon> yzTransformCons = yzTransformConService.selectByUserId(new Integer(uId));
            if (yzTransformCons.size()==0){
                YzTransformCon yzTransformCon =new YzTransformCon();
                yzTransformCon.setuId(new Integer(uId));
                yzTransformCon.settId(targetId);
                yzTransformCon.setSort(1);

                yzTransformConService.insertSelective(yzTransformCon);

                YzTransformCon yzTransformCon1 =new YzTransformCon();
                yzTransformCon1.setuId(new Integer(uId));
                yzTransformCon1.settId(targetId);
                yzTransformCon1.setSort(2);

                yzTransformConService.insertSelective(yzTransformCon1);
            }

            Map<String,Object> map = new HashMap<String,Object>();
            map.put("tId",targetId);
            map.put("userId",new Integer(uId));
            map.put("sort",1);
            YzTransformCon yzTransformCon = yzTransformConService.selectZhengaiUserCondition(map);

            Map<String,Object> map1 = new HashMap<String,Object>();
            map1.put("tId",targetId);
            map1.put("userId",new Integer(uId));
            map1.put("sort",2);
            YzTransformCon yzTransformCon1 = yzTransformConService.selectZhengaiUserCondition(map1);

            Map<String,Object> myMap =new HashMap<String,Object>();

            myMap.put("name",yzTransformCon.getYzUser().getName());

            String content = yzTransformCon.getContent();
            String content1 = yzTransformCon1.getContent();

            if(content==null &&content1==null){
                myMap.put("zt",2);
            }

            if(content!=null &&content1==null){
                myMap.put("zt",0);
            }

            if(content!=null &&content1!=null){
                myMap.put("zt",1);
            }

            userViewList.add(myMap);
        }
    }

    YzTransform yzWarning = yzTransformService.selectTransformByTId(targetId);
    YzTarget yzTarget = yzTargetService.selectById(targetId);
    Integer updateSort = yzTarget.getUpdateSort();

    model.addAttribute("userView",JSON.toJSONString(userViewList));
    model.addAttribute("yzUserZhengai",JSON.toJSONString(changDataList));
    model.addAttribute("yzUserZhengai1",JSON.toJSONString(changDataList1));
    model.addAttribute("changUserList",JSON.toJSONString(changUserList));
    model.addAttribute("yzWarning",JSON.toJSONString(yzWarning));
    model.addAttribute("updateSort",updateSort);
    model.addAttribute("targetId",targetId);
    model.addAttribute("userId",2);

    return "HomePage/myChange";
    }




    @ResponseBody
    @RequestMapping("/addZhangaiUser")
    public String addZhangaiUser(String mydata,Integer targetId,Integer userId){

        List list =JSON.parseObject(mydata,List.class);
        List<String> list1 =new ArrayList<String>();
        for (Object strData:list){
            MyChangUser myChangUser = JSON.parseObject(strData.toString(),MyChangUser.class);
            Boolean select = myChangUser.getSelect();
            List<YzTransformCon> yzTransformCons = yzTransformConService.selectByUserId(myChangUser.getId());
            if (select&&yzTransformCons.size()==0){
                System.out.println(myChangUser.getId());
                    list1.add(myChangUser.getId().toString());
                    YzTransformCon yzTransformCon =new YzTransformCon();
                    yzTransformCon.setuId(myChangUser.getId());
                    yzTransformCon.settId(targetId);
                    yzTransformCon.setSort(1);

                    yzTransformConService.insertSelective(yzTransformCon);

                    YzTransformCon yzTransformCon1 =new YzTransformCon();
                    yzTransformCon1.setuId(myChangUser.getId());
                    yzTransformCon1.settId(targetId);
                    yzTransformCon1.setSort(2);

                    yzTransformConService.insertSelective(yzTransformCon1);

            }
        }

        String idDStr ="";
        for (String ids:list1){
            idDStr=idDStr+ids+"-";
        }
        YzTransform yzTransform = yzTransformService.selectTransformByTId(targetId);
        String getuId = yzTransform.getuId();
        if (getuId==null){
            getuId="";
        }
        YzTransform yzTransform1 =new YzTransform();
        yzTransform1.setId(yzTransform.getId());
        System.out.println(getuId+idDStr);
        yzTransform1.setuId(getuId+idDStr);
        yzTransformService.updateByPrimaryKeySelective(yzTransform1);
        return "yes";
    }

    @ResponseBody
    @RequestMapping("/submitYy")
    public String submitYy(String myChangeListL,Integer targetId){

        List list = JSON.parseObject(myChangeListL, List.class);

        for (Object str:list){
            MyChangData myChangData = JSON.parseObject(str.toString(), MyChangData.class);

             Integer id = myChangData.getId();
            String yyfx = myChangData.getYyfx();
            YzTransformCon yzTransformCon = yzTransformConService.selectByPrimaryKey(id);
            String content = yzTransformCon.getContent();
            if (yyfx!=null){
                if ((content!=null&&(yzTransformCon.getContent().equals(yyfx)==false)) || content==null){


                        YzTransformCon yzTransformCon1 =new YzTransformCon();
                        yzTransformCon1.setId(myChangData.getId());
                        yzTransformCon1.setuId(new Integer(myChangData.getYyValue()));
                        yzTransformCon1.settId(targetId);
                        yzTransformCon1.setContent(myChangData.getYyfx());
                        yzTransformCon1.setSort(1);

                        SimpleDateFormat sdf = new SimpleDateFormat();
                        String data = sdf.format(new Date());
                        yzTransformCon1.setAddTime(data);

                        yzTransformConService.updateByPrimaryKeySelective(yzTransformCon1);

                }
            }
        }

        return "yes";
    }

    @ResponseBody
    @RequestMapping("/submitCs")
    public String submitCs(String myChangeListR,Integer targetId){

        List list = JSON.parseObject(myChangeListR, List.class);
        for (Object str:list){
            MyChangData myChangData = JSON.parseObject(str.toString(), MyChangData.class);

            Integer id = myChangData.getConId();
            String yyfx = myChangData.getYyfx();


            YzTransformCon yzTransformCon = yzTransformConService.selectByPrimaryKey(id);

            String content = yzTransformCon.getContent();

            if (yyfx!=null){

                if ((content!=null&&(yzTransformCon.getContent().equals(yyfx)==false)) || content==null){


                    YzTransformCon yzTransformCon1 =new YzTransformCon();
                    yzTransformCon1.setId(myChangData.getConId());
                    yzTransformCon1.setuId(new Integer(myChangData.getYyValue()));
                    yzTransformCon1.settId(targetId);
                    yzTransformCon1.setContent(myChangData.getYyfx());
                    yzTransformCon1.setSort(2);

                    SimpleDateFormat sdf = new SimpleDateFormat();
                    String data = sdf.format(new Date());
                    yzTransformCon1.setAddTime(data);

                    yzTransformConService.updateByPrimaryKeySelective(yzTransformCon1);

                }
            }
        }
        return "yes";
    }

    @ResponseBody
    @RequestMapping("/submitWarning")
    public String submitWarning(YzTransform yzTransform,Integer tId,Integer sort){

        YzTransform yzTransform1 = yzTransformService.selectTransformByTId(tId);
        if (yzTransform1==null){
           yzTransformService.insertSelective(yzTransform);
        }else {
            yzTransformService.updateByPrimaryKeySelective(yzTransform);
        }


        YzTarget yzTarget = yzTargetService.selectById(tId);
        yzTarget.setUpdateSort(sort);
        yzTargetService.updateTarget(yzTarget);

        return "yes";
    }

    @RequestMapping("/classList")
    public String classList(){
        return "HomePage/classList";
    }



    @RequestMapping("/login")
    public String login(){

        return "HomePage/login";

    }

    @RequestMapping("/toLogin")
    public String toLogin(String username, HttpSession session){

        YzUser yzUser = yzUserService.selectUserByUserName(username);
        session.setAttribute("user",yzUser);
        return "redirect:/PageHome/toPageHome";

    }

    @RequestMapping("/overView")
    public String overView(YzUser user,Model model){
        YzElement yzElement =null;
        YzUser yzUser = yzUserService.selectUserJoinElementByUserId(2);
        List<MyTargetDatas> myTargetDatasList = new ArrayList<MyTargetDatas>();

        List<YzUserElement> yzUserElements = yzUser.getYzUserElement();   //根据传过来的用户ID查询出该用户所在的部门
        for(YzUserElement yzUserElement:yzUserElements){        //该用户可能在多个部门 所以需要用一个集合
            Integer idOne = yzUserElement.geteIdOne();           //获得该用户对应的一级部门的编号ID

                yzElement = yzElementService.selectElementJoinAllTargetById(idOne);

                List<YzTargetSort> yzTargetSorts = yzElement.getYzTargetSorts();   //获取到部门对应的一级二级三级指标
                for (int i=0;i<yzTargetSorts.size();i++){  //一级
                    List<TargerSortQuery> list = yzTargetSorts.get(i).getList();
                    for (int j=0;j<list.size();j++){   //二级
                        List<YzTarget> targetList = list.get(j).getList();
                        for (int k=0;k<targetList.size();k++){   //指标
                            MyTargetDatas myTargetDatas =new MyTargetDatas();

                            myTargetDatas.setI(targetList.get(k).getId());
                            myTargetDatas.setFirstNorm(yzTargetSorts.get(i).getTitle());
                            myTargetDatas.setSecondNorm(list.get(j).getTitle());
                            myTargetDatas.setNormName(targetList.get(k).getTitle());

                            YzTransform yzTransform = yzTransformService.selectTransformByTId(targetList.get(k).getId());

                            if (yzTransform!=null){
                                String rUId = yzTransform.getrUId();
                                Integer isOver = yzTransform.getIsOver();

                                YzUser yzUser1 = yzUserService.selectById(new Integer(rUId));
                                myTargetDatas.setStarPeople(yzUser1.getName());

                                if (isOver==0){
                                    myTargetDatas.setEnd(true);
                                }
                            }

                            myTargetDatasList.add(myTargetDatas);
                        }
                    }
                }
        }
         model.addAttribute("myTargetDatasList",JSON.toJSONString(myTargetDatasList));
        return "HomePage/overView";
    }

    @RequestMapping("/changeReport")
    public String changeReport(Integer targetId,Model model){
        Map<String,Object> map =new HashMap<String,Object>();
        List<Map<String,Object>> list =new ArrayList<Map<String,Object>>();
        List<Map<String,Object>> list1 =new ArrayList<Map<String,Object>>();
        List<Map<String,Object>> listRadar =new ArrayList<Map<String,Object>>();

        List<Map> listRadar1 =new ArrayList<Map>();

        YzTarget yzTarget = yzTargetService.selectById(targetId);
        Integer dataId = yzTarget.getDataId();
        String stand = yzTarget.getStand();
        YzDatas yzDatas = yzDatasService.selectByPrimaryKey(dataId);

        String table = "yz_"+yzDatas.getTable();
        String sqlTable ="tables."+table;

        List<List<Float>> aLi=new ArrayList<List<Float>>();
        List<Integer> integer = baseDatasDao.selectAllNj(sqlTable);
        for(int i =0;i<integer.size();i++){
            aLi.add(new ArrayList<Float>());
        }

            List<Integer> dataKeys = baseDatasService.selectDataKey(sqlTable);
            if (dataKeys.size()>0){                 //如果表里有数据
                map.put("text",yzTarget.getTitle());

                List<String> xdatas=new ArrayList<String>();
                List<Float> vdatas =new ArrayList<Float>();
                for (Integer dataKey:dataKeys) {
                    Map<String, Object> rmap = new HashMap<String, Object>();

                    rmap.put("tableName", sqlTable);
                    rmap.put("dataKey", dataKey);

                    BaseDatas baseDatas = baseDatasDao.selectConditionData(rmap);

                    Integer xyId = baseDatas.getXyId();
                    Integer zyId = baseDatas.getZyId();
                    String sheng = baseDatas.getSheng();
                    Float num = baseDatas.getNum();
                    Integer nj = baseDatas.getNj();
                    Integer classId = baseDatas.getClassId();
                    String title = baseDatas.getTitle();

                    String zyName="";
                    String xyName="";
                    String className="";
                    if (sheng==null){sheng="";}
                    if (title==null){title="";}

                    if (zyId!=null){
                        YzDic yzDic1 = yzDicService.selectByPrimaryKey(zyId);
                        zyName=yzDic1.getTitle();
                    }
                    if (xyId!=null){
                        YzDic yzDic = yzDicService.selectByPrimaryKey(xyId);
                        xyName=yzDic.getTitle();
                    }
                    if (classId!=null){
                        YzDic yzDic = yzDicService.selectByPrimaryKey(classId);
                        className=yzDic.getTitle();
                    }

                    String Xname =xyName+zyName+className+sheng+title;
                    if (xyName==""&&zyName==""&&title==""&&className==""&&sheng==""&&nj!=null){
                        Xname=nj.toString();
                    }
                    if (xyName==""&&zyName==""&&title==""&&className==""&&sheng==""&&nj==null){
                        Xname=baseDatas.getAddTime();
                    }
                    xdatas.add(Xname);
                    vdatas.add(num);

                    List<BaseDatas> baseDatasList = baseDatasDao.selectDatas(rmap);
                    Map<String,Object> mapPie =new HashMap<>();

                    Map<String,Object> mapRadar =new HashMap<>();

                    mapPie.put("name",Xname);
                    mapRadar.put("name",Xname);
                    float sum =0;

                    List<Float> numList= new ArrayList<Float>();
                    for (BaseDatas baseDatas1:baseDatasList){
                        Map<String,Object> mapRound =new HashMap<>();

                        Float num1 = baseDatas1.getNum();
                        Integer nj1 = baseDatas1.getNj();

                        mapRound.put("name",Xname+nj1+"年");
                        mapRound.put("value",num1);

                        numList.add(num1);

                        sum+=num1;
                        list1.add(mapRound);

                        for(int i =0;i<integer.size();i++){

                            if (integer.get(i).toString().equals(baseDatas1.getNj().toString())){

                              aLi.get(i).add(baseDatas1.getNum());
                            }
                        }

                    }
                    mapRadar.put("value",numList);
                    mapPie.put("value",sum);
                    mapRadar.put("max",sum);
                    list.add(mapPie);
                    listRadar.add(mapRadar);
                }

                for (int i =0;i<aLi.size();i++){
                    Map<String, Object> mapRadar1 = new HashMap<String, Object>();
                    mapRadar1.put("name",integer.get(i));
                    mapRadar1.put("value",aLi.get(i));
                    listRadar1.add(mapRadar1);
                }
                map.put("xdatas",xdatas);
                map.put("vdatas",vdatas);
            }
            List<MyChangData> listData =new ArrayList<MyChangData>();
            List<MyChangData> listData1 =new ArrayList<MyChangData>();
            addUserZhengaiData(listData,1,targetId);
            addUserZhengaiData(listData1,2,targetId);

        YzTransform yzTransform = yzTransformService.selectTransformByTId(targetId);
        String getuId = yzTransform.getuId();
        String[] split = getuId.split("-");
        List<String> listS = Arrays.asList(split);

        List<Map<String,Object>> userViewList =new ArrayList<Map<String, Object>>();

        if (list.size()>0){
            for (String uId:listS){
                List<YzTransformCon> yzTransformCons = yzTransformConService.selectByUserId(new Integer(uId));
                if (yzTransformCons.size()==0){
                    YzTransformCon yzTransformCon =new YzTransformCon();
                    yzTransformCon.setuId(new Integer(uId));
                    yzTransformCon.settId(targetId);
                    yzTransformCon.setSort(1);

                    yzTransformConService.insertSelective(yzTransformCon);

                    YzTransformCon yzTransformCon1 =new YzTransformCon();
                    yzTransformCon1.setuId(new Integer(uId));
                    yzTransformCon1.settId(targetId);
                    yzTransformCon1.setSort(2);

                    yzTransformConService.insertSelective(yzTransformCon1);
                }

                Map<String,Object> mapM = new HashMap<String,Object>();
                mapM.put("tId",targetId);
                mapM.put("userId",new Integer(uId));
                mapM.put("sort",1);
                YzTransformCon yzTransformCon = yzTransformConService.selectZhengaiUserCondition(mapM);

                Map<String,Object> map1 = new HashMap<String,Object>();
                map1.put("tId",targetId);
                map1.put("userId",new Integer(uId));
                map1.put("sort",2);
                YzTransformCon yzTransformCon1 = yzTransformConService.selectZhengaiUserCondition(map1);

                Map<String,Object> myMap =new HashMap<String,Object>();

                myMap.put("name",yzTransformCon.getYzUser().getName());

                String content = yzTransformCon.getContent();
                String content1 = yzTransformCon1.getContent();

                if(content==null &&content1==null){
                    myMap.put("zt",2);
                }

                if(content!=null &&content1==null){
                    myMap.put("zt",0);
                }

                if(content!=null &&content1!=null){
                    myMap.put("zt",1);
                }

                userViewList.add(myMap);
            }
        }

           model.addAttribute("dataNow",JSON.toJSONString(map));
           model.addAttribute("roundData",JSON.toJSONString(list1, SerializerFeature.DisableCircularReferenceDetect));
           model.addAttribute("pieData",JSON.toJSONString(list));
           model.addAttribute("listRadar",JSON.toJSONString(listRadar));
           model.addAttribute("listRadar1",JSON.toJSONString(listRadar1));
           model.addAttribute("listData",JSON.toJSONString(listData));
           model.addAttribute("listData1",JSON.toJSONString(listData1));
           model.addAttribute("userView",JSON.toJSONString(userViewList));
           model.addAttribute("stand",stand);
          return "HomePage/changeReport";
    }


    public void addUserZhengaiData(List<MyChangData> list,Integer sort,Integer targetId){
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("sort",sort);
        map.put("tId",targetId);
        List<YzUser> userList = yzUserService.selectUserJoinTransform(map);
        if (userList!=null){
            for (YzUser yzUser:userList){
                YzTransformCon transformCon = yzUser.getTransformCon();
                MyChangData myChangData = new MyChangData();
                myChangData.setId(transformCon.getuId());
                myChangData.setConId(transformCon.getId());
                myChangData.setName(yzUser.getName());
                myChangData.setPostTime(transformCon.getAddTime());
                myChangData.setYyfx(transformCon.getContent());
                myChangData.setYyValue(transformCon.getuId()+"");
                list.add(myChangData);
            }
        }
    }


    public void setHomepageStyle(ChartStyle chartStyle,ChartDatas chartDatas,Integer maxX,Integer maxY,Integer x,Integer y,Integer count,Integer endX,List styleList,Integer dataId,String table,String title,YzTarget yzTarget){
                                 //如果没有chartStyle数据 就进行设置 这里的工作主要是设置好页面布局的数据
            Random random = new Random();

            int j = random.nextInt(3) + 1;

          setSAndD( j, chartStyle, chartDatas, maxX, maxY, x, y, count, endX, styleList, dataId, table,title,yzTarget);
    }

    public  void setSAndD(Integer i,ChartStyle chartStyle,ChartDatas chartDatas,Integer maxX,Integer maxY,Integer x,Integer y,Integer count,Integer endX,List styleList,Integer dataId,String table,String title,YzTarget yzTarget){


         maxY = yzHomepageStyleService.selectMaxY();             //查询出最大的XY布局数
         maxX = yzHomepageStyleService.selectMaxX();
         endX = yzHomepageStyleService.selectEndX();             //查询出如果已经有布局数据的话 最后一个X的值
        if (endX==null){
            endX=0;
        }

        YzDatasChart yzDatasChart1 = yzDatasChartService.selectChartById(i);
        chartDatas.setChartsType(yzDatasChart1.getEchartstype());
        YzHomepageStyle yzHomepageStyle1 = new YzHomepageStyle();

        if (maxY==null && maxX==null){   //没有一个样式信息的情况
            maxX =x;
            maxY =y;
            chartDatas.setChartsType(yzDatasChart1.getEchartstype());


            chartStyle.setEchartsType(yzDatasChart1.getEchartstype());
            chartStyle.setW(4);
            chartStyle.setH(20);
            chartStyle.setI(count);
            chartStyle.setX(x);
            chartStyle.setY(y);
            chartStyle.setTitle(title);
            chartStyle.setrId(yzTarget.getId());

            yzHomepageStyle1.setChartId(i);
            yzHomepageStyle1.setX(x);
            yzHomepageStyle1.setY(y);
            yzHomepageStyle1.setW(4);
            yzHomepageStyle1.setH(20);
            yzHomepageStyle1.setTargId(dataId);
            endX =x;

            /*保存*/
            yzHomepageStyleService.insert(yzHomepageStyle1);
            Integer styleId = yzHomepageStyle1.getStyleId();
            chartStyle.setStyleId(styleId);
        }else {                       //已经有样式信息的情况
            if (endX!=8){
                x= endX+4;
                endX=x;
                y = maxY;
            }else {
                x=0;
                endX =x;
                y = maxY+20;
                maxY=y;
            }

            chartDatas.setChartsType(yzDatasChart1.getEchartstype());

            chartStyle.setEchartsType(yzDatasChart1.getEchartstype());
            chartStyle.setW(4);
            chartStyle.setH(20);
            chartStyle.setI(count);
            chartStyle.setX(x);
            chartStyle.setY(y);
            chartStyle.setTitle(title);
            chartStyle.setrId(yzTarget.getId());


            yzHomepageStyle1.setChartId(i);
            yzHomepageStyle1.setX(x);
            yzHomepageStyle1.setY(y);
            yzHomepageStyle1.setW(4);
            yzHomepageStyle1.setH(20);
            yzHomepageStyle1.setTargId(dataId);


            /*保存*/
            yzHomepageStyleService.insert(yzHomepageStyle1);

            endX =x;
        }
        styleList.add(chartStyle);

    }

    public Option setOption(){
        Option option =new Option();
/*{"calculable":true,"legend":{"data":["高度(km)与气温(°C)变化关系"]},"series":[{"data":[15,-50,-56.5,-46.5,-22.1,-2.5,-27.7,-55.7,-76.5],
"itemStyle":{"normal":{"lineStyle":{"shadowColor":"rgba(0,0,0,0.4)"}}},"name":"高度(km)与气温(°C)变化关系","smooth":true,"type":"line"}],
"toolbox":{"feature":{"mark":{"lineStyle":{"color":"#1e90ff","type":"dashed","width":2},"show":true,"title":{"markUndo":"删除辅助线","markClear":"清空辅助线","mark":"辅助线开关"}},
"dataView":{"lang":["数据视图","关闭","刷新"],"readOnly":false,"show":true,"title":"数据视图"},
"magicType":{"show":true,"title":{"bar":"柱形图切换","stack":"堆积","tiled":"平铺","line":"折线图切换"},"type":["line","bar"]},"restore":{"show":true,"title":"还原"},
"saveAsImage":{"lang":["点击保存"],"show":true,"title":"保存为图片","type":"png"}},"show":true},
"tooltip":{"formatter":"Temperature : <br/>{b}km : {c}°C","trigger":"axis"},"xAxis":[{"axisLabel":{"formatter":"{value} °C"},"type":"value"}],
"yAxis":[{"axisLabel":{"formatter":"{value} km"},"axisLine":{"onZero":false},"boundaryGap":false,"data":[0,10,20,30,40,50,60,70,80],"type":"category"}]};
*/
        option.legend("高度(km)与气温(°C)变化关系");//title

        option.toolbox().show(true).feature(Tool.mark, Tool.dataView, new MagicType(Magic.line, Magic.bar), Tool.restore, Tool.saveAsImage);//这里给视图添加一些组建

        option.calculable(true);
        option.tooltip().trigger(Trigger.axis).formatter("Temperature : <br/>{b}km : {c}°C");

        ValueAxis valueAxis = new ValueAxis();
        valueAxis.axisLabel().formatter("{value} °C");//这行添加X数据的单位格式
        option.xAxis(valueAxis);

        CategoryAxis categoryAxis = new CategoryAxis();
        categoryAxis.axisLine().onZero(false);
        categoryAxis.axisLabel().formatter("{value} km");//Y的数据单位
        categoryAxis.boundaryGap(false);
        categoryAxis.data(0, 10, 20, 30, 40, 50, 60, 70, 80);//Y的数据
        option.yAxis(categoryAxis);   //Y轴只有部分图标需要设置

        Line line = new Line();
        line.smooth(true).name("高度(km)与气温(°C)变化关系").data(15, -50, -56.5, -46.5, -22.1, -2.5, -27.7, -55.7, -76.5).itemStyle().normal().lineStyle().shadowColor("rgba(0,0,0,0.4)");
        option.series(line);

        return option;
    }

    @RequestMapping("/test")
    public String test(){


        return "HomePage/test";
    }

    @RequestMapping("/subPage")
    public String subPage(Model model,YzUser user){
        List<Map<String,Object>> sortList= new ArrayList<Map<String,Object>>();
        List<Map<String,Object>> styleList= new ArrayList<Map<String,Object>>();
        List<Map<String,Object>> datasList = new ArrayList<Map<String,Object>>();


        Integer count=0;
        YzUser yzUser = yzUserService.selectUserJoinElementByUId(2);//根据用户的ID查询出用户所处的部门
        List<YzUserElement> yzUserElements = yzUser.getYzUserElement();

        YzTargetSort yzTargetSort0=null;
        for (YzUserElement yzUserElement:yzUserElements){
            YzElement yzElement = yzUserElement.getYzElement();  //获得该用户的部门
            Integer elementId = yzElement.getId();

            YzElement yzElement1 = yzElementService.selectElementJoinAllTargetById(elementId);  //根据部门ID查询出部门对应的一级二级三级数据
            List<YzTargetSort> yzTargetSorts = yzElement1.getYzTargetSorts();

            for (YzTargetSort yzTargetSort:yzTargetSorts) {
                Map<String,Object> map= new HashMap<String,Object>();
                map.put("t",yzTargetSort.getTitle());
                map.put("id",yzTargetSort.getId());
                sortList.add(map);

            }
        }

        model.addAttribute("textList",JSON.toJSONString(sortList));

        return "HomePage/subPage";
    }

    @RequestMapping("/getDatasBySort")
    @ResponseBody
    public String getDatasBySort(Integer sort,Integer userId){
        System.out.println("sort是"+sort);
        List<Map<String,Object>> styleList= new ArrayList<Map<String,Object>>();
        List<Map<String,Object>> datasList = new ArrayList<Map<String,Object>>();

        Map<String,Object> map = new LinkedHashMap<String,Object>();

        Integer count=0;
        YzUser yzUser = yzUserService.selectUserJoinElementByUId(2);//根据用户的ID查询出用户所处的部门
        List<YzUserElement> yzUserElements = yzUser.getYzUserElement();

        for (YzUserElement yzUserElement:yzUserElements){
            YzElement yzElement = yzUserElement.getYzElement();  //获得该用户的部门
            Integer elementId = yzElement.getId();

            YzElement yzElement1 = yzElementService.selectElementJoinAllTargetById(elementId);  //根据部门ID查询出部门对应的一级二级三级数据
            List<YzTargetSort> yzTargetSorts = yzElement1.getYzTargetSorts();

            for (YzTargetSort yzTargetSort:yzTargetSorts){
                Integer id = yzTargetSort.getId();
                if (id.intValue()==sort.intValue()){
                    List<TargerSortQuery> list = yzTargetSort.getList();
                    Collections.sort(list);

                    for (TargerSortQuery targerSortQuery : list) {
                        List<YzTarget> list1 = targerSortQuery.getList();
                        Collections.sort(list1);
                        for (YzTarget yzTarget : list1) {
                            Integer dataId = yzTarget.getDataId();
                            YzDatas yzDatas = yzDatasService.selectByPrimaryKey(dataId);

                            if (yzDatas!=null) {   //如果存在
                                String table = "yz_" + yzDatas.getTable();
                                String sqlTable = "tables." + table;

                                List<Integer> dataKeys = baseDatasService.selectDataKey(sqlTable);
                                Map<String,Object> datasMap =new LinkedHashMap<String,Object>();
                                if (dataKeys.size()>0){                 //如果表里有数据
                                    count++;

                                    YzHomepageStyle yzHomepageStyle = yzHomepageStyleService.selectByTargeyId(dataId);
                                    if (yzHomepageStyle!=null){
                                        Integer chartId = yzHomepageStyle.getChartId();
                                        YzDatasChart yzDatasChart = yzDatasChartService.selectChartById(chartId);
                                        String echartstype = yzDatasChart.getEchartstype();
                                        datasMap.put("type",echartstype);
                                    }else {
                                        Random random = new Random();
                                        int anInt = random.nextInt(3)+1;
                                        YzDatasChart yzDatasChart = yzDatasChartService.selectChartById(anInt);
                                        String echartstype = yzDatasChart.getEchartstype();
                                        datasMap.put("type",echartstype);
                                    }


                                    Map<String,Object> styleMap =new LinkedHashMap<String,Object>();
                                    styleMap.put("x",0);
                                    styleMap.put("y",0);
                                    styleMap.put("w",0);
                                    styleMap.put("h",0);
                                    styleMap.put("i",count);
                                    styleMap.put("id",yzTarget.getId());
                                    styleMap.put("title",targerSortQuery.getTitle());
                                    styleMap.put("bzz",yzTarget.getStand());
                                    styleMap.put("dqz",90);
                                    styleMap.put("name",yzTarget.getTitle());
                                    styleMap.put("random",0);
                                    styleList.add(styleMap);

                                    List<String> nameList = new ArrayList<String>();

                                    List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
                                    List<Float> dataList = new ArrayList<Float>();
                                    for (Integer dataKey:dataKeys) {

                                        Map<String, Object> rmap = new HashMap<String, Object>();
                                        rmap.put("tableName", sqlTable);
                                        rmap.put("dataKey", dataKey);

                                        BaseDatas baseDatas = baseDatasDao.selectConditionData(rmap);

                                        Integer xyId = baseDatas.getXyId();
                                        Integer zyId = baseDatas.getZyId();
                                        String sheng = baseDatas.getSheng();
                                        Float num = baseDatas.getNum();
                                        Integer nj = baseDatas.getNj();
                                        Integer classId = baseDatas.getClassId();
                                        String title = baseDatas.getTitle();

                                        String zyName="";
                                        String xyName="";
                                        String className="";
                                        if (sheng==null){sheng="";}
                                        if (title==null){title="";}

                                        if (zyId!=null){
                                            YzDic yzDic1 = yzDicService.selectByPrimaryKey(zyId);
                                            zyName=yzDic1.getTitle();
                                        }
                                        if (xyId!=null){
                                            YzDic yzDic = yzDicService.selectByPrimaryKey(xyId);
                                            xyName=yzDic.getTitle();
                                        }
                                        if (classId!=null){
                                            YzDic yzDic = yzDicService.selectByPrimaryKey(classId);
                                            className=yzDic.getTitle();
                                        }

                                        String Xname =xyName+zyName+className+sheng+title;
                                        if (xyName==""&&zyName==""&&title==""&&className==""&&sheng==""&&nj!=null){
                                            Xname=nj.toString();
                                        }
                                        if (xyName==""&&zyName==""&&title==""&&className==""&&sheng==""&&nj==null){
                                            Xname=baseDatas.getAddTime();
                                        }
                                        Map<String,Object> pieMap = new LinkedHashMap<String,Object>();
                                        pieMap.put("name",Xname);
                                        pieMap.put("value",num);
                                        mapList.add(pieMap);

                                        nameList.add(Xname);
                                        dataList.add(num);
                                    }
                                    datasMap.put("xdatas",nameList);
                                    datasMap.put("lineDatas",dataList);
                                    datasMap.put("pieDatas",mapList);

                                    datasList.add(datasMap);
                                }else {
                                    count++;
                                    Map<String,Object> styleMap =new LinkedHashMap<String,Object>();
                                    styleMap.put("x",0);
                                    styleMap.put("y",0);
                                    styleMap.put("w",0);
                                    styleMap.put("h",0);
                                    styleMap.put("i",count);
                                    styleMap.put("id",yzTarget.getId());
                                    styleMap.put("title",targerSortQuery.getTitle());
                                    styleMap.put("bzz",yzTarget.getStand());
                                    styleMap.put("dqz",90);
                                    styleMap.put("name",yzTarget.getTitle());
                                    styleMap.put("random",0);

                                    styleList.add(styleMap);
                                    datasList.add(datasMap);
                                }
                            }
                        }
                    }
                }
            }
        }

        map.put("datas",datasList);
        map.put("layout",styleList);
        return JSON.toJSONString(map);
    }

    @ResponseBody
    @RequestMapping("/toTransform")
    public void toTransform(Integer targetId,YzUser user){
        YzTarget yzTarget = yzTargetService.selectById(targetId);


        /*Integer userId = user.getId();*/
        YzTransform yzTransform =new YzTransform();
        yzTransform.settId(targetId);
       /* yzTransform.setuId(userId+"-");
        yzTransform.setrUId(userId.toString());*/
        yzTransform.setuId(2+"-");
        yzTransform.setrUId("2");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String formatDate = sdf.format(new Date());
        yzTransform.setGotime(formatDate);
        yzTransform.setSort(yzTarget.getSort());

        yzTransformService.insertSelective(yzTransform);

    }

}