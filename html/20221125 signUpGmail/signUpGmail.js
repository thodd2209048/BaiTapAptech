let id = (id) => document.getElementById(id);
  classes = (classes) => document.getElementsByClassName(classes);
  tag = (tag) => document.getElementsByTagName(tag);

let msg = classes("msg"),
  inputField = classes("inputField"),
  inputContainer = classes("input-container");

const reName = /^[a-z,.'-]+$/i, //Chấp nhận chữ cái và các ký tự , . ' -
reUsername = /^[a-z]+[a-z0-9.]{4,28}[a-z0-9]$/i, // Chấp nhận chữ, số và ký tự . Ký tự . không được nằm ở cuối. Ký tự . và số không được nằm ở đầu
rePassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#\$%\^&\*])(?=.{8,})/; //Chép của thày, làm không nổi

let blankCheck = (noInput) => inputField[noInput].value.trim() ===""? true : false;  //không nên để tham số như thế này vì không trực quan, 
let checkCharacter = (noInput,re) => {                                                //khó xem lại code. Lần sau, viết tham số theo tên từng ô input để code dễ hiểu hơn.
  return !re.test(inputField[noInput].value);
};
let checkLength = (noInput, min, max) => inputField[noInput].value.length < min || inputField[noInput].value.length > max ? true : false;

// CHECK NAME

let checkNameBlank = () => {
  if(blankCheck(0)) {
    inputContainer[0].dataset.value  *= 0;
    msg[0].innerText = "Enter first name";
  }
  if(blankCheck(1)) {
    inputContainer[1].dataset.value  *= 0;
    msg[0].innerText = "Enter last name";
  }
  if(blankCheck(0) && blankCheck(1)) {
    msg[0].innerText = "Enter first name and last name";
  }
};

let checkFullNameCharacter = () => {
  if (checkCharacter(0, reName)) {
    inputContainer[0].dataset.value  *= 0;
    msg[0].innerText = "Are you sure you entered your name correctly";
  } 
  if (checkCharacter(1, reName)) {
    inputContainer[1].dataset.value  *= 0;
    msg[0].innerText = "Are you sure you entered your name correctly";
  } 
};

let checkFullName = () => {
  checkNameBlank();
  if (msg[0].innerText === "") {
    checkFullNameCharacter();
  }
};


// CHECK USERNAME

let checkUsernameBlank = () => {
  if(blankCheck(2)) {
    inputContainer[2].dataset.value  *= 0;
    msg[1].innerText = "Chose a Gmail address";
    msg[1].style.color = "#D93025";
  };
};

let checkUsernameLength = () => {
  if (checkLength(2, 6, 30)) {
    inputContainer[2].dataset.value  *= 0;
    msg[1].innerText = "Sorry, your username must be between 6 and 30 characters long.";
    msg[1].style.color = "#D93025";
  };
};

let isUsernameCharacterError = () => {
  if(checkCharacter(2, reUsername)) {
    inputContainer[2].dataset.value  *= 0;
    msg[1].innerText = "Sorry, only letters (a-z), numbers (0-9), and periods (.) are allowed.";
    msg[1].style.color = "#D93025";
  };
};


let checkUsername = () => {
  checkUsernameBlank();
  if (msg[1].innerText === "") {
    checkUsernameLength();
  };
  if(msg[1].innerText === "") {
    isUsernameCharacterError();
  };
};

//CHECK PASSWORD

let checkPasswordBlank = () => {
  if(blankCheck(3)) {
    inputContainer[3].dataset.value  *= 0;
    msg[2].innerText = "Enter a password";
    msg[2].style.color = "#D93025";
  };
};

let checkPasswordLength = () => {
  if(checkLength(3, 8, Infinity)) {
    inputContainer[3].dataset.value  *= 0;
    msg[2].innerText = "Use 8 characters or more for your password";
    msg[2].style.color = "#D93025";
  }
};

let isPasswordCharacterError = () => {
  if(checkCharacter(3, rePassword)) {
    inputContainer[3].dataset.value  *= 0;
    msg[2].innerText = "Please choose a stronger password. Try a mix of letters, numbers, and symbols.";
    msg[2].style.color = "#D93025";
  };
};

let isMatchPassword = () => {
  if(inputField[3].value !== inputField[4].value) {
    msg[2].innerText = "Those passwords didn't match. Try again.";
    msg[2].style.color = "#D93025";
  }
}


let checkPassword = () => {
  checkPasswordBlank();
  if (msg[2].innerText === "") {
    checkPasswordLength();
  };
  if (msg[2].innerText === "") {
    isPasswordCharacterError();
  };
  if (msg[2].innerText === "") {
    isMatchPassword();
  };
}

function clearMsg() {
  for(let i = 0; i < 5; i++) {
    inputContainer[i].dataset.value = 1; 
    if(i > 2) {
      continue;
    }
    msg[i].innerText = '';
  };
}

//Final

function togglePassword() {
  let inputPassword = classes("inputPassword");
  for(let i = 0; i<inputPassword.length; i++) {
    if(inputPassword[i].type === "password") {
      inputPassword[i].type = "text";
    } else {
      inputPassword[i].type = "password"
    }
  }
}

function checkAll() {
  clearMsg();
  checkFullName();
  checkUsername();
  checkPassword();
}
