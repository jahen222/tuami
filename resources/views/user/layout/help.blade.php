@extends('user.layout.app')


@section('content')

	<div class="container">

		<div class="row">

			<div class="col-md-12">


<style>
.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

.active, .accordion:hover {
    background-color: #ccc;
}

.panel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}
</style>

<h2>Frequently Asked Question!!</h2>
<p>we have tried to add all Answers but still if we missed any please don't hesitate to contact <a href="">help@tuami.com</a></p>

<button class="accordion">Creating an Account?</button>
<div class="panel">
  <p>You will need to create an account to Request Deliver or provide your services on Tuami.
<br/>
<b>To create an account:</b>
<br/>
From the Tuami App, click Signup.
<br/>
Enter your Email address and click Next.
<br/>
Enter your Password address and click Next.
<br/>
Enter Your First Name, Last Name and click Next.
<br/>
Enter Your Mobile No and Verify it, and click Next now your account is created.
<br/>
Note: You can also join with Facebook and Google Connect.
<br/>
You are now a registered user on Tuami.

</p>
</div>

<button class="accordion">How do I manage my account?</button>
<div class="panel">
  <p>Please Login into your account with verified credentials and manage your account as per your need.</p>
</div>

<button class="accordion">How to upload my Document?</button>
<div class="panel">
  <p>Login into your account and click on Document, you will get multiple options and upload your all document, please allows 24 hours to verify your account.</p>
</div>

<button class="accordion">How i will get request to provide my Delivery Service?</button>
<div class="panel">
  <p>Please login into your Delivery App, you will automatically get request from user.</p>
</div>

<button class="accordion">How i can know my Earning?</button>
<div class="panel">
  <p>you can view your earning into your app, click on earning tab and view your earning.</p>
</div>

<button class="accordion">How i can Withdraw my Earning Fund?</button>
<div class="panel">
  <p>Tuami will automatics send your earning money into your local account on every 7 days.</p>
</div>



<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
</script>



			</div>

		</div>

	</div>

@endsection