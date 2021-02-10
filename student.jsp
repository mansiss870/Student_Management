<jsp:include page='/MasterPageTopSection.jsp' />
<jsp:useBean id='messageBean' scope='request' class='com.thinking.machines.school.beans.MessageBean'/>
<jsp:include page='/StudentsJS.jsp' /> 
<div class="alert alert-success" role="alert" style='display:none' id='alertdiv' >
  <span id='alertSimpleL'>  <jsp:getProperty name='messageBean' property='message'/>
</span><b><span id='alertBold'></span></b><span id='alertSimpleR'>
</div>

<div   class='jumbotron float-right divimg-jumbo' id='detailsStudentView' style='display:none' >
<center>
<table id='detailsStudenttable' name='detailsStudentTable' >
<tr>
<td  name='gender'><center><span id='dtgender'><img id='gg' class='float-left'></span></center></td>
<td  name='name'><h2><span id='dtname'></h2></span></td>
</tr>


<tr>
<td><h3>Roll number&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3></td>
<td  name='rollnumber'><h4><span id='dtrollNumber'></span></h4></td>
</tr>


<tr>
<td><h3>Address&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3></td>
<td name='address'><h4><span id='dtaddress'></span></h4></td>
</tr>

<tr>
<td><h3>City&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3></td>
<td name='city'><h4><span id='dtcity'></span></h4></td>
</tr>



<tr>
<td><h3>Indian&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3></td>
<td name='indian'><img id='ind'></td>
</tr>

<tr>
<td><h3>Date of birth&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3></td>
<td name='dob'><h4><span id='dtdob'></span></h4></td>
</tr>
</table>
<button  class='btn btn-outline-dark float-right' id='BackButton'  onclick='switchToGrid(1)'>Back</button>
</center>
</div>

<div id='addStudentView' class='jumbotron float-right divimg-jumbo' style='display:none'>
<form id='studentAddForm' action='/styletwoclone/addStudent.jsp' method='post'>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="srollNumber">Roll Number:</label>
      <input type="text" name="rollNumber" class="form-control is-valid" id="srollNumber" required>
    </div>
    <div class="form-group col-md-6">
      <label for="sname">Name:</label>
      <input name="name" type="text" class="form-control is-valid" id="sname" required>
    </div>
  </div>
  <div class="form-group">
    <label for="saddress">Address:</label>
    <input type="text" name="address" class="form-control is-valid" id="saddress" placeholder="1234 Main St" required>
  </div>
<div class="form-row">
<div class="form-group col-md-6">
<label for="addFormCityCode">City</label>
      <select id="addFormCityCode" name="cityCode" class="form-control is-valid" required>
        <option value="-1">Choose...</option>
      </select>
      </div>
    <div class="form-group col-md-6">
<label for="sdate">Date Of Birth:</label>
    <input type="date" name="dateOfBirth" class="form-control is-valid" id="sdate" required>
  </div>
</div>
<div class="form-row">
<div class="form-check">
<label class="form-check-label" for="sfemale">
    Female
  </label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
      <input class="form-check-input" type="radio" name="gender" id="sfemale" value="F" checked>
</div>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<div class="form-check">
  <label class="form-check-label" for="smale">
    Male
  </label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<input class="form-check-input" type="radio" name="gender" id="smale" value="M" checked>
</div>
  </div>
<div class="form-group">
    <div class="form-check">
      <label class="form-check-label" for="sindian">
        Indian
      </label>&nbsp&nbsp&nbsp&nbsp&nbsp
      <input class="form-check-input" name="indian" type="checkbox" id="sindian">
    </div>
  </div>
<button type='button' class='btn btn-outline-dark float-right' onClick='switchToGrid(3)'>Cancel</button>
<button type='submit' class='btn btn-outline-dark float-right' >Add</button>

</form>
</div>


<div class=' jumbotron float-right divimg-jumbo' id='deleteStudentView' style='display:none'>
<center>
<form action='/styletwoclone/deleteStudent.jsp' id='deleteStudentForm' name='deleteStudentForm' method='post'>
<input type='hidden' id='deleteStudentRollNumber' name='rollNumber'>
<input type='hidden' id='deleteStudentName' name='name'>
<table id='deleteStudenttable' name='deleteStudentTable' >

<tr>
<td name='gender'><span id='dgender'><img id='dgg' class='float-left'></span</td>
<td  ><h2><span id='dname'></span></h2></td>
</tr>

<tr>
<td><h3>Roll number&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3></td>
<td ><h4><span id='drollNumber'></span></h4></td>
</tr>


<tr>
<td><h3>Address&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3></td>
<td  ><h4><span id='daddress'></span></h4></td>
</tr>

<tr>
<td><h3>City&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3></td>
<td  ><h4><span id='dcity'></span></h4></td>
</tr>



<tr>
<td><h3>Indian&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3></td>
<td  ><img id='dind'></span</td>
</tr>

<tr>
<td><h3>Date of birth&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3></td>
<td><h4><span id='ddob'></span></h4></td>
</table>

<button type='submit' class='btn btn-outline-dark float-right' id='deleteButton'>Delete</button>
<button type='button' class='btn btn-outline-dark float-right' id='cancleButton' onclick='switchToGrid(2)'>Cancel</button>
</form>
</center>
</div>




<div id='gridView' class='container position-sticky table-responsive' >
<div class=" container jumbotron-fluid text-white " >

<form class="form-inline my-2 my-lg-0 float-right">
      <input class="form-control mr-sm-2" type="search" placeholder="Search Student" aria-label="Search" oninput='searchStudent(this)'>
      <button class="btn btn-light my-2 my-sm-0" type="button" onClick='addStudent()'><img src='\styletwoclone\images\add_icon.png'></button>
    </form>

</div>


<div  class='container jumbotron-fluid unnamedimg-jumbo table-wrapper-scroll-y my-custom-scrollbar ' > 
<table border='2' id='studentViewGrid' class='table table-bordered table-striped mb=0'> 
<thead class='thead-dark '> 
<tr> 
<th scope='col'>S.No.</th> 
<th scope='col'>Roll number</th>
<th scope='col'>Name</th>
<th scope='col'>City</th> 
<th scope='col'>Gender</th>
<th scope='col'>Indian</th> 
<th scope='col'>D.O.B.</th> 
<th scope='col'>Edit</th> 
<th scope='col'>Delete</th>
<th scope='col'>Details</th> 
</tr> 
</thead>
<tbody> 
</tbody> 
</table> 
</div> 
</div>

<div id='editStudentView' class='jumbotron float-right divimg-jumbo' style='display:none'>
<form id='studentEditForm' action='/styletwoclone/editStudent.jsp' method='post'>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="rollNumber">Roll Number:</label>
      <input type="text" name="rollNumber" class="form-control is-valid" id="rollNumber" required>
    </div>
    <div class="form-group col-md-6">
      <label for="name">Name:</label>
      <input name="name" type="text" class="form-control is-valid" id="name" required>
    </div>
  </div>
  <div class="form-group">
    <label for="address">Address:</label>
    <input type="text" name="address" class="form-control is-valid" id="address" placeholder="1234 Main St" required>
  </div>
<div class="form-row">
<div class="form-group col-md-6">
<label for="editFormCityCode">City:</label>
      <select id="editFormCityCode" name="cityCode" class="form-control is-valid" required>
        <option value="-1">Choose...</option>
      </select>
      </div>
    <div class="form-group col-md-6">
<label for="sdate">Date Of Birth:</label>
    <input type="date" name="dateOfBirth" class="form-control is-valid" id="date" required>
  </div>
</div>
<div class="form-row">
<div class="form-check">
<label class="form-check-label" for="female">
    Female
  </label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

      <input class="form-check-input" type="radio" name="gender" id="female" value="F" checked>
  </div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<div class="form-check">
 <label class="form-check-label" for="male">
    Male
  </label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<input class="form-check-input" type="radio" name="gender" id="male" value="M" checked>
 </div>
<div>
  
<div class="form-group">
    <div class="form-check">
      <label class="form-check-label" for="indian">
        Indian
      </label>&nbsp&nbsp&nbsp&nbsp&nbsp

      <input class="form-check-input" name="indian" type="checkbox" id="indian">
    </div>
  </div>
<button type='button' class='btn btn-outline-dark float-right' onClick='switchToGrid(4)'>Cancel</button>
<button type='submit' class='btn btn-outline-dark float-right' >Edit</button>
</form>
</div>



<jsp:include page='/MasterPageBottomSection.jsp' />   