/*var username = document.getElementById('username');
var email = document.getElementById('email');
var password = document.getElementById('password');

let errorMsg = document.getElementsByClassName('error'),
  successIcon = document.getElementsByClassName('success-icon'),
  failureIcon = document.getElementsByClassName('failure-icon');*/

let id = (id) => document.getElementById(id); //tao ham id co tac dung lay id
let classes = (classes) => document.getElementsByClassName(classes);

let username = id("username"),
  password = id("password"),
  email = id("email"),
  errorMsg = classes("error"),
  successIcon = classes("success-icon"),
  failureIcon = classes("failure-icon");

//let form = document.getElementsByTagName("form"); Co can su dụng lenh khai bao này không

form.addEventListener("submit", (e) => {  //Nếu chỉ có 1 tag <form> thì có thể sử dụng tên tag để thay cho thẻ đó
  e.preventDefault();
  console.log("listen");
 /*form submit la dong goi ca form gui di nen se xay ra ca 3 su kiện
 Đây gọi là callback() trong js*/
 engine(username,0,"Username cannot be blank!");
 engine(email,1,"Email cannot be blank!");
 engine(password,2,"Password cannot be blank!");


});

let engine = (id, serial, message) => {
  if(id.value.trim() === "") {
    errorMsg[serial].innerHTML = message;
    successIcon[serial].style.opacity = "0";
    failureIcon[serial].style.opacity = "1";
    id.style.border = "2px solid red";
  } else {
    successIcon[serial].style.opacity = "1";
    failureIcon[serial].style.opacity = "0";
    errorMsg[serial].innerHTML = "";
    id.style.border = "2px solid green";
  }
};




