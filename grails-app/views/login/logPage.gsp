<!DOCTYPE html>
<html lang="en">

<head>
    <title>Practica 12</title><meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <asset:stylesheet href="login.css"/>


</head>
<body>

<div class="login-page">
    <div class="form">
        <g:if test='${flash.message}'>
            <div class="alert alert-danger alert-block login_message">${flash.message}</div>
        </g:if>

        <form  action="${postUrl ?: '/login/authenticate'}" method="POST"  class="login-form">
            <input name="${usernameParameter ?: 'username'}" id="username" type="text" placeholder="username"/>
            <input name="${passwordParameter ?: 'password'}" id="password" type="password" placeholder="password"/>
            <button class="btn btn-primary" type="submit">login</button>
        </form>
    </div>
</div>
<asset:javascript src="login.js"/>

</body>

</html>
