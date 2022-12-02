let id = (id) => document.getElementById(id);
let classes = (classes) => document.getElementsByClassName(classes);


let fullname = id("fullname"),
  password = id("password"),
  email = id("email"),
  form = id("form"),
  phone = id("phone"),
  confirmPassword = id("confirmPassword"),
  job = id("job");

let errorMsg = classes("error");




let checkBlank = (id, serial, message) => {
  if(id.value.trim() ==="") {
    errorMsg[serial].innerHTML = message;
  }
}

form.addEventListener("submit", (e) => {
  e.preventDefault();
  console.log("listen");
  checkBlank(fullname, 0, "Name can not be blank!");
  checkBlank(email, 1, "Email can not be blank!");
  checkBlank(phone, 2, "Phone can not be blank!");
  checkBlank(job, 3, "Job can not be blank!");
  checkBlank(password, 4, "Password can not be blank!");
  checkPassword();
});

let checkPassword = () => {
  if(confirmPassword.value !== password.value) {
    errorMsg[5].innerHTML = "Those passwords didn't match. Try again.";

  }
}