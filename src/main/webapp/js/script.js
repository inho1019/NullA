const bl = document.getElementById('boardList');
const br = document.getElementById('boardRead'); 
const bu = document.getElementById('boardUpdate'); 
const bw = document.getElementById('boardWrite');
const bsch = document.getElementById('boardSearch');
const cs = document.getElementById('projectSec');
const bs = document.getElementById('boardSec');

const pu = document.getElementById('projectUpload');
const pl = document.getElementById('projectList');
const hdnpb = document.getElementById('hdnPB');

const lb = document.querySelectorAll('.lefbut');
const rb = document.querySelectorAll('.rigbut');
const listItem = document.querySelectorAll('.listItem');
const sitem = document.querySelectorAll('.searchItem');
const pitem = document.querySelectorAll('.projectItem');
const sdata = document.getElementById('searchBoard');
const us = document.getElementById('userSec');
const lg = document.getElementById('login');
const rg = document.getElementById('register');
const ug = document.getElementById('user');
const sessionName = document.getElementById('sessionName').value
const upbut = document.getElementById('upbut');
const delbut = document.getElementById('delbut');

let ssw = 0;

if(sessionName != 'null') {
	us.style.transition = "0s";
	us.style.height= "80px";
}

$('input').keydown(function(event) {
  if (event.keyCode === 13) {
    event.preventDefault();
  };
});

$('#see').click(function(){
	if($('#pass').attr('type') == 'password') {
		$('#pass').attr('type','text')
		$('#see').text('(숨기기)')
	} else {
		$('#pass').attr('type','password')
		$('#see').text('(보기)')
	}
})
sdata.addEventListener("input",function(){
	var ssel = document.getElementById('searchSel');
	for(let i = 0;i < sitem.length;i++) {
		if(ssel.value == 1) {
			if(sitem[i].querySelector('input[name="title"]').value.includes(sdata.value)) 
			sitem[i].style.display = "block";
			else sitem[i].style.display = "none";
		} else if(ssel.value == 2) {
			if(sitem[i].querySelector('input[name="content"]').value.includes(sdata.value)) 
			sitem[i].style.display = "block";
			else sitem[i].style.display = "none";
		} else if(ssel.value == 3) {
			if(sitem[i].querySelector('input[name="writer"]').value.includes(sdata.value)) 
			sitem[i].style.display = "block";
			else sitem[i].style.display = "none";
		}
	}
});
function xBut() {
	for(let i = 0;i < lb.length;i++) lb[i].disabled = true;
	for(let i = 0;i < rb.length;i++) rb[i].disabled = true;
	for(let i = 0;i < listItem.length;i++) listItem[i].disabled = true;
	for(let i = 0;i < sitem.length;i++) sitem[i].disabled = true;
}
function oBut() {
	for(let i = 0;i < lb.length;i++) lb[i].disabled = false;
	for(let i = 0;i < rb.length;i++) rb[i].disabled = false;
	for(let i = 0;i < listItem.length;i++) listItem[i].disabled = false;
	for(let i = 0;i < sitem.length;i++) sitem[i].disabled = false;
}
function checkInput(a,b) {
	var btt = document.querySelectorAll('.boardTT');
	var bta = document.querySelectorAll('.boardTA');
	if(btt[a].value == "") btt[a].placeholder = "제목을 입력해주세요";
	else if(bta[a].value == "") bta[a].placeholder = "내용을 입력해주세요";
	else {
		if (b == 0) document.writeForm.submit();
		else if (b == 1) document.updateForm.submit();
		xBut();
	}
}
function mvWrite() {
	xBut();
	bl.style.animation = "fadeout 0.4s"
	cs.style.height = "0px";
	cs.style.opacity = "0";
	bs.style.height = "450px";
	setTimeout(() => {
		bl.style.display = "none";
        bw.style.display = "block";
        bw.style.animation = "fadein 1s"
        setTimeout(() => {
        	oBut();
        }, 590);
    }, 390);
}
function mvSearch(a) {
	if (a == 1) {	
		var ssel = document.getElementById('searchSel');
		ssel.value = 3;
		sdata.value = sessionName;
		for(let i = 0;i < sitem.length;i++) {
			if(sitem[i].querySelector('input[name="writer"]').value.includes(sdata.value)) 
			sitem[i].style.display = "block";
			else sitem[i].style.display = "none";
		}
	}
	xBut();
	ssw = 1;
	bl.style.animation = "fadeout 0.4s"
	cs.style.height = "0px";
	cs.style.opacity = "0";
	bs.style.height = "450px";
	setTimeout(() => {
		bl.style.display = "none";
        bsch.style.display = "block";
        bsch.style.animation = "fadein 1s"
        setTimeout(() => {
        	oBut();
        }, 590);
    }, 390);
}
function backWrite(bp) {
	if (ssw == 0 || sdata == null || bp == 'boardSearch') {
		xBut();
		var bwr = document.getElementById(bp);
		bwr.style.animation = "fadeout 0.4s"
		cs.style.height = "250px";
		cs.style.opacity = "1";
		bs.style.height = "330px";
		setTimeout(() => {
			bl.style.display = "block";
	        bwr.style.display = "none";
	        bl.style.animation = "fadein 1s"
	        oBut();
	    }, 390);
	    if(bp == 'boardSearch') {
			ssw = 0;
			sdata.value = null;
		}
	} else {
		xBut();
		bs.style.animation = "rollleft 1s"
		br.style.animation = "fadeout 1s"
		setTimeout(() => {
		bsch.style.display = "block";
        br.style.display = "none";
        bs.style.animation = "rollright 1s"
        bsch.style.animation = "fadein 2s"
        oBut();
    }, 990);
	}
}
function mvRead(title,writer,content,num,logtime) {
	xBut();
	document.getElementById('hdnR').value = num;
	document.getElementById('readTitle').innerHTML = title;
	document.getElementById('readWriter').innerHTML = writer;
	document.getElementById('readContent').innerHTML = content;
	document.getElementById('readDate').innerHTML = logtime;
	if (sessionName == writer || sessionName == "admin") {
		upbut.style.display = "block";
		delbut.style.display = "block";
	} else {
		upbut.style.display = "none";
		delbut.style.display = "none";
	}
	bl.style.animation = "fadeout 0.4s"
	cs.style.height = "0px";
	cs.style.opacity = "0";
	bs.style.height = "450px";
	setTimeout(() => {
		bl.style.display = "none";
        br.style.display = "block";
        br.style.animation = "fadein 1s"
        setTimeout(() => {
        	oBut();
        }, 590);
    }, 390);
}
function mvReadS(title,writer,content,num,logtime) {
	xBut();
	sdata.disabled = true;
	document.getElementById('hdnR').value = num;
	document.getElementById('readTitle').innerHTML = title;
	document.getElementById('readWriter').innerHTML = writer;
	document.getElementById('readContent').innerHTML = content;
	document.getElementById('readDate').innerHTML = logtime;
	if (sessionName == writer || sessionName == "admin") {
		upbut.style.display = "block";
		delbut.style.display = "block";
	} else {
		upbut.style.display = "none";
		delbut.style.display = "none";
	}
	bs.style.animation = "rollleft 1s"
	bsch.style.animation = "fadeout 1s"
	setTimeout(() => {
		bsch.style.display = "none";
        br.style.display = "block";
        bs.style.animation = "rollright 1s"
        br.style.animation = "fadein 2s"
        sdata.disabled = false;
        oBut();
    }, 990);
}
function mvUpdate() {
	xBut();
	document.getElementById('hdnU').value = document.getElementById('hdnR').value;
	document.querySelectorAll('.boardTT')[1].value = document.getElementById('readTitle').textContent;
	document.querySelectorAll('.boardTA')[1].value = document.getElementById('readContent').textContent;
	bs.style.animation = "rollleft 1s"
	br.style.animation = "fadeout 1s"
	setTimeout(() => {
		br.style.display = "none";
        bu.style.display = "block";
        bs.style.animation = "rollright 1s"
        bu.style.animation = "fadein 2s"
        oBut();
    }, 990);
}
function upCancel() {
	xBut();
	bs.style.animation = "rollleft 1s"
	bu.style.animation = "fadeout 1s"
	setTimeout(() => {
		br.style.display = "block";
        bu.style.display = "none";
        bs.style.animation = "rollright 1s"
        br.style.animation = "fadein 2s"
        oBut();
    }, 990);
}
function login() {
	us.style.height= "280px";
	ug.style.display = "none";
	lg.style.display = "block";
	lg.style.animation = "fadein 1.5s ease-in-out"
}
function backLogin(a) {
	var lrs = document.getElementById(a);
	lrs.style.display = "none";
	us.style.height= "40px";
	ug.style.display = "block";
	ug.style.animation = "fadein 1.5s"
}
function register() {
	lg.style.display = "none";
	us.style.height= "40px";
	setTimeout(() => {
		us.style.height= "360px";
		rg.style.display = "block";
		rg.style.animation = "fadein 1.5s ease-in-out"
    }, 600);
}
function mvUpload() {
	xBut();
	pl.style.animation = "fadeout 0.4s"
	bs.style.height = "0px";
	bs.style.opacity = "0";
	cs.style.height = "500px";
	setTimeout(() => {
		pl.style.display = "none";
        pu.style.display = "block";
        pu.style.animation = "fadein 1s"
        setTimeout(() => {
        	oBut();
        }, 590);
    }, 390);
}
function backUpload() {
	/*if (ssw == 0 || sdata == null || bp == 'boardSearch') {*/
	xBut();
	var bwr = document.getElementById('projectUpload');
	bwr.style.animation = "fadeout 0.4s"
	bs.style.height = "330px";
	bs.style.opacity = "1";
	cs.style.height = "250px";
	setTimeout(() => {
		pl.style.display = "block";
        bwr.style.display = "none";
        pl.style.animation = "fadein 1s"
        oBut();
    }, 390);
    /*if(bp == 'boardSearch') {
		ssw = 0;
		sdata.value = null;
	}
	} else {
		xBut();
		bs.style.animation = "rollleft 1s"
		br.style.animation = "fadeout 1s"
		setTimeout(() => {
		bsch.style.display = "block";
        br.style.display = "none";
        bs.style.animation = "rollright 1s"
        bsch.style.animation = "fadein 2s"
        oBut();
    }, 990);
	}*/
}
function checkUpload() {
	var pur = document.querySelector('.projectUR');
	var ptt = document.querySelector('.projectTT');
	var pta = document.querySelector('.projectTA');
	if (pur.value == "") pur.placeholder = "프로젝트 링크를 입력해주세요"
	else if (ptt.value == "") ptt.placeholder = "제목을 입력해주세요"
	else if (pta.value == "") pta.placeholder = "내용을 입력해주세요"
	else {
		document.uploadForm.submit();
		xBut();
	}
}

let scroll = 0;
function wheel(e) {
  e.preventDefault();
}
function mvScroll(a) {
	var prb = document.getElementById('projectBox');
	scroll= scroll + a;
	if (scroll == -10) {
		prb.style.animation="scrollendup 0.8s";
		scroll = 0;
		setTimeout(() => {
			prb.style.animation="0s";
		}, 800);
	} else if(scroll > hdnpb.value) {
		prb.style.animation="scrollenddown 0.8s";
		scroll -= 10;
		setTimeout(() => {
			prb.style.animation="0s"
		}, 800);
	} else {
	   	pitem[scroll].scrollIntoView({behavior:'smooth',block: 'nearest'});
	   	document.addEventListener('wheel', wheel, { passive: false });
	   	setTimeout(() => {
			document.removeEventListener('wheel', wheel);
	    }, 1000);
    }
}

