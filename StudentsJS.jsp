<%@taglib uri='/WEB-INF/tlds/mytags.tld' prefix='tm' %> 
<script> 


function City() 
{ 
this.code=0; 
this.name='';
}

function Student() 
{ 
this.rollNumber=0;
this.name=''; 
this.address=''; 
this.city=null; 
this.gender=''; 
this.indian=false; 
this.dateOfBirth=''; 
}

 
function ViewModel() 
{ 
this.students=[]; 
this.cities=[]; 
this.selectedRow=null; 
this.selectedIndex=-1;
}

var viewModel=new ViewModel();
var student; 


<tm:TableIterator table='student' name='student' orderBy='name'>
student=new Student();
student.rollNumber=${student.rollNumber};
student.name='${student.name}';
student.address='${student.address}';
student.city=new City();
student.city.code=${student.cityCode};
student.city.name='${student.cityName}';
student.gender='${student.gender}';
student.indian=${student.indian};
student.dateOfBirth='${student.dateOfBirth}';
viewModel.students[${index}]=student;
</tm:TableIterator>
 

var c;
<tm:TableIterator table='city' name='city' orderBy='name'> 
c=new City();
c.code=${city.code};
c.name='${city.name}';
viewModel.cities[${index}]=c;
</tm:TableIterator>



function searchStudent(t)
{
t.style.color='black';
if(t.value.length==0) return;
var i;
for(i=0;i<viewModel.students.length;i++)
{
if(viewModel.students[i].name.toUpperCase().startsWith(t.value.toUpperCase())) break;
}
if(i==viewModel.students.length)
{
t.style.color='red';
}
else
{
var row=document.getElementById('studentViewGrid').rows[i+1]; 
selectRow(row,i+1);
row.scrollIntoView();
}
}


function selectStudent(rollNumber,action)
{
var i;
if(action=="deleted")
{
document.getElementById('alertSimpleL').innerHTML="Student "+action+":";
document.getElementById('alertBold').innerHTML=rollNumber;  //name jaara hai rollNumber laziness
document.getElementById('alertSimpleR').innerHTML="!";
document.getElementById("alertdiv").style.display="block";
}
else{
for(i=0;i<viewModel.students.length;i++)
{
if(viewModel.students[i].rollNumber==rollNumber)
{
document.getElementById('alertSimpleL').innerHTML="Student "+action+":";
document.getElementById('alertBold').innerHTML=viewModel.students[i].name;
document.getElementById('alertSimpleR').innerHTML="!";
break;
}
}
var row=document.getElementById('studentViewGrid').rows[i+1]; 
selectRow(row,i+1);
document.getElementById("alertdiv").style.display="block";
row.scrollIntoView();
}
}





function createDeleteHandler(index)
{
return function(){
deleteStudentView(index);
};
}



function createDetailsHandler(index)
{
return function(){
detailsStudentView(index);
};
}

function createRowClickedHandler(r,x)
{
return function()
{
selectRow(r,x);
};
}

function createEditHandler(index)
{
return function(){
editStudentView(index)
};
}




function initializeView() 
{ 
var tableBody=document.getElementById('studentViewGrid');
var i=0;
var row,cell,textNode,img;
while(i<viewModel.students.length) 
{
row=document.createElement('tr'); 
cell=document.createElement('td');
cell.innerHTML=(i+1)+'.'; 
cell.style.textAlign='right';
row.appendChild(cell);

cell=document.createElement('td'); 
textNode=document.createTextNode(viewModel.students[i].rollNumber); 
cell.appendChild(textNode);
cell.style.textAlign='center'; 
row.appendChild(cell); 
cell=document.createElement('td'); 
textNode=document.createTextNode(viewModel.students[i].name);
cell.style.textAlign='center'; 
cell.appendChild(textNode);
row.appendChild(cell);

cell=document.createElement('td');
textNode=document.createTextNode(viewModel.students[i].city.name); 
cell.appendChild(textNode);
row.appendChild(cell);

cell=document.createElement('td'); 
img=document.createElement('img'); 
if(viewModel.students[i].gender=='M') 
{ 
img.src='/styletwoclone/images/male_icon.png'; 
} 
else { 
img.src='/styletwoclone/images/female_icon.png'; 
} 
cell.style.textAlign='center'; 
cell.appendChild(img); 
row.appendChild(cell);

cell=document.createElement('td'); 
img=document.createElement('img'); 
if(viewModel.students[i].indian) 
{ 
img.src='/styletwoclone/images/checked_icon.png'; 
} 
else { 
img.src='/styletwoclone/images/unchecked_icon.png'; 
} 
cell.style.textAlign='center'; 
cell.appendChild(img); 
row.appendChild(cell);


cell=document.createElement('td');
textNode=document.createTextNode(viewModel.students[i].dateOfBirth); 
cell.appendChild(textNode);
row.appendChild(cell);
cell=document.createElement('td');
img=document.createElement("img");
img.src="/styletwo/images/edit_icon.png"; 
img.onclick=createEditHandler(i); 
cell.style.textAlign='center'; 
cell.appendChild(img);
row.appendChild(cell);

cell=document.createElement('td'); 
img=document.createElement("img"); 
img.src="/styletwo/images/delete_icon.png";
img.onclick=createDeleteHandler(i);
cell.appendChild(img); 
cell.style.textAlign='center'; 
row.appendChild(cell);

cell=document.createElement('td');
img=document.createElement("img"); 
img.src="/styletwoclone/images/details_icon.png";
img.onclick=createDetailsHandler(i); 
cell.style.textAlign='center'; 
cell.appendChild(img);
row.appendChild(cell);

row.style.cursor="pointer"; 
row.onclick=createRowClickedHandler(row,i); 
tableBody.appendChild(row); 
i++;
}


var addFormCityCode=document.getElementById('addFormCityCode');
i=0;
var option;
while(i<viewModel.cities.length)
{
option=document.createElement('option');
option.text=viewModel.cities[i].name;
option.value=viewModel.cities[i].code;
addFormCityCode.options[i+1]=option;
i++;
}

var editFormCityCode=document.getElementById('editFormCityCode');
i=0;
var option;
while(i<viewModel.cities.length)
{
option=document.createElement('option');
option.text=viewModel.cities[i].name;
option.value=viewModel.cities[i].code;
editFormCityCode.options[i+1]=option;
i++;
}

<tm:Equals name='scenario' value='edited'> 
selectStudent(${studentBean.rollNumber},"edited"); 
</tm:Equals> 


<tm:Equals name='scenario' value='added'>
selectStudent(${studentBean.rollNumber},"added"); 
</tm:Equals> 

<tm:Equals name='scenario' value='deleted'> 
selectStudent('${messageBean.message}',"deleted"); 
</tm:Equals> 

}
 

function deleteStudentView(index)
{
var student=viewModel.students[index];
var deleteStudentRollNumber=document.getElementById('deleteStudentRollNumber');
document.getElementById('deleteStudentName').value=student.name;
deleteStudentRollNumber.value=student.rollNumber;
document.getElementById('drollNumber').innerHTML=student.rollNumber;
document.getElementById('dname').innerHTML=student.name;
document.getElementById('daddress').innerHTML=student.address;
document.getElementById('dcity').innerHTML=student.city.name;
if(student.gender=='F')
{
document.getElementById('dgg').src='/styletwoclone/images/female_.png';
}
else
{
document.getElementById('dgg').src='/styletwoclone/images/male_.png';
}
document.getElementById('ddob').innerHTML=student.dateOfBirth;
if(student.indian)
{
document.getElementById('dind').src='/styletwoclone/images/checked_.png';
}
else
{
document.getElementById('dind').src='/styletwoclone/images/unchecked_.png';
}
switchToGrid(5);
var gridView=document.getElementById('gridView');
gridView.style.display='none';
var deleteStudentView=document.getElementById('deleteStudentView');
deleteStudentView.style.display='block';
}


function detailsStudentView(index)
{
var student=viewModel.students[index];
document.getElementById('dtrollNumber').innerHTML=student.rollNumber;
document.getElementById('dtname').innerHTML=student.name;
document.getElementById('dtaddress').innerHTML=student.address;
document.getElementById('dtcity').innerHTML=student.city.name;
if(student.gender=='F')
{
document.getElementById('gg').src='/styletwoclone/images/female_.png';
}
else
{
document.getElementById('gg').src='/styletwoclone/images/male_.png';
}

document.getElementById('dtdob').innerHTML=student.dateOfBirth;
if(student.indian)
{
document.getElementById('ind').src='/styletwoclone/images/checked_.png';
}
else
{
document.getElementById('ind').src='/styletwoclone/images/unchecked_.png';
}
switchToGrid(5);

var gridView=document.getElementById('gridView');
gridView.style.display='none';
var detailsStudentView=document.getElementById('detailsStudentView');
detailsStudentView.style.display='block';
}


function editStudentView(index)
{
var studentEditForm=document.getElementById('studentEditForm');
var student=viewModel.students[index]
studentEditForm.rollNumber.value=student.rollNumber;
studentEditForm.name.value=student.name
studentEditForm.address.value=student.address
studentEditForm.cityCode.value=student.city.code
studentEditForm.dateOfBirth.value=student.dateOfBirth
studentEditForm.indian.checked=student.indian
if(student.gender=='M')
{
studentEditForm.gender[0].checked=true;
}
else
{
studentEditForm.gender[1].checked=true;
}
switchToGrid(5);

var editStudentView=document.getElementById('editStudentView');
editStudentView.style.display='block';
var gridView=document.getElementById('gridView');
gridView.style.display='none';
}

function addStudent()
{
switchToGrid(5);

var addStudentView=document.getElementById('addStudentView');
addStudentView.style.display='block';
var gridView=document.getElementById('gridView');
gridView.style.display='none';
}

function selectRow(tr,index)
{
if(viewModel.selectedIndex==index) return;
if(viewModel.selectedRow!=null)
{
viewModel.selectedRow.style.background='#FFFFFF';
viewModel.selectedRow.style.color='#000000';
}
viewModel.selectedIndex=index;
viewModel.selectedRow=tr;
tr.style.background='#959393';
tr.style.color='#000000';
}

function switchToGrid(view)
{
var gridView=document.getElementById('gridView');
if(view==1)
{
var detailsStudentView=document.getElementById('detailsStudentView');
gridView.style.display='block';
detailsStudentView.style.display='none';
}
if(view==2)
{
var deleteDiv=document.getElementById('deleteStudentView');
gridView.style.display='block';
deleteDiv.style.display='none';
}
if(view==3)
{
var addDiv=document.getElementById('addStudentView');
gridView.style.display='block';
addDiv.style.display='none';
}
if(view==4)
{
var editDiv=document.getElementById('editStudentView');
gridView.style.display='block';
editDiv.style.display='none';
}
if(view==5)
{
document.getElementById("alertdiv").style.display="none";
}
}


window.addEventListener('load',initializeView); 
</script> 