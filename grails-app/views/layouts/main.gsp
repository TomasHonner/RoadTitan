<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Road Titan"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<div id="header" >
			<div class="row">
				<div id="logo" class="col-lg-6 col-lg-offset-1">
				Tady bude logo
				</div>
				<div id="loginlogout" class="fRight col-lg-2 col-lg-offset-3 media-right">
					<sec:ifNotLoggedIn>
						<form class="form-inline" name="login" method="POST" action="${createLink(controller:'login') }">
							<button type="submit" class="btn btn-sm btn-warning"><g:message code="application.login"/></button>
						</form>
					</sec:ifNotLoggedIn>
					<sec:ifLoggedIn>
						<form class="form-inline" name="logout" method="POST" action="${createLink(controller:'logout') }">
							<g:message code="application.loggedUser"/> <sec:loggedInUserInfo field="username"/>
							<button type="submit" class="btn btn-danger btn-sm mLeft"><g:message code="application.logout"/></button>
						</form>
					</sec:ifLoggedIn>
				</div>
			</div>
		</div>
		<div id="menu">
			<div class="row">
				<div class="col-lg-4 col-lg-offset-4">
					<ul class="nav nav-tabs">
						<sec:ifAnyGranted roles="ROLE_USER, ROLE_SUPERVISOR, ROLE_ADMIN">
						<li role="presentation"><g:link controller="map"><g:message code="map.title"/></g:link></li>
						<li role="presentation"><g:link controller="reservation"><g:message code="reservation.title"/></g:link></li>
						</sec:ifAnyGranted>
						<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_SUPERVISOR">
							<li role="presentation"><g:link controller="car"><g:message code="car.title"/></g:link></li>
							<sec:ifAllGranted roles="ROLE_ADMIN">
								<li role="presentation"><g:link controller="company"><g:message code="company.title"/></g:link></li>
								<li role="presentation"><g:link controller="appUser"><g:message code="user.title"/></g:link></li>
							</sec:ifAllGranted>
						</sec:ifAnyGranted>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-10 col-lg-offset-1">
		<g:layoutBody/>
		</div>
		<div class="footer" role="contentinfo">

		</div>
	</body>
</html>
