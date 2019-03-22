$(function() {

	/* 导航固定 */
	$(window).scroll(function() {
		let a = $(this).scrollTop();
		if (a > 200) $(".navbar").addClass('fixBar');
		if (a <= 200) $(".navbar").removeClass('fixBar');
	});
	
	/* 二级导航 */
	
	$(".navbar>ul>li").hover(function(){
		$(this).find('.er_ji').stop(true).slideDown(100);
	},function(){
		$(this).find('.er_ji').stop(true).slideUp(100);
	});
	
	/*首页图上移变大*/
	$('.kjBox .kjBox_t').hover(function() {
		bgi = $(this).css('background-image');
		bgiB = $(this).css('background-image').split('images/')[1].split('.png')[0];
		lh = $(this).find('p').css('line-height');
		$(this).css({
			"background-image": 'url(images/' + bgiB + '_big.png)'
		});
// 		$(this).find('p').css({
// 			"margin-left": "-20px",
// 			"line-height": function() {
// 				return parseFloat(lh) - 10 + 'px';
// 			}
// 		});
	}, function() {
		$(this).css({
			"background-image": bgi
		});
		$(this).find('p').css({
			"margin-left": "0",
			"text-align": "center",
			"line-height": lh
		});
	});

	/*自定义下拉框*/
	$(".dropDown").click(function() {
		let rtt = $(this).find('.icon').attr('data_rtt');
		if (rtt == 90) {
			$(this).find('.icon').css({
				"transform": "rotate(270deg)"
			});
			rtt = 270;
			$(this).find('.droplist ul').fadeIn(500);
		} else {
			$(this).find('.icon').css({
				"transform": "rotate(90deg)"
			});
			rtt = 90;
			$(this).find('.droplist ul').fadeOut(500);
		};
		$(this).find('.icon').attr('data_rtt', rtt);
		$(this).find('.droplSb input').focus();
		$(".dropDown .droplist ul li").click(function() {
			let selT = $(this).text();
			$(this).parents('.dropDown').find('.p1').text(selT);
		});
		
		$("#droplistSearch").on('keyup',function(){
			var keyTip = $(this).val();
                if (keyTip == '') {
                    $(this).parent().siblings('li').show();
                }
                $(this).parent().siblings('li').hide().filter(":contains(" + keyTip.trim() + ")").show();
		})
	});
	/* 布局颜色调整 */
});
