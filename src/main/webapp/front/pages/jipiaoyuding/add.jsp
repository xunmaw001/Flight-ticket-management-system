<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>注册</title>
		<!-- bootstrap样式，地图插件使用 -->
		<link rel="stylesheet" href="../../css/bootstrap.min.css" />
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style>
		html::after {
			position: fixed;
			top: 0;
			right: 0;
			left: 0;
			bottom: 0;
			content: '';
			display: block;
			background-attachment: fixed;
			background-size: cover;
			background-position: center;
			z-index: -1;
		}
		#swiper {
			overflow: hidden;
			margin: 0 auto;
		}
		#swiper .layui-carousel-ind li {
			width: 16px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 3px;
			background-color: #f7f7f7;
			box-shadow: 0 0 6px rgba(110,22,64,.8);
		}
		#swiper .layui-carousel-ind li.layui-this {
			width: 24px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 0;
			background-color: rgba(110,22,64,1);
			box-shadow: 0 0 6px rgba(110,22,64,.8);
		}
		
		button, button:focus {
			outline: none;
		}
		
		.data-add-container .add .layui-select-title .layui-unselect {
			padding: 0 12px;
			height: 40px;
			font-size: 14px;
			color: #333;
			border-radius: 0;
			border-width: 1px;
			border-style: solid;
			border-color: rgba(209, 209, 209, 1);
			background-color: #fff;
			box-shadow: 0 0 0px rgba(110,22,64,.8);
			text-align: left;
		}
		.data-add-container .add .layui-form-item {
			display: flex;
			align-items: center;
			justify-content: center;
		}
		.data-add-container .layui-form-pane .layui-form-item[pane] .layui-form-label {
			margin: 0;
			position: inherit;
			background: transparent;
			border: 0;
		}
		.data-add-container .add .layui-input-block {
			margin: 0;
			flex: 1;
		}
		.data-add-container .layui-form-pane .layui-form-item[pane] .layui-input-inline {
			margin: 0;
			flex: 1;
			display: flex;
		}
	</style>
	<body>


		<div id="app">
		
			<!-- 轮播图 -->
			<!-- <div class="layui-carousel" id="swiper">
				<div carousel-item id="swiper-item">
					<div v-for="(item,index) in swiperList" v-bind:key="index">
						<img class="swiper-item" :src="item.img">
					</div>
				</div>
			</div> -->
			<div class="layui-carousel" id="swiper" :style='{"boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"0 auto","borderColor":"rgba(0,0,0,.3)","borderRadius":"20px","borderWidth":"0","width":"100%","borderStyle":"solid"}'>
			  <div carousel-item id="swiper-item">
				<div v-for="(item,index) in swiperList" :key="index">
					<img style="width: 100%;height: 100%;object-fit:cover;" :src="item.img" />
				</div>
			  </div>
			</div>
			<!-- 轮播图 -->
		
			<div class="data-add-container">
		
				<form class="layui-form layui-form-pane" lay-filter="myForm">
					
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">订单编号：</label>
						<div class="layui-input-block">
							<input v-model="detail.dingdanbianhao" type="text" :readonly="ro.dingdanbianhao" name="dingdanbianhao" id="dingdanbianhao" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">航班编号：</label>
						<div class="layui-input-block">
							<input v-model="detail.hangbanbianhao" type="text" :readonly="ro.hangbanbianhao" name="hangbanbianhao" id="hangbanbianhao" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">航空公司：</label>
						<div class="layui-input-block">
							<input v-model="detail.hangkonggongsi" type="text" :readonly="ro.hangkonggongsi" name="hangkonggongsi" id="hangkonggongsi" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">航班：</label>
						<div class="layui-input-block">
							<input v-model="detail.hangban" type="text" :readonly="ro.hangban" name="hangban" id="hangban" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">出发地：</label>
						<div class="layui-input-block">
							<input v-model="detail.chufadi" type="text" :readonly="ro.chufadi" name="chufadi" id="chufadi" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">目的地：</label>
						<div class="layui-input-block">
							<input v-model="detail.mudedi" type="text" :readonly="ro.mudedi" name="mudedi" id="mudedi" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">出发时间：</label>
						<div class="layui-input-block">
							<input type="text" name="chufashijian" id="chufashijian" autocomplete="off" class="layui-input" >
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">类型：</label>
						<div class="layui-input-block">
							<input v-model="detail.leixing" type="text" :readonly="ro.leixing" name="leixing" id="leixing" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">机票票价：</label>
						<div class="layui-input-block">
							<input v-model="detail.jipiaopiaojia" type="text" :readonly="ro.jipiaopiaojia" name="jipiaopiaojia" id="jipiaopiaojia" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">数量：</label>
						<div class="layui-input-block">
							<input v-model="detail.shuliang" type="text" :readonly="ro.shuliang" name="shuliang" id="shuliang" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">总价：</label>
						<div class="layui-input-block">
							<input v-model="zongjia" type="text" name="zongjia" id="zongjia" disabled="disabled" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">预定时间：</label>
						<div class="layui-input-block">
							<input type="text" name="yudingshijian" id="yudingshijian" autocomplete="off" class="layui-input" >
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">用户账号：</label>
						<div class="layui-input-block">
							<input v-model="detail.yonghuzhanghao" type="text" :readonly="ro.yonghuzhanghao" name="yonghuzhanghao" id="yonghuzhanghao" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">用户姓名：</label>
						<div class="layui-input-block">
							<input v-model="detail.yonghuxingming" type="text" :readonly="ro.yonghuxingming" name="yonghuxingming" id="yonghuxingming" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">联系方式：</label>
						<div class="layui-input-block">
							<input v-model="detail.lianxifangshi" type="text" :readonly="ro.lianxifangshi" name="lianxifangshi" id="lianxifangshi" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div class="layui-form-item" pane>
						<label class="layui-form-label">身份证：</label>
						<div class="layui-input-block">
							<input v-model="detail.shenfenzheng" type="text" :readonly="ro.shenfenzheng" name="shenfenzheng" id="shenfenzheng" autocomplete="off" class="layui-input">
						</div>
					</div>
		            
		
					<div class="layui-form-item">
						<div class="layui-input-block" style="text-align: right;margin-right: 30px;">
							<button  class="layui-btn btn-submit" lay-submit lay-filter="*">提交</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<script src="../../layui/layui.js"></script>
		<script src="../../js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>
		<!-- 校验格式工具类 -->
		<script src="../../js/validate.js"></script>
		<!-- 地图 -->
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=ca04cee7ac952691aa67a131e6f0cee0"></script>
		<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../../js/bootstrap.AMapPositionPicker.js"></script>

		<script>
			var jquery = $;
			
			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					baseurl: '',
					dataList: [],
					ro:{
                                        dingdanbianhao : false,
                                        hangbanbianhao : false,
                                        hangkonggongsi : false,
                                        hangban : false,
                                        chufadi : false,
                                        mudedi : false,
                                        chufashijian : false,
                                        leixing : false,
                                        jipiaopiaojia : false,
                                        shuliang : false,
                                        zongjia : false,
                                        yudingshijian : false,
                                        yonghuzhanghao : false,
                                        yonghuxingming : false,
                                        lianxifangshi : false,
                                        shenfenzheng : false,
                                        ispay : false,
					},
                    detail: {
                        dingdanbianhao: genTradeNo(),
                        hangbanbianhao: '',
                        hangkonggongsi: '',
                        hangban: '',
                        chufadi: '',
                        mudedi: '',
                        chufashijian: '',
                        leixing: '',
                        jipiaopiaojia: '',
                        shuliang: '',
                        zongjia: '',
                        yudingshijian: '',
                        yonghuzhanghao: '',
                        yonghuxingming: '',
                        lianxifangshi: '',
                        shenfenzheng: '',
                        ispay: '',
                    },
					centerMenu: centerMenu
				},
				updated: function() {
					layui.form.render('select', 'myForm');
				},
                computed: {
                    zongjia:{
                    get: function () {
                        return 1*this.detail.jipiaopiaojia*this.detail.shuliang
                    }
                    },
                },
				methods: {
					jump(url) {
						jump(url)
					}
				}
			})


			layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'upload', 'laydate','tinymce'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var http = layui.http;
				var jquery = layui.jquery;
				var form = layui.form;
				var upload = layui.upload;
				var laydate = layui.laydate;
				var tinymce = layui.tinymce;
				vue.baseurl = http.baseurl;

				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 5
				}, function(res) {
					if (res.data.list.length > 0) {
						var swiperItemHtml = '';
						for (let item of res.data.list) {
							if (item.name.indexOf('picture') >= 0 && item.value && item.value != "" && item.value != null) {
								swiperItemHtml +=
									'<div>' +
									'<img style="width: 100%;height: 100%;object-fit:cover;" class="swiper-item" src="' + http.baseurl+item.value + '">' +
									'</div>';
							}
						}
						jquery('#swiper-item').html(swiperItemHtml);
						// 轮播图
						vue.$nextTick(() => {
						  carousel.render({
						  	elem: '#swiper',
							width: '100%',
						  	height: '250px',
						  	arrow: 'hover',
						  	anim: 'default',
						  	autoplay: 'true',
						  	interval: '3000',
						  	indicator: 'none'
						  });
						
						})
					}
				});

                                jquery('#chufashijian').val(getCurDateTime());
				laydate.render({
					elem: '#chufashijian',
					type: 'datetime'
				});
                                jquery('#yudingshijian').val(getCurDateTime());
				laydate.render({
					elem: '#yudingshijian',
					type: 'datetime'
				});
				
                // session独取
				let table = localStorage.getItem("userTable");
				http.request(`${table}/session`, 'get', {}, function(data) {
					// 表单赋值
					//form.val("myForm", data.data);
					data = data.data
					for(var key in data){
                        if(key=='yonghuzhanghao'){
                                vue.detail['yonghuzhanghao'] = data[`${key}`]
                                vue.ro.yonghuzhanghao = true;
                                continue;
                        }
                        if(key=='yonghuxingming'){
                                vue.detail['yonghuxingming'] = data[`${key}`]
                                vue.ro.yonghuxingming = true;
                                continue;
                        }
                        if(key=='lianxifangshi'){
                                vue.detail['lianxifangshi'] = data[`${key}`]
                                vue.ro.lianxifangshi = true;
                                continue;
                        }
                        if(key=='shenfenzheng'){
                                vue.detail['shenfenzheng'] = data[`${key}`]
                                vue.ro.shenfenzheng = true;
                                continue;
                        }
					}
				});

                // 跨表计算
                if(http.getParam('corss')){
					var obj = JSON.parse(localStorage.getItem('crossObj'));
					//form.val("myForm", obj);
					for(var o in obj){
                                        if(o=='dingdanbianhao'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.dingdanbianhao = true;
                                                continue;
                                        }
                                        if(o=='hangbanbianhao'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.hangbanbianhao = true;
                                                continue;
                                        }
                                        if(o=='hangkonggongsi'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.hangkonggongsi = true;
                                                continue;
                                        }
                                        if(o=='hangban'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.hangban = true;
                                                continue;
                                        }
                                        if(o=='chufadi'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.chufadi = true;
                                                continue;
                                        }
                                        if(o=='mudedi'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.mudedi = true;
                                                continue;
                                        }
                                        if(o=='chufashijian'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.chufashijian = true;
                                                jquery('#chufashijian').val(obj[o]);
                                                continue;
                                        }
                                        if(o=='leixing'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.leixing = true;
                                                continue;
                                        }
                                        if(o=='jipiaopiaojia'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.jipiaopiaojia = true;
                                                continue;
                                        }
                                        if(o=='shuliang'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.shuliang = true;
                                                continue;
                                        }
                                        if(o=='zongjia'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.zongjia = true;
                                                continue;
                                        }
                                        if(o=='yudingshijian'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.yudingshijian = true;
                                                jquery('#yudingshijian').val(obj[o]);
                                                continue;
                                        }
                                        if(o=='yonghuzhanghao'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.yonghuzhanghao = true;
                                                continue;
                                        }
                                        if(o=='yonghuxingming'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.yonghuxingming = true;
                                                continue;
                                        }
                                        if(o=='lianxifangshi'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.lianxifangshi = true;
                                                continue;
                                        }
                                        if(o=='shenfenzheng'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.shenfenzheng = true;
                                                continue;
                                        }
					}
				}
				

				// 提交
				form.on('submit(*)', function(data) {
					data = data.field;
					
                    // 数据校验
                    if(!isNumber(data.jipiaopiaojia)){
                        layer.msg('机票票价应输入数字', {
							time: 2000,
							icon: 5
						});
                        return false
                    }
                    if(!isIntNumer(data.shuliang)){
                        layer.msg('数量应输入整数', {
							time: 2000,
							icon: 5
						});
                        return false
                    }
                    if(!isNumber(data.zongjia)){
                        layer.msg('总价应输入数字', {
							time: 2000,
							icon: 5
						});
                        return false
                    }

					// 跨表计算判断
					
                    // 比较大小

                //更新跨表属性
               var crossuserid;
               var crossrefid;
               var crossoptnum;
                if(http.getParam('corss')){
                        var statusColumnName = localStorage.getItem('statusColumnName');
                        var statusColumnValue = localStorage.getItem('statusColumnValue');
                        if(statusColumnName!='') {
                                var obj = JSON.parse(localStorage.getItem('crossObj'));
				if(!statusColumnName.startsWith("[")) {
					for (var o in obj){
						if(o==statusColumnName){
							obj[o] = statusColumnValue;
						}
					}
					var table = localStorage.getItem('crossTable');
					http.requestJson(`${table}/update`,'post',obj,(res)=>{});
				} else {
                                       crossuserid=Number(localStorage.getItem('userid'));
                                       crossrefid=obj['id'];
                                       crossoptnum=localStorage.getItem('statusColumnName');
                                       crossoptnum=crossoptnum.replace(/\[/,"").replace(/\]/,"");
				}
                        }
                }
                        if(crossrefid && crossuserid) {
                                data.crossuserid=crossuserid;
                                data.crossrefid=crossrefid;
                                http.request('jipiaoyuding/list', 'get', {
                                        page: 1,
                                        limit: 10,
                                        crossuserid:crossuserid,
                                        crossrefid:crossrefid,
                                }, function(res) {
                                        if(res.data.total>=crossoptnum) {
                                                layer.msg(localStorage.getItem('tips'), {
                                                        time: 2000,
                                                        icon: 6
                                                })
                                             return false;
                                        } else {
                                            // 跨表计算



                                            // 提交数据
                                            http.requestJson('jipiaoyuding' + '/add', 'post', data, function(res) {
                                                    layer.msg('提交成功', {
                                                            time: 2000,
                                                            icon: 6
                                                    }, function() {
                                                            back();
                                                    });
                                             });
                                        }
                                });
                        } else {
                                // 跨表计算

                                // 提交数据
                                http.requestJson('jipiaoyuding' + '/add', 'post', data, function(res) {
                                        layer.msg('提交成功', {
                                                time: 2000,
                                                icon: 6
                                        }, function() {
                                                back();
                                        });
                                 });
                        }
			return false
			});
		});
		</script>
	</body>
</html>
