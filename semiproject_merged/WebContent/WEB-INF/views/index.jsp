<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>

<header class="masthead bg-primary text-white text-center">
	<div class="container d-flex align-items-center flex-column">
		<!-- Masthead Avatar Image-->
		<img class="masthead-avatar mb-5" src="assets/img/avataaars.svg"
			alt="..." />
		
			
		<!-- Masthead Heading-->
		<h1 class="masthead-heading text-uppercase mb-0">코안심 내과</h1>
		<!-- Icon Divider-->
		<div class="divider-custom divider-light">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fa-solid fa-heart"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
		<!-- Masthead Subheading-->
		
			
		<p class="masthead-subheading font-weight-light mb-0">
		당신을 위한 내과, 코안심 내과!
		</p>
		
	</div>
</header>

<!-- Portfolio Section-->
<pre></pre>
<h2 id="intro" class="page-section-heading text-center text-uppercase text-secondary mb-0">병원 소개</h2>
	
			<div class="slider">
  <input type="radio" name="slider" title="slide1" checked="checked" class="slider__nav"/>
  <input type="radio" name="slider" title="slide2" class="slider__nav"/>
  <input type="radio" name="slider" title="slide3" class="slider__nav"/>
  <input type="radio" name="slider" title="slide4" class="slider__nav"/>
  <div class="slider__inner">
    <div class="slider__contents"><i class="slider__image fa fa-star"></i>
      <h2 class="slider__caption">introduce</h2>
      <p class="slider__txt"></p>
    </div>
    <div class="slider__contents"><i class="slider__image fa fa-newspaper"></i>
      <h2 class="slider__caption">Self-Check</h2>
      <p class="slider__txt"></p>
    </div>
    <div class="slider__contents"><i class="slider__image fa fa-television"></i>
      <h2 class="slider__caption">Trending</h2>
      <p class="slider__txt"></p>
    </div>
    <div class="slider__contents"><i class="slider__image fa fa-diamond"></i>
      <h2 class="slider__caption">events</h2>
      <p class="slider__txt"></p>
    </div>
  </div>
</div>

<hr>
<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">내과클리닉</h2>
<div class="container"></div>
<!-- About Section-->
<section class="page-section bg-primary text-white mb-0"
	id="internal-clinic">
	<div class="container">
		<!-- About Section Heading-->
		<h2 class="page-section-heading text-center text-uppercase text-white"></h2>
		<!-- Icon Divider-->
		<div class="divider-custom divider-light">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fa-solid fa-heart"></i>
			</div>
			<div>내과클리닉</div>
			<div class="divider-custom-icon">
				<i class="fa-solid fa-heart"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
	</div>
</section>

<hr>
<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">비만클리닉</h2>
<div class="container"></div>
<!-- About Section-->
<section class="page-section bg-primary text-white mb-0"
	id="overweight-clinic">
	<div class="container">
		<!-- About Section Heading-->
		<h2 class="page-section-heading text-center text-uppercase text-white"></h2>
		<!-- Icon Divider-->
		<div class="divider-custom divider-light">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fa-solid fa-heart"></i>
			</div>
			<div>비만클리닉</div>
			<div class="divider-custom-icon">
				<i class="fa-solid fa-heart"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
	</div>
</section>

<hr>


<!-- Icon Divider-->
	<div class="container"></div>
<!-- About Section-->
<section class="page-section bg-primary text-white mb-0" id="about">
	<div class="container">
		<!-- About Section Heading-->
		<h2 class="page-section-heading text-center text-uppercase text-white"></h2>
		<!-- Icon Divider-->
		<div class="divider-custom divider-light">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fa-solid fa-heart"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
		<!-- About Section Content-->
		<div class="row">
			<div class="col-lg-4 ms-auto">
				<p class="lead">우리 병원은 언제나 당신을 기다립니다.</p>
			</div>
			<div class="col-lg-4 me-auto">
				<p class="lead text-center">당신만을 위한 병원, 코안심 내과!</p>
			</div>
		</div>
		<!-- About Section Button-->
		<div class="text-center mt-4">
			<a class="btn btn-xl btn-outline-light"
				href="https://startbootstrap.com/theme/freelancer/"> <i
				class="fas fa-download me-2"></i> Free Download!
			</a>
		</div>
	</div>
</section>
<!-- Contact Section-->
<section class="page-section" id="contact">
	<div class="container">
		<!-- Contact Section Heading-->
		<h2
			class="page-section-heading text-center text-uppercase text-secondary mb-0">Contact
			Me</h2>
		<!-- Icon Divider-->
		<div class="divider-custom">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fa-solid fa-heart"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
		<!-- Contact Section Form-->
		<div class="row justify-content-center">
			<div class="col-lg-8 col-xl-7">
				<!-- * * * * * * * * * * * * * * *-->
				<!-- * * SB Forms Contact Form * *-->
				<!-- * * * * * * * * * * * * * * *-->
				<!-- This form is pre-integrated with SB Forms.-->
				<!-- To make this form functional, sign up at-->
				<!-- https://startbootstrap.com/solution/contact-forms-->
				<!-- to get an API token!-->
				<form id="contactForm" data-sb-form-api-token="API_TOKEN">
					<!-- Name input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="name" type="text"
							placeholder="Enter your name..." data-sb-validations="required" />
						<label for="name">Full name</label>
						<div class="invalid-feedback" data-sb-feedback="name:required">A
							name is required.</div>
					</div>
					<!-- Email address input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="email" type="email"
							placeholder="name@example.com"
							data-sb-validations="required,email" /> <label for="email">Email
							address</label>
						<div class="invalid-feedback" data-sb-feedback="email:required">An
							email is required.</div>
						<div class="invalid-feedback" data-sb-feedback="email:email">Email
							is not valid.</div>
					</div>
					<!-- Phone number input-->
					<div class="form-floating mb-3">
						<input class="form-control" id="phone" type="tel"
							placeholder="(123) 456-7890" data-sb-validations="required" /> <label
							for="phone">Phone number</label>
						<div class="invalid-feedback" data-sb-feedback="phone:required">A
							phone number is required.</div>
					</div>
					<!-- Message input-->
					<div class="form-floating mb-3">
						<textarea class="form-control" id="message" type="text"
							placeholder="Enter your message here..." style="height: 10rem"
							data-sb-validations="required"></textarea>
						<label for="message">Message</label>
						<div class="invalid-feedback" data-sb-feedback="message:required">A
							message is required.</div>
					</div>
					<!-- Submit success message-->
					<!---->
					<!-- This is what your users will see when the form-->
					<!-- has successfully submitted-->
					<div class="d-none" id="submitSuccessMessage">
						<div class="text-center mb-3">
							<div class="fw-bolder">Form submission successful!</div>
							To activate this form, sign up at <br /> <a
								href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
						</div>
					</div>
					<!-- Submit error message-->
					<!---->
					<!-- This is what your users will see when there is-->
					<!-- an error submitting the form-->
					<div class="d-none" id="submitErrorMessage">
						<div class="text-center text-danger mb-3">Error sending
							message!</div>
					</div>
					<!-- Submit Button-->
					<button class="btn btn-primary btn-xl disabled" id="submitButton"
						type="submit">Send</button>
				</form>
			</div>
		</div>
	</div>
</section>

<%@ include file="footer.jsp"%>

