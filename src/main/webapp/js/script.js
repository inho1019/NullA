const bl = document.getElementById('boardList');
const br = document.getElementById('boardRead'); 
const bu = document.getElementById('boardUpdate'); 
const bw = document.getElementById('boardWrite');
const bsch = document.getElementById('boardSearch');
const cs = document.getElementById('projectSec');
const bs = document.getElementById('boardSec');

const pu = document.getElementById('projectUpload');
const pl = document.getElementById('projectList');
const pt = document.getElementById('projectTop');
const prsc = document.getElementById('projectScroll');
const prbx = document.getElementById('projectBox');
const prr = document.getElementById('projectR');
const prm = document.getElementById('projectM');
const pr = document.getElementById('projectRead');
const scb = document.getElementById('scrollBut');
const st = document.getElementById('searchTop');
const pdata = document.getElementById('searchProject');
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
pdata.addEventListener("input",function(){
	var psel = document.getElementById('projectSel');
	for(let i = 0;i < pitem.length;i++) {
		if(psel.value == 1) {
			if(pitem[i].querySelector('input[name="title"]').value.includes(pdata.value)) 
			pitem[i].style.display = "inline-block";
			else pitem[i].style.display = "none";
		} else if(psel.value == 2) {
			if(pitem[i].querySelector('input[name="content"]').value.includes(pdata.value)) 
			pitem[i].style.display = "inline-block";
			else pitem[i].style.display = "none";
		} else if(psel.value == 3) {
			if(pitem[i].querySelector('input[name="writer"]').value.includes(pdata.value)) 
			pitem[i].style.display = "inline-block";
			else pitem[i].style.display = "none";
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
	oBut();
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
		resetB(0);
		resetP(1);	
		var ssel = document.getElementById('searchSel');
		ssel.value = 3;
		sdata.value = sessionName;
		for(let i = 0;i < sitem.length;i++) {
			if(sitem[i].querySelector('input[name="writer"]').value.includes(sdata.value)) 
			sitem[i].style.display = "block";
			else sitem[i].style.display = "none";
		}
	}
	if(psw == 1) {
		psw = 0;
		pdata.value = null;
		scroll = 0;
		st.style.display = "none";
		scb.style.display = "block";
		scb.style.animation="fadein 1s";
		prsc.style.overflow = "auto";
		prsc.style.overflowY = "hidden";
		prsc.style.height="";
		prsc.style.width="";
		prbx.style.width="2250px";
		prbx.style.textAlign="left";
		pt.style.display = "block";
	    pt.style.animation = "fadein 1s";
		for(let i = 0;i < pitem.length;i++) {pitem[i].style.display="none";};	   
	    setTimeout(() => {
			for(let i = 0;i < pitem.length;i++) {pitem[i].style.display="inline-block";};
		}, 340);
	}
	xBut();
	ssw = 1;
	bl.style.animation = "fadeout 0.4s"
	cs.style.height = "0px";
	cs.style.opacity = "0";
	bs.style.height = "450px";
	bs.style.opacity = "1";
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
}
function checkUpload(b) {
	var pur = document.querySelector('.projectUR');
	var ptt = document.querySelector('.projectTT');
	var pta = document.querySelector('.projectTA');
	if (pur.value == "") pur.placeholder = "프로젝트 링크를 입력해주세요"
	else if (ptt.value == "") ptt.placeholder = "제목을 입력해주세요"
	else if (pta.value == "") pta.placeholder = "내용을 입력해주세요"
	else {
		if (b == 0) document.uploadForm.submit();
		else if (b == 1) document.modifyForm.submit();
		xBut();
	}
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

let scroll = 0;
if (document.getElementById('hdnSC').value != 0) {
	scroll = parseInt(document.getElementById('hdnSC').value);
	pitem[scroll].scrollIntoView({behavior:'smooth',block: 'nearest'});
   	document.addEventListener('wheel', wheel, { passive: false });
   	setTimeout(() => {
		document.removeEventListener('wheel', wheel);
    }, 1000);
}
function wheel(e) {
  e.preventDefault();
}
function mvScroll(a) {
	var prb = document.getElementById('projectBox');
	var up = document.getElementById('up');
	var down = document.getElementById('down');
	scroll= scroll + a;
	if (scroll < 0) {
		prb.style.animation="scrollendup 0.6s";
		up.style.display = "none";
		down.style.display = "none";
		scroll = 0;
		setTimeout(() => {
			up.style.display = "block";
			down.style.display = "block";
			prb.style.animation="0s";
		}, 600);
	} else if(scroll > hdnpb.value) {
		if (scroll-10 == hdnpb.value-1) {
			prb.style.animation="scrollenddown 0.6s";
			up.style.display = "none";
			down.style.display = "none";
			scroll -= 10;
			setTimeout(() => {
				up.style.display = "block";
				down.style.display = "block";
				prb.style.animation="0s"
			}, 600);
		} else {
			scroll = hdnpb.value-1;
			pitem[scroll].scrollIntoView({behavior:'smooth',block: 'nearest'});
		   	document.addEventListener('wheel', wheel, { passive: false });
		   	setTimeout(() => {
				document.removeEventListener('wheel', wheel);
		    }, 1000);
		}
	} else {
	   	pitem[scroll].scrollIntoView({behavior:'smooth',block: 'nearest'});
	   	document.addEventListener('wheel', wheel, { passive: false });
	   	setTimeout(() => {
			document.removeEventListener('wheel', wheel);
	    }, 1000);
    }
}

let psw = 0;
let scrollWidth = prsc.offsetWidth;
let scrollHeight = prsc.offsetHeight;

function chSearch(a) {
	scrollWidth = prsc.offsetWidth;
	scrollHeight = prsc.offsetHeight;
	xBut();
	if(ssw == 1) {
		ssw = 0;
		sdata.value = null;
		bsch.style.display = "none";
		bl.style.display = "block";
		bl.style.animation = "0s";
	}
	psw = 1;
	pt.style.animation = "fadeout 0.4s"
	scb.style.display = "none";
	bs.style.height = "0px";
	bs.style.opacity = "0";
	cs.style.height = "500px";
	cs.style.opacity = "1";
	prsc.style.overflowY = "auto";
	prsc.style.overflowX = "hidden";
	prsc.style.height= "440px";
	prsc.style.width="100%";
	prbx.style.width="100%";
	prbx.style.textAlign="center";
	for(let i = 0;i < pitem.length;i++) {pitem[i].style.display="none"};
	setTimeout(() => {
		pt.style.display = "none";
        st.style.display = "block";
        st.style.animation = "fadein 1s"
        for(let i = 0;i < pitem.length;i++) {pitem[i].style.display="inline-block"};
        if (a == 1) {
		resetB(1);
		resetP(0);	
		var psel = document.getElementById('projectSel');
		psel.value = 3;
		pdata.value = sessionName;
			for(let i = 0;i < pitem.length;i++) {
				if(pitem[i].querySelector('input[name="writer"]').value.includes(pdata.value)) 
				pitem[i].style.display = "inline-block";
				else pitem[i].style.display = "none";
			}
		}
        setTimeout(() => {
        	oBut();
        }, 590);
    }, 390);
}
function backPrSe() {
	xBut();
	psw = 0;
	scroll = 0;
	st.style.animation = "fadeout 0.4s"
	bs.style.height = "330px";
	bs.style.opacity = "1";
	cs.style.height = "250px";
	prsc.style.overflowY = "hidden";
	prsc.style.height="";
	prsc.style.width="";
	prbx.style.width="2250px";
	prbx.style.textAlign="left";
	for(let i = 0;i < pitem.length;i++) {pitem[i].style.display="none"};
	setTimeout(() => {
		st.style.display = "none";
		scb.style.display = "block";
        pt.style.display = "block";
        pt.style.animation = "fadein 1s"
        prsc.style.overflow = "auto";
		prsc.style.overflowY = "hidden";
        for(let i = 0;i < pitem.length;i++) {pitem[i].style.display="inline-block"};
        setTimeout(() => {
        	oBut();
        }, 590);
    }, 390);
}
function mvProject() {
	xBut();
	pl.style.animation = "fadeout 0.4s"
	bs.style.height = "0px";
	bs.style.opacity = "0";
	cs.style.height = "500px";
	cs.style.animation = "rollup 1s forwards";
	setTimeout(() => {
		pl.style.display = "none";
    }, 390);
}
function resetB(a) {
	if(a == 1) bl.style.display = "block";
	br.style.display = "none";
	bu.style.display = "none";
	bw.style.display = "none";
	bsch.style.display = "none";
}
function resetP(a) {
	if(a == 1) pl.style.display = "block";
	pu.style.display = "none";
}
function outProject() {
	xBut();
	
	var pn = document.getElementById('projectNull');
	prr.style.animation = "fadeout 0.4s";
	pr.style.animation = "rollup 1s forwards";
	pr.style.height = "210px";
	pn.style.height = "330px";
	pn.style.opacity = "1";
	setTimeout(() => {
		prr.style.display = "none";
    }, 390);
}
function prModify() {
	xBut();
	pr.style.animation = "rollleft 1s"
	prr.style.animation = "fadeout 1s"
	setTimeout(() => {
		prr.style.display = "none";
        prm.style.display = "block";
        pr.style.animation = "rollright 1s"
        prm.style.animation = "fadein 2s"
        oBut();
    }, 990);
}