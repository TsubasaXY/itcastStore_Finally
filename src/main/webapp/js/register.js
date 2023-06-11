var emailObj;
var usernameObj;
var passwordObj;
var confirmObj;
var telObj;
var telMsg;
var emailMsg;
var usernameMsg;
var passwordMsg;
var confirmMsg;

window.onload = function() {	// 页面加载之后, 获取页面中的对象
    emailObj = document.getElementById("InputEmail1");
    usernameObj = document.getElementById("username");
    passwordObj = document.getElementById("password");
    confirmObj = document.getElementById("regpassword");
    telObj = document.getElementById("phone");
    telMsg = document.getElementById("span5");
    emailMsg = document.getElementById("span1");
    usernameMsg = document.getElementById("span2");
    passwordMsg = document.getElementById("span3");
    confirmMsg = document.getElementById("confirmMsg");
};

// function checkForm() {			// 验证整个表单
//     var bEmail = checkEmail();
//     var bUsername = checkUsername();
//     var bPassword = checkPassword();
//     var bConfirm = checkConfirm();
//     return bUsername && bPassword && bConfirm && bEmail ;	// return false后, 事件将被取消
// }

function checkEmail() {			// 验证邮箱
    var regex = /^[\w-]+@([\w-]+\.)+[a-zA-Z]{2,4}$/;
    var value =emailObj.value;
    var msg = "√";
    if (!value)
        msg = "邮箱必须填写!";
    else if (!regex.test(value))
        msg = "邮箱格式不合法!";
    emailMsg.innerHTML = msg;
    emailObj.parentNode.parentNode.style.color = msg == "√" ? "black" : "red";
    return msg == "√";
}

function checkUsername(){
    var regex = /^[a-zA-Z_]\w{0,9}$/;
    var value = usernameObj.value;
    var msg = "√";
    if (!value)
        msg = "用户名必须填写!";
    else if (!regex.test(value))
        msg = "用户名不合法!";
    usernameMsg.innerHTML = msg;
    usernameObj.parentNode.parentNode.style.color = msg == "√" ? "black" : "red";
    return msg == "√";
}


function checkPassword() {		// 验证密码
    var regex = /^.{6,16}$/;			// 任意字符, 6到16位
    var value = passwordObj.value;
    var msg = "√";
    if (!value)
        msg = "密码必须填写!";
    else if (!regex.test(value))
        msg = "密码不合法!";
    passwordMsg.innerHTML = msg;
    passwordObj.parentNode.parentNode.style.color = msg == "√" ? "black" : "red";
    return msg == "√";
}

function checkConfirm() {		// 验证确认密码
    var passwordValue = passwordObj.value;
    var confirmValue = confirmObj.value;
    var msg = "√";

    if(!confirmValue){
        msg = "确认密码必须填写";
    }
    else	if (passwordValue != confirmValue){
        msg = "密码必须保持一致";
    }
    confirmMsg.innerHTML = msg;
    confirmObj.parentNode.parentNode.style.color = msg == "√" ? "black" : "red";
    return msg == "√";
}
function checkPhone(){
    var regex = /^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])\d{8}$/;
    var value =telObj.value;
    var msg = "√";
    if (!value)
        msg = "手机号必须填写!";
    else if (!regex.test(value))
        msg = "手机号格式不合法!";
    telMsg.innerHTML = msg;
    telObj.parentNode.parentNode.style.color = msg == "√" ? "black":"red";
    return msg == "√";
}