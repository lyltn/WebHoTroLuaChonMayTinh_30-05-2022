
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="connect.Dao"%>
<%@ page import="java.util.Vector"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Document</title>
<style type="text/css">

/*
*
* ==========================================
* CUSTOM UTIL CLASSES
* ==========================================
*
*/
.rounded-lg {
	border-radius: 1rem !important;
}

.text-small {
	font-size: 0.9rem !important;
}

.custom-separator {
	width: 5rem;
	height: 6px;
	border-radius: 1rem;
}

.text-uppercase {
	letter-spacing: 0.2em;
}

/*
*
* ==========================================
* FOR DEMO PURPOSES
* ==========================================
*
*/
body {
	background: #00B4DB;
	background: -webkit-linear-gradient(to right, #0083B0, #00B4DB);
	background: linear-gradient(to right, #0083B0, #00B4DB);
	color: #514B64;
	min-height: 100vh;
}
</style>
</head>
<body>
	<%
	Dao dao = new Dao();
	Vector r = dao.listHV();
	%>
	<section>
		<div class="container py-5">

			<!-- FOR DEMO PURPOSE -->
			<header class="text-center mb-5 text-white">
				<div class="row">
					<div class="col-lg-7 mx-auto">
						<h1>feedback management</h1>
						<p>
							manage all user feedback messages <br> 
							<a href="login.jsp" class="text-reset">log out</a>
						</p>
					</div>
				</div>
			</header>
			<!-- END -->



			<div class="row text-center align-items-end">
				<!-- Pricing Table-->
				<c:set var="result" value="<%=r%>" />
				<c:if test="${not empty result}">
					<c:forEach var="dto" items="${result}">
						<div class="col-lg-4 mb-5 mb-lg-0">
							<div class="bg-white p-5 rounded-lg shadow"
								style="margin-bottom: 50px;">
								<h1 class="text-small font-weight-normal ml-2">${dto.get(3)}</h1>
								<h2 class="h1 font-weight-bold" style="font-size: 35px;">${dto.get(2)}</h2>

								<div class="custom-separator my-4 mx-auto bg-primary"></div>

								<ul class="list-unstyled my-5 text-small text-left">
									<li class="mb-3"><i class="fa  mr-2 text-primary"></i>${dto.get(4)}</li>

								</ul>
								<button type="button" data-bs-toggle="modal"
									data-bs-target="#exampleModal" data-bs-whatever="${dto.get(3)}"
									class="btn btn-primary btn-block p-2 shadow rounded-pill">
									Reply</button>
								<a href="ServletDelete?id=${dto.get(0)}"
									class="btn btn-primary btn-block p-2 shadow rounded-pill">
									Delete</a>
							</div>
						</div>
					</c:forEach>
				</c:if>


				<!-- END -->



				<!-- END -->

			</div>
		</div>
	</section>
	<!-- MDB -->
	<form action="ServletSendMail" method="post">
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">New message</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">To:</label> <input
									type="text" name="to" class="form-control" id="recipient-name">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">Subject:</label>
								<input type="text" name="subject" class="form-control"
									id="recipient-name">
							</div>
							<div class="mb-3">
								<label for="message-text" class="col-form-label">Message:</label>
								<textarea class="form-control" name="message" id="message-text"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="reset" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Send
							message</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		var exampleModal = document.getElementById('exampleModal')
		exampleModal.addEventListener('show.bs.modal', function(event) {
			// Button that triggered the modal
			var button = event.relatedTarget
			// Extract info from data-bs-* attributes
			var recipient = button.getAttribute('data-bs-whatever')
			// If necessary, you could initiate an AJAX request here
			// and then do the updating in a callback.
			//
			// Update the modal's content.
			var modalTitle = exampleModal.querySelector('.modal-title')
			var modalBodyInput = exampleModal
					.querySelector('.modal-body input')

			modalTitle.textContent = 'New message to ' + recipient
			modalBodyInput.value = recipient
		})
		var myModal = document.getElementById('myModal')
		var myInput = document.getElementById('myInput')

		myModal.addEventListener('shown.bs.modal', function() {
			myInput.focus()
		})
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>