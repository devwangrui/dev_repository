(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(['exports', 'echarts'], factory);
    } else if (typeof exports === 'object' && typeof exports.nodeName !== 'string') {
        // CommonJS
        factory(exports, require('echarts'));
    } else {
        // Browser globals
        factory({}, root.echarts);
    }
}(this, function (exports, echarts) {
    var log = function (msg) {
        if (typeof console !== 'undefined') {
            console && console.error && console.error(msg);
        }
    };
    if (!echarts) {
        log('ECharts is not Loaded');
        return;
    }
    echarts.registerTheme('westeros', {
        "color": [
            "#10a8ab",
            "#fbb150",
            "#e64c66",
            "#3469af",
            "#4fc5f7",
            "#fabc6a",
            "#cc324c",
            "#1a4f95"
        ],
        "backgroundColor": "rgba(0,0,0,0)",
        "textStyle": {},
        "title": {
            "textStyle": {
                "color": "#ffffff"
            },
            "subtextStyle": {
                "color": "#93b7e3"
            }
        },
        "line": {
            "itemStyle": {
                "normal": {
                    "borderWidth": "2"
                }
            },
            "lineStyle": {
                "normal": {
                    "width": "1"
                }
            },
            "symbolSize": "6",
            "symbol": "circle",
            "smooth": true
        },
        "radar": {
            "itemStyle": {
                "normal": {
                    "borderWidth": "2"
                }
            },
            "lineStyle": {
                "normal": {
                    "width": "1"
                }
            },
            "symbolSize": "6",
            "symbol": "circle",
            "smooth": true
        },
        "bar": {
            "itemStyle": {
                "normal": {
                    "barBorderWidth": "0",
                    "barBorderColor": "#6b718a"
                },
                "emphasis": {
                    "barBorderWidth": "0",
                    "barBorderColor": "#6b718a"
                }
            }
        },
        "pie": {
            "itemStyle": {
                "normal": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                },
                "emphasis": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                }
            }
        },
        "scatter": {
            "itemStyle": {
                "normal": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                },
                "emphasis": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                }
            }
        },
        "boxplot": {
            "itemStyle": {
                "normal": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                },
                "emphasis": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                }
            }
        },
        "parallel": {
            "itemStyle": {
                "normal": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                },
                "emphasis": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                }
            }
        },
        "sankey": {
            "itemStyle": {
                "normal": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                },
                "emphasis": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                }
            }
        },
        "funnel": {
            "itemStyle": {
                "normal": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                },
                "emphasis": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                }
            }
        },
        "gauge": {
            "itemStyle": {
                "normal": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                },
                "emphasis": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                }
            }
        },
        "candlestick": {
            "itemStyle": {
                "normal": {
                    "color": "#e64c66",
                    "color0": "transparent",
                    "borderColor": "#e64c66",
                    "borderColor0": "#10a8ab",
                    "borderWidth": "2"
                }
            }
        },
        "graph": {
            "itemStyle": {
                "normal": {
                    "borderWidth": "0",
                    "borderColor": "#6b718a"
                }
            },
            "lineStyle": {
                "normal": {
                    "width": "1",
                    "color": "#6b718a"
                }
            },
            "symbolSize": "6",
            "symbol": "circle",
            "smooth": true,
            "color": [
                "#10a8ab",
                "#fbb150",
                "#e64c66",
                "#3469af",
                "#4fc5f7",
                "#fabc6a",
                "#cc324c",
                "#1a4f95"
            ],
            "label": {
                "normal": {
                    "textStyle": {
                        "color": "#ffffff"
                    }
                }
            }
        },
        "map": {
            "itemStyle": {
                "normal": {
                    "areaColor": "#8cecfe",
                    "borderColor": "#516b91",
                    "borderWidth": 0.5
                },
                "emphasis": {
                    "areaColor": "rgba(41,192,214,1)",
                    "borderColor": "#516b91",
                    "borderWidth": 1
                }
            },
            "label": {
                "normal": {
                    "textStyle": {
                        "color": "#ffffff"
                    }
                },
                "emphasis": {
                    "textStyle": {
                        "color": "rgb(255,255,255)"
                    }
                }
            }
        },
        "geo": {
            "itemStyle": {
                "normal": {
                    "areaColor": "#8cecfe",
                    "borderColor": "#516b91",
                    "borderWidth": 0.5
                },
                "emphasis": {
                    "areaColor": "rgba(41,192,214,1)",
                    "borderColor": "#516b91",
                    "borderWidth": 1
                }
            },
            "label": {
                "normal": {
                    "textStyle": {
                        "color": "#ffffff"
                    }
                },
                "emphasis": {
                    "textStyle": {
                        "color": "rgb(255,255,255)"
                    }
                }
            }
        },
        "categoryAxis": {
            "axisLine": {
                "show": true,
                "lineStyle": {
                    "color": "#6b718a"
                }
            },
            "axisTick": {
                "show": true,
                "lineStyle": {
                    "color": "#6b718a"
                }
            },
            "axisLabel": {
                "show": true,
                "textStyle": {
                    "color": "#ffffff"
                }
            },
            "splitLine": {
                "show": false,
                "lineStyle": {
                    "color": [
                        "#eeeeee"
                    ]
                }
            },
            "splitArea": {
                "show": false,
                "areaStyle": {
                    "color": [
                        "rgba(250,250,250,0.05)",
                        "rgba(200,200,200,0.02)"
                    ]
                }
            }
        },
        "valueAxis": {
            "axisLine": {
                "show": true,
                "lineStyle": {
                    "color": "#6b718a"
                }
            },
            "axisTick": {
                "show": true,
                "lineStyle": {
                    "color": "#6b718a"
                }
            },
            "axisLabel": {
                "show": true,
                "textStyle": {
                    "color": "#ffffff"
                }
            },
            "splitLine": {
                "show": false,
                "lineStyle": {
                    "color": [
                        "#eeeeee"
                    ]
                }
            },
            "splitArea": {
                "show": false,
                "areaStyle": {
                    "color": [
                        "rgba(250,250,250,0.05)",
                        "rgba(200,200,200,0.02)"
                    ]
                }
            }
        },
        "logAxis": {
            "axisLine": {
                "show": true,
                "lineStyle": {
                    "color": "#6b718a"
                }
            },
            "axisTick": {
                "show": true,
                "lineStyle": {
                    "color": "#6b718a"
                }
            },
            "axisLabel": {
                "show": true,
                "textStyle": {
                    "color": "#ffffff"
                }
            },
            "splitLine": {
                "show": false,
                "lineStyle": {
                    "color": [
                        "#eeeeee"
                    ]
                }
            },
            "splitArea": {
                "show": false,
                "areaStyle": {
                    "color": [
                        "rgba(250,250,250,0.05)",
                        "rgba(200,200,200,0.02)"
                    ]
                }
            }
        },
        "timeAxis": {
            "axisLine": {
                "show": true,
                "lineStyle": {
                    "color": "#6b718a"
                }
            },
            "axisTick": {
                "show": true,
                "lineStyle": {
                    "color": "#6b718a"
                }
            },
            "axisLabel": {
                "show": true,
                "textStyle": {
                    "color": "#ffffff"
                }
            },
            "splitLine": {
                "show": false,
                "lineStyle": {
                    "color": [
                        "#eeeeee"
                    ]
                }
            },
            "splitArea": {
                "show": false,
                "areaStyle": {
                    "color": [
                        "rgba(250,250,250,0.05)",
                        "rgba(200,200,200,0.02)"
                    ]
                }
            }
        },
        "toolbox": {
            "iconStyle": {
                "normal": {
                    "borderColor": "#6b718a"
                },
                "emphasis": {
                    "borderColor": "#979bad"
                }
            }
        },
        "legend": {
            "textStyle": {
                "color": "#ffffff"
            }
        },
        "tooltip": {
            "axisPointer": {
                "lineStyle": {
                    "color": "#4fc5f7",
                    "width": 1
                },
                "crossStyle": {
                    "color": "#4fc5f7",
                    "width": 1
                }
            }
        },
        "timeline": {
            "lineStyle": {
                "color": "#4fc5f7",
                "width": 1
            },
            "itemStyle": {
                "normal": {
                    "color": "#4fc5f7",
                    "borderWidth": "1"
                },
                "emphasis": {
                    "color": "#4fc5f7"
                }
            },
            "controlStyle": {
                "normal": {
                    "color": "#4fc5f7",
                    "borderColor": "#4fc5f7",
                    "borderWidth": 0.5
                },
                "emphasis": {
                    "color": "#4fc5f7",
                    "borderColor": "#4fc5f7",
                    "borderWidth": 0.5
                }
            },
            "checkpointStyle": {
                "color": "#4fc5f7",
                "borderColor": "rgba(138,124,168,0.37)"
            },
            "label": {
                "normal": {
                    "textStyle": {
                        "color": "#4fc5f7"
                    }
                },
                "emphasis": {
                    "textStyle": {
                        "color": "#4fc5f7"
                    }
                }
            }
        },
        "visualMap": {
            "color": [
                "#ffffff",
                "#59c4e6",
                "#a5e7f0"
            ]
        },
        "dataZoom": {
            "backgroundColor": "rgba(0,0,0,0)",
            "dataBackgroundColor": "rgba(255,255,255,0.3)",
            "fillerColor": "rgba(167,183,204,0.4)",
            "handleColor": "#a7b7cc",
            "handleSize": "100%",
            "textStyle": {
                "color": "#ffffff"
            }
        },
        "markPoint": {
            "label": {
                "normal": {
                    "textStyle": {
                        "color": "#ffffff"
                    }
                },
                "emphasis": {
                    "textStyle": {
                        "color": "#ffffff"
                    }
                }
            }
        }
    });
}));
