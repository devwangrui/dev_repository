$(function(){
    $('#sql2_div').hide();
    $('#datatable-responsive').on('click', '.s_edit', function(){
        var id = $(this).siblings('input').eq(0).val();
        var title = $(this).parent('td').siblings().eq(2).text();
        var rank = $(this).parent('td').siblings().eq(3).text();
        var remark = $(this).parent('td').siblings().eq(4).text();
        var s_one = $(this).siblings('input').eq(1).val();
        var s_two = $(this).siblings('input').eq(2).val();
        var bm = $(this).siblings('input').eq(3).val();
        var stand = $(this).siblings('input').eq(4).val();
        var stand_sort = $(this).siblings('input').eq(5).val();
        var data_title = $(this).siblings('input').eq(6).val();
        var data_id = $(this).siblings('input').eq(8).val();
        var update_sort = $(this).siblings('input').eq(9).val();
        //var sql = $(this).siblings('input').eq(6).val();
        var stand_sort_s = $(this).siblings('input').eq(7).val();
        //var sql2 = $(this).siblings('input').eq(8).val();
        var bm_arr = bm.split(',');
        $('#id').val(id);
        $('#title').val(title);
        $('#rank').val(rank);
        $('#remark').val(remark);
        $('#one_select').val(s_one);
        $('#two_select').val(s_two);
        $('#stand').val(stand);
        $('#stand_sort').val(stand_sort);
        $('#data_title').val(data_title);
        $('#data_id').val(data_id);
        $('#stand_sort_s').val(stand_sort_s);
        $('#update_sort').val(update_sort);
        for(var i = 0 ;i<bm_arr.length; i++){
            $('#bm').find('input[value='+bm_arr[i]+']').prop('checked', true);
            $('#bm').find('input[value='+bm_arr[i]+']').parent('div').addClass('checked');
        }
        setTimeout("",1000);
    })
    //判断是否显示sql2
    /*$('#stand_sort_s').change(function(){
        var val = $(this).val();
        if(val == 1){
            $('#sql2_div').hide();
        }else{
            $('#sql2_div').show();
        }
    })*/
    $('.s_add').click(function(){
        var id = $(this).siblings('input').eq(0).val();
        $('#pid').val(id);
    })
    //重置已选内容
    $('.add').click(function(){
        $('#demo-form2')[0].reset();
        $('#id').val(0);
    })
    //选择一级指标显示二级指标选项
    $('#one_select').change(function(){
        var id = $(this).val();
        init_target_s();
        $('.one_'+id).show();
        $('#two_select').val(null);
    })
    //初始化一二级指标select
    function init_target_s(){
        $('#two_select').find('option').hide();
        $('#two_select').find('option').eq(0).show();
    }

    //ajax查询推送人
    $('#data_title').autocompleter({
        source: URL+'/select_data',
        selectFirst: true,
        highlightMatches: true,
        template: '{{ title }}',
        customValue: 'id',
        customLabel: 'title',
        empty: false,
        focusOpen: false,
        changeWhenSelect: false,
        cache: true,
        callback: function(value, index, data) {
            $('#data_title').val(data.title);
            $('#data_id').val(data.id);
        }
    });

    init_target_s();
});



