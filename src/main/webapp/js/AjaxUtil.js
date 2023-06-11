var usernameObj;

var usernameMsg;

var flag = false;   //判断是否进行ajax
var aUsername = false;  //ajax若判断此用户名合法，则设为true

//window.onload = function() {	// 页面加载之后, 获取页面中的对象
//	//选中输入的文本框标签
//	usernameObj = document.getElementById("username");
//
//	//选中显示内容的div标签
//	usernameMsg = document.getElementById("usernameMsg");
//
//	
//	$("#username").blur(function(){
//		   //获取username文本输入框的值
//		   var username=$(this).val();
//		   $.get("TestLoginAjaxAndJson",{username:username},function(data){  //下面表明server返回的数据类型为json，此处表面获得了json，再获得某个键的值
//			      // alert(data);
//			      //判断userExist键的值是否为true
//			      var span=$("#usernameMsg");  //方便输出值
//			      if(data.userExist){
//		    		  if(!flag){  //说明输入合法
//		    			  span.css("color","red");
//			    		  span.html(data.msg);
//		    		  }
//		    	  }else{
//		    		  if(!flag){   //说明输入合法
//		    				span.css("color","green");
//		    				span.html(data.msg);
//		    				aUsername = true;
//		    		  }
//		    	  }
//		   },"json");
//	});
//};

window.onload = function() {	// 页面加载之后, 获取页面中的对象
    //选中输入的文本框标签
    usernameObj = document.getElementById("username");

    //选中显示内容的div标签
    usernameMsg = document.getElementById("usernameMsg");


    $("#username").blur(function(){
        //获取username文本输入框的值
        var username=$(this).val();
        if(!flag){  //说明输入合法
            $.get("RegisterServlet",{username:username},function(data){  //下面表明server返回的数据类型为json，此处表面获得了json，再获得某个键的值
                // alert(data);
                //判断userExist键的值是否为true
                var span=$("#usernameMsg");  //方便输出值
                if(data.userExist){
                    span.css("color","red");
                    span.html(data.msg);
                    $("#update").attr("disabled", true);
                }else{
                    span.css("color","green");
                    span.html(data.msg);
                    aUsername = true;  //说明ajax判断输入用户名没有重名
                    $("#update").removeAttr("disabled");	//取消按钮disabled  因为点击提交，才会调用整个表单，而此处删除disabled，则点不了提交表单
                }
            },"json");
        }
    });
};



// /**
//  * 只要有一个事件位false，则提交表单失败，
//  * @returns
//  */
function checkForm() {			// 验证整个表单
    var bUsername = checkUsername();  //用户名

    var isTrue = bUsername && aUsername;
    if(!isTrue){
        alert("仔细核对");
        $("#update").attr("disabled", true);

        return false;
    }

    $("#update").removeAttr("disabled");
    return true;	// return false后, 事件将被取消
}

function checkUsername() {		// 验证用户名
    flag = false;   //【重点】
    var regex = /^[a-zA-Z_]\w{0,9}$/;	// 字母数字下划线1到10位, 不能是数字开头
    var value = usernameObj.value;// 获取usernameObj中的文本
    var msg = "";						// 最后的提示消息, 默认为空
    if (!value)							// 如果用户名没填, 填了就是一个字符串可以当作true, 没填的话不论null或者""都是false
        msg = "用户名必须填写：";			// 改变提示消息
    else if (!regex.test(value))		// 如果用户名不能匹配正则表达式规则
        msg = "用户名不合法：";			// 改变提示消息
    usernameMsg.innerHTML = msg;		// 将提示消息放入SPAN
    //去掉这个 "选择器之类的"
    usernameMsg.style.color = msg == "" ? "black" : "red";	// 根据消息结果改变tr的颜色

    if(msg != ""){  //说明输入不合法，则ajax不需要发送请求，故flag设为true
        flag = true;
    }

    return msg == "";					// 如果提示消息为空则代表没出错, 返回true
}




