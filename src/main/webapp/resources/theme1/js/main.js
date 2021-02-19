/** hello
 * 
 */

function checkValue(remainingDays) {

	var requestedDays = document.getElementById("requestedDays").value;
	if (requestedDays > remainingDays) {
		alert("Requested days must be less than " + remainingDays + " !")
		document.getElementById("requestedDays").value = ''

	}

}

function startLoading(){
	document.getElementsByClassName("loading").style.display='block';
}

function reviewLeave(id, choice) {
 
 	
	if (choice == "approve") {
		document.getElementById('approveId').value=id;

	}
	else{
		document.getElementById('rejectId').value=id;
	}
}

function displayApplyForLeave(){
	document.getElementById('formDiv').style.display='block';
	document.getElementById('requestDiv').style.display='none';
}
function displayRequests(){
	document.getElementById('requestDiv').style.display='block';
	document.getElementById('formDiv').style.display='none';
}
function DateCheck()
{
  var StartDate= document.getElementById('startDate').value;
  var EndDate= document.getElementById('endDate').value;
  var eDate = new Date(EndDate);
  var sDate = new Date(StartDate);
  if(StartDate!= '' && StartDate!= '' && sDate> eDate)
    {
    alert("Please ensure that the End Date is greater than or equal to the Start Date.");
    document.getElementById('endDate').value=''
    return false;
    }
}
function DateCheck2()
{
  var StartDate= document.getElementById('startDate').value;
  var sDate = new Date(StartDate);
  var today=new Date()
  if(today> sDate)
    {
    alert("Please ensure that the Start Date is greater than or equal to the Current Date.");
    document.getElementById('startDate').value=''
    return false;
    }
}