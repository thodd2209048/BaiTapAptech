/*window.onload =  init; //mo trang web co luon su kien
function init() {
    document.getElementById('bt1').onclick = changeHeading1;
}

function changeHeading1() {
    var elm = document.getElementById('heading1');
    elm.innerHTML = 'Hello';
}*/


document.getElementById('bt1').onclick = () => {
    document.getElementById('heading1').innerHTML='Hello'
}

document.getElementById('bt2').onclick = () => {
    document.getElementById('heading2').innerHTML='Good bye';
}

/*$('#bt1').onclick = () => {                     //This code can't run because file html didn't call jQuery library
    document.getElementById('heading1').innerHTML='Hello'
}*/