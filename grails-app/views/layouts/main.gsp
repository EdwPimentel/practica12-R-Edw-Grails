<!DOCTYPE html>
<!--
* CoreUI - Free Bootstrap Admin Template
* @version v2.1.10
* @link https://coreui.io
* Copyright (c) 2018 creativeLabs Łukasz Holeczek
* Licensed under MIT (https://coreui.io/license)
-->

<html lang="en">
<head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta name="description" content="practica12">
    <meta name="author" content="Łukasz Holeczek">
    <meta name="keyword" content="Bootstrap,Admin,Template,Open,Source,jQuery,CSS,HTML,RWD,Dashboard">
    <title>Practica 12</title>
    <!-- CoreUI CSS -->
    <link rel="stylesheet" href="https://unpkg.com/@coreui/coreui/dist/css/coreui.min.css">
    <link rel="stylesheet" href="https://coreui.io/demo/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="https://unpkg.com/@coreui/icons/css/coreui-icons.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-118965717-3"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());
        // Shared ID
        gtag('config', 'UA-118965717-3');
        // Bootstrap ID
        gtag('config', 'UA-118965717-5');
    </script>
    <g:layoutHead/>
</head>
<body class="app header-fixed sidebar-fixed aside-menu-fixed sidebar-lg-show">
<header class="app-header navbar">
    <button class="navbar-toggler sidebar-toggler d-lg-none mr-auto" type="button" data-toggle="sidebar-show">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="${createLink(controller: 'dashboard',action: 'index')}">
        LOGO
    </a>
    <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button" data-toggle="sidebar-lg-show">
        <span class="navbar-toggler-icon"></span>
    </button>
    <ul class="nav navbar-nav ml-auto">
        <li class="nav-item dropdown">
               <h5> <sec:loggedInUserInfo field="username"/></h5>
        </li>
    </ul>
    <button class="navbar-toggler aside-menu-toggler d-md-down-none" type="button" data-toggle="aside-menu-lg-show">
        <span class="cui-settings"></span>
    </button>
</header>
<div class="app-body">
    <div class="sidebar">
        <nav class="sidebar-nav">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="${createLink(controller:'dashboard', action:'index')}">
                        <i class="nav-icon icon-speedometer"></i> Dashboard
                    </a>
                </li>

                <li class="nav-item nav-dropdown">
                    <a class="nav-link nav-dropdown-toggle" href="#">
                        <i class="nav-icon icon-puzzle"></i> <g:message code="categorias.label"/></a>
                    <ul class="nav-dropdown-items">
                        <li class="nav-item">
                            <a class="nav-link" href="${createLink(controller:'categoria', action:'index')}">
                                <i class="nav-icon icon-puzzle"></i> Index</a>
                        </li>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                        <li class="nav-item">
                            <a class="nav-link" href="${createLink(controller:'categoria', action:'create')}">
                                <i class="nav-icon icon-puzzle"></i> Crear</a>
                        </li>
                    </sec:ifAllGranted>
                    </ul>
                </li>

                <li class="nav-item nav-dropdown">
                    <a class="nav-link nav-dropdown-toggle" href="#">
                        <i class="nav-icon icon-puzzle"></i> <g:message code="contactos.label"/></a>
                    <ul class="nav-dropdown-items">
                        <li class="nav-item">
                            <a class="nav-link" href="${createLink(controller:'contacto', action:'index')}">
                                <i class="nav-icon icon-puzzle"></i> Index</a>
                        </li>
    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <li class="nav-item">
                            <a class="nav-link" href="${createLink(controller:'contacto', action:'create')}">
                                <i class="nav-icon icon-puzzle"></i> Crear</a>
                        </li>
    </sec:ifAllGranted>
                    </ul>
                </li>

                <li class="nav-item nav-dropdown">
                    <a class="nav-link nav-dropdown-toggle" href="#">
                        <i class="nav-icon icon-puzzle"></i> <g:message code="departamentos.label"/> </a>
                    <ul class="nav-dropdown-items">
                        <li class="nav-item">
                            <a class="nav-link" href="${createLink(controller:'dep', action:'index')}">
                                <i class="nav-icon icon-puzzle"></i> Index</a>
                        </li>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <li class="nav-item">
                            <a class="nav-link" href="${createLink(controller:'dep', action:'create')}">
                                <i class="nav-icon icon-puzzle"></i> Crear</a>
                        </li>
                     </sec:ifAllGranted>
                    </ul>
                </li>


                <sec:ifAllGranted roles="ROLE_ADMIN">

                    <li class="nav-item nav-dropdown">
                        <a class="nav-link nav-dropdown-toggle" href="#">
                            <i class="nav-icon icon-puzzle"></i> <g:message code="usuarios.label"/> </a>
                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a class="nav-link" href="${createLink(controller:'usuario', action:'index')}">
                                    <i class="nav-icon icon-puzzle"></i> Index</a>
                            </li>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                            <li class="nav-item">
                                <a class="nav-link" href="${createLink(controller:'usuario', action:'create')}">
                                    <i class="nav-icon icon-puzzle"></i> Crear</a>
                            </li>
                    </sec:ifAllGranted>
                        </ul>
                    </li>

                </sec:ifAllGranted>

            </ul>
        </nav>
    </div>
    <main class="main">
        <!-- Breadcrumb-->

        <aside class="aside-menu">
            <!-- Tab panes-->
            <div class="tab-content">
                <div class="tab-pane active" id="timeline" role="tabpanel">
                    <div class="list-group">
                        <a href="/?lang=es" class="nav-link">
                            <i class="flag-icon flag-icon-es"></i> Espaniol
                        </a>

                        <a href="/?lang=en" class="nav-link">
                            <i class="flag-icon flag-icon-us"></i> English
                        </a>

                        <form name="submitForm" class="form-inline" method="POST" action="${createLink(controller: 'logout')}">
                            <input type="hidden" name="" value="">
                        </form>

                       <a HREF="javascript:document.submitForm.submit()" class="nav-link">
                           <i class="cui-account-logout"></i> Logout
                       </a>

                    </div>
                </div>
            </div>
        </aside>
        <br>
        <g:layoutBody/>
    </main>

</div>

<footer class="app-footer">
    <div>
        <a href="https://coreui.io">CoreUI</a>
        <span>&copy; 2018 creativeLabs.</span>
    </div>
    <div class="ml-auto">
        <span>Powered by</span>
        <a href="https://coreui.io">CoreUI</a>
    </div>
</footer>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, Bootstrap, then CoreUI  -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<script src="https://unpkg.com/@coreui/coreui/dist/js/coreui.min.js"></script>
</body>
</html>
