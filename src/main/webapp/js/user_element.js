$(function(){
    //初始化选择框内容为空
    $('.two_select').find('option').hide();
    $('.t_select').find('option').hide();

    $('.form-group').on('change', '.one_select', function(){
        var id = $(this).val();
        $(this).parent('div').parent('div').find('.two_select').val('-1');
        $(this).parent('div').parent('div').find('.two_select').find('option').hide();
        $(this).parent('div').parent('div').find('.two_select').find('.two_'+id).show();
    });
    $('.form-group').on('change', '.two_select', function(){
        var id = $(this).val();
        $(this).parent('div').parent('div').find('.t_select').val('-1');
        $(this).parent('div').parent('div').find('.t_select').find('option').hide();
        $(this).parent('div').parent('div').find('.t_select').find('.t_'+id).show();
    });


    $('.form-group').on('click', '.add', function(){
        var con = $('#copy_div').clone(true).show().prop('id', '');
        $(this).parent('div').after(con);
    })

    $('.form-group').on('click', '.del', function(){
        $(this).parent('div').remove();
    });
})

function one_select(id, k){
    $('#one_'+k).val(id);
    $('#two_'+k).find('.two_'+id).show();
}
function two_select(id, k){
    $('#two_'+k).val(id);
    $('#t_'+k).find('.t_'+id).show();
}
function t_select(id, k){
    $('#t_'+k).val(id);
}