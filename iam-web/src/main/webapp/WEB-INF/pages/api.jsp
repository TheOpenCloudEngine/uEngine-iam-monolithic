<%@ page contentType="text/html; charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="uengine" uri="http://www.uengine.io/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Swagger UI</title>
    <link rel="icon" type="image/png"
          href="${pageContext.request.contextPath}/resources/swagger/images/favicon-32x32.png" sizes="32x32"/>
    <link rel="icon" type="image/png"
          href="${pageContext.request.contextPath}/resources/swagger/images/favicon-16x16.png" sizes="16x16"/>
    <link href='${pageContext.request.contextPath}/resources/swagger/css/typography.css' media='screen' rel='stylesheet'
          type='text/css'/>
    <link href='${pageContext.request.contextPath}/resources/swagger/css/reset.css' media='screen' rel='stylesheet'
          type='text/css'/>
    <link href='${pageContext.request.contextPath}/resources/swagger/css/screen.css' media='screen' rel='stylesheet'
          type='text/css'/>
    <link href='${pageContext.request.contextPath}/resources/swagger/css/reset.css' media='print' rel='stylesheet'
          type='text/css'/>
    <link href='${pageContext.request.contextPath}/resources/swagger/css/print.css' media='print' rel='stylesheet'
          type='text/css'/>
    <script src='${pageContext.request.contextPath}/resources/swagger/lib/jquery-1.8.0.min.js'
            type='text/javascript'></script>
    <script src='${pageContext.request.contextPath}/resources/swagger/lib/jquery.slideto.min.js'
            type='text/javascript'></script>
    <script src='${pageContext.request.contextPath}/resources/swagger/lib/jquery.wiggle.min.js'
            type='text/javascript'></script>
    <script src='${pageContext.request.contextPath}/resources/swagger/lib/jquery.ba-bbq.min.js'
            type='text/javascript'></script>
    <script src='${pageContext.request.contextPath}/resources/swagger/lib/handlebars-2.0.0.js'
            type='text/javascript'></script>
    <script src='${pageContext.request.contextPath}/resources/swagger/lib/js-yaml.min.js'
            type='text/javascript'></script>
    <script src='${pageContext.request.contextPath}/resources/swagger/lib/lodash.min.js'
            type='text/javascript'></script>
    <script src='${pageContext.request.contextPath}/resources/swagger/lib/backbone-min.js'
            type='text/javascript'></script>
    <script src='${pageContext.request.contextPath}/resources/swagger/swagger-ui.js' type='text/javascript'></script>
    <script src='${pageContext.request.contextPath}/resources/swagger/lib/highlight.9.1.0.pack.js'
            type='text/javascript'></script>
    <script src='${pageContext.request.contextPath}/resources/swagger/lib/highlight.9.1.0.pack_extended.js'
            type='text/javascript'></script>
    <script src='${pageContext.request.contextPath}/resources/swagger/lib/jsoneditor.min.js'
            type='text/javascript'></script>
    <script src='${pageContext.request.contextPath}/resources/swagger/lib/marked.js' type='text/javascript'></script>
    <script src='${pageContext.request.contextPath}/resources/swagger/lib/swagger-oauth.js'
            type='text/javascript'></script>

    <script type="text/javascript">
        $(function () {
            var contextPath = '${pageContext.request.contextPath}';
            var url = window.location.search.match(/url=([^&]+)/);
            if (url && url.length > 1) {
                url = decodeURIComponent(url[1]);
            } else {
                url = contextPath + "/resources/swagger/swagger.json";
            }

            hljs.configure({
                highlightSizeThreshold: 5000
            });

            // Pre load translate...
            if (window.SwaggerTranslator) {
                window.SwaggerTranslator.translate();
            }
            window.swaggerUi = new SwaggerUi({
                url: url,
                dom_id: "swagger-ui-container",
                supportedSubmitMethods: ['get', 'post', 'put', 'delete', 'patch'],
                onComplete: function (swaggerApi, swaggerUi) {
                    if (typeof initOAuth == "function") {
                        initOAuth({
                            clientId: "your-client-id",
                            clientSecret: "your-client-secret-if-required",
                            realm: "your-realms",
                            appName: "your-app-name",
                            scopeSeparator: ",",
                            additionalQueryStringParams: {}
                        });
                    }

                    if (window.SwaggerTranslator) {
                        window.SwaggerTranslator.translate();
                    }
                    window.swaggerUi.api.setBasePath(contextPath + '/rest/v1');
                },
                onFailure: function (data) {
                    log("Unable to Load SwaggerUI");
                },
                docExpansion: "none",
                jsonEditor: false,
                defaultModelRendering: 'schema',
                showRequestHeaders: false
            });

            //window.swaggerUi.api.basePath = "/oce/rest/v1";
            window.swaggerUi.load();
            //console.log(window.swaggerUi.api);

            function log() {
                if ('console' in window) {
                    console.log.apply(console, arguments);
                }
            }
        });
    </script>
</head>

<body class="swagger-section">
<div id='header'>
    <div class="swagger-ui-wrap">
        <a id="logo" href="http://swagger.io"><img class="logo__img" alt="swagger" height="30" width="30"
                                                   src="${pageContext.request.contextPath}/resources/swagger/images/logo_small.png"/><span
                class="logo__title">swagger</span></a>

        <form id='api_selector'>
            <div class='input'><input placeholder="http://example.com/api" id="input_baseUrl" name="baseUrl"
                                      type="text"/></div>
            <div id='auth_container'></div>
            <div class='input'><a id="explore" class="header__btn" href="#" data-sw-translate>Explore</a></div>
        </form>
    </div>
</div>


<div id="message-bar" class="swagger-ui-wrap" data-sw-translate>&nbsp;</div>

<div id="swagger-ui-container" class="swagger-ui-wrap"></div>
</body>
</html>

