<%@ include file="/WEB-INF/jsp/includes/taglibs.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title><c:out value="${builderLabel}"/> : <c:out value="${builderDef.name}"/></title>

        <jsp:include page="/WEB-INF/jsp/includes/scripts.jsp" />
        <jsp:include page="/WEB-INF/jsp/console/plugin/library.jsp" />
        
        <link id="favicon" rel="alternate icon" href="${pageContext.request.contextPath}/images/favicon.ico" /> 
        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap4/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/wro/advancedTool.css?build=<fmt:message key="build.number"/>">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/builder/builder.css?build=<fmt:message key="build.number"/>" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/line-awesome-1.3.0/css/line-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jsondiffpatch/jsondiffpatchhtml.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/builder_custom.css?build=<fmt:message key="build.number"/>">
        <jsp:include page="/WEB-INF/jsp/includes/css.jsp" />
        ${builderCSS}
    </head>
    <body id="cbuilder" class="no-right-panel">
        <div id="top-panel">
            <a id="builderIcon" class="reload" style="background-color:${builderColor};" onclick="location.reload(true);">
                <i class="fa-2x ${builderIcon}"></i>
                <div id="builderTitle"><span><c:out value="${builderLabel}"/></span></div>
            </a>
            <div id="builder-quick-nav">
                <i class="fas fa-caret-down"></i>
                <i class="fas fa-caret-up"></i>
                <div id="builder-menu" style="display: none;">
                    <div id="builder-menu-search">
                        <input type="text" placeholder="<fmt:message key="cbuilder.search"/>" value="" />
                        <button class="clear-backspace">
                            <i class="la la-close"></i>
                        </button>
                    </div>
                    <ul>
                    </ul>
                </div>
            </div>
            <div id="top-panel-main">
                <div id="builderElementName" style="color:${builderColor};"><c:out value="${appDefinition.name}" /> v${appDefinition.version}: <c:out value="${builderDef.name}"/> <c:if test="${appDefinition.published}"><small>(<fmt:message key="console.app.common.label.published"/>)</small></c:if></div>
                <div id="builderToolbar">
                    <div class="btn-group tool copypaste mr-1" style="display:none;"  role="group">
                        <button class="btn btn-light disabled" title="<fmt:message key="ubuilder.copy"/> (Ctrl + C)" id="copy-element-btn" data-cbuilder-action="copyElement" data-cbuilder-shortcut="ctrl+c">
                            <i class="las la-copy"></i>
                        </button>

                        <button class="btn btn-light disabled"  title="<fmt:message key="ubuilder.paste"/> (Ctrl + V)" id="paste-element-btn" data-cbuilder-action="pasteElement" data-cbuilder-shortcut="ctrl+v">
                            <i class="las la-paste"></i>
                        </button>
                    </div>
                    
                    <div class="btn-group tool mr-3" role="group">
                        <button class="btn btn-light disabled" title="<fmt:message key="ubuilder.undo"/> (Ctrl + Z)" id="undo-btn" data-cbuilder-action="undo" data-cbuilder-shortcut="ctrl+z">
                            <i class="la la-undo"></i>
                        </button>

                        <button class="btn btn-light disabled"  title="<fmt:message key="ubuilder.redo"/> (Ctrl + Shift + Z)" id="redo-btn" data-cbuilder-action="redo" data-cbuilder-shortcut="ctrl+shift+z">
                            <i class="la la-undo la-flip-horizontal"></i>
                        </button>
                    </div>
                    
                    <div class="btn-group mr-3" role="group">
                        <button class="btn btn-light active-view" title="<fmt:message key="ubuilder.design"/>" id="design-btn" type="button" data-toggle="button" aria-pressed="false" data-cbuilder-view="design" data-cbuilder-action="switchView">
                            <i class="las la-pencil-ruler"></i> <span><fmt:message key="ubuilder.design"/></span>
                        </button>
                        <button class="btn btn-light" title="<fmt:message key="ubuilder.properties"/>" id="porperties-btn" type="button" data-toggle="button" aria-pressed="false" data-cbuilder-view="properties" data-cbuilder-action="switchView">
                            <i class="la la-cog"></i> <span><fmt:message key="ubuilder.properties"/></span>
                        </button>
                        <button class="btn btn-light"  title="<fmt:message key="ubuilder.preview"/>" id="preview-btn" type="button" data-toggle="button" aria-pressed="false" data-cbuilder-view="preview" data-cbuilder-action="switchView">
                            <i class="la la-eye"></i> <span><fmt:message key="ubuilder.preview"/></span>
                        </button>
                    </div> 
                    
                    <div class="btn-group mr-3 advanced-tools-toogle" role="group">
                        <button class="btn btn-light"  title="<fmt:message key="adv.tool.Advanced.Tools"/>" id="advanced-tools-btn" type="button" data-toggle="button" aria-pressed="false" data-cbuilder-action="enableEnhancedTools">
                             <i class="las la-toolbox"></i> <span><fmt:message key="adv.tool.Advanced.Tools"/><span>
                        </button>
                    </div>
                    
                    <div class="btn-group mr-3 advanced-tools" style="display:none;" role="group">
                        <button class="btn btn-light" title="<fmt:message key="adv.tool.Tree.Viewer"/>" id="treeviewer-btn" type="button" data-toggle="button" aria-pressed="false" data-cbuilder-view="treeViewer" data-cbuilder-action="switchView">
                            <i class="la la-sitemap"></i>
                        </button>
                            
                        <button class="btn btn-light" title="<fmt:message key="cbuilder.xray"/>" id="xray-btn" type="button" data-toggle="button" aria-pressed="false" data-cbuilder-view="xray" data-cbuilder-action="switchView">
                            <i class="las la-x-ray"></i>
                        </button>
                        
                        <button class="btn btn-light" title="<fmt:message key="adv.tool.permission"/>" id="permission-btn" type="button" data-toggle="button" aria-pressed="false" data-cbuilder-view="permission" data-cbuilder-action="switchView">
                            <i class="la la-lock"></i>
                        </button>
                        
                        <button class="btn btn-light" title="<fmt:message key="adv.tool.Usages"/>" id="usages-btn" type="button" data-toggle="button" aria-pressed="false" data-cbuilder-view="findUsages" data-cbuilder-action="switchView">
                            <i class="la la-binoculars"></i>
                        </button>
                        
                        <button class="btn btn-light" title="<fmt:message key="adv.tool.i18n"/>" id="i18n-btn" type="button" data-toggle="button" aria-pressed="false" data-cbuilder-view="i18n" data-cbuilder-action="switchView">
                            <i class="la la-language"></i>
                        </button>
                        
                        <button class="btn btn-light" title="<fmt:message key="adv.tool.Diff.Checker"/>" id="diff-checker-btn" type="button" data-toggle="button" aria-pressed="false" data-cbuilder-view="diffChecker" data-cbuilder-action="switchView">
                            <i class="la la-code-branch"></i>
                        </button>
                        
                        <button class="btn btn-light" title="<fmt:message key="adv.tool.JSON.Definition"/>" id="json-def-btn" type="button" data-toggle="button" aria-pressed="false" data-cbuilder-view="jsonDef" data-cbuilder-action="switchView">
                            <i class="la la-code"></i>
                        </button>
                            
                        <a id="hide-advanced-tools-btn" title="<fmt:message key="cbuilder.hideAdvancedTools"/>" data-cbuilder-action="disableEnhancedTools"><i class="las la-angle-right"></i></a>    
                    </div>  
                    
                    <div class="btn-group mr-3 float-right" style="margin-top:-16px;" role="group">
                        <button class="btn btn-primary btn-icon" title="<fmt:message key="ubuilder.save"/> (Ctrl + S)" id="save-btn" data-cbuilder-action="save" data-v-cbuilder-shortcut="ctrl+s">
                            <i class="las la-cloud-upload-alt"></i> <span><fmt:message key="ubuilder.save"/></span>
                        </button>
                    </div>  
                    
                    <div class="btn-group mr-3 responsive-buttons float-right" style="display:none;" role="group">
                        <button id="mobile-view" data-view="mobile" class="btn btn-light"  title="<fmt:message key="cbuilder.mobileView"/>" data-cbuilder-action="viewport">
                            <i class="la la-mobile-phone"></i>
                        </button>

                        <button id="tablet-view"  data-view="tablet" class="btn btn-light"  title="<fmt:message key="cbuilder.tabletView"/>" data-cbuilder-action="viewport">
                            <i class="la la-tablet"></i>
                        </button>

                        <button id="desktop-view"  data-view="desktop" class="btn btn-light active"  title="<fmt:message key="cbuilder.desktopView"/>" data-cbuilder-action="viewport">
                            <i class="la la-laptop"></i>
                        </button>
                    </div>
                </div>
            </div>  
        </div>
        <div id="left-panel">
            <div class="drag-elements">
                <div class="header">
                    <ul class="nav nav-tabs  nav-fill" id="elements-tabs" role="tablist" style="display:none;">
                        <li class="nav-item component-tab">
                            <a class="nav-link active" id="components-tab" data-toggle="tab" href="#components" role="tab" aria-controls="components" aria-selected="true" title="<fmt:message key="cbuilder.elements"/>"><div><small><fmt:message key="cbuilder.elements"/></small></div></a>
			</li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="components" role="tabpanel" aria-labelledby="components-tab">
                            <div class="search">
			        <input class="form-control form-control-sm component-search" placeholder="<fmt:message key="cbuilder.search"/>" type="text" data-cbuilder-action="tabSearch" data-cbuilder-on="keyup">
                                <button class="clear-backspace"  data-cbuilder-action="clearTabSearch">
                                    <i class="la la-close"></i>
                                </button>
                            </div>
                            <div class="drag-elements-sidepane sidepane">
                                <div>
                                    <ul class="components-list clearfix" data-type="leftpanel">
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button id="left-panel-toogle" data-cbuilder-action="toogleLeftPanel">
                <i class="las la-angle-left"></i>
            </button>
        </div>
        <div id="builder_canvas">
            ${builderCanvas}
        </div>
        <div id="right-panel">
            <div id="right-panel-content" class="element-properties ">
                <div class="element-properties-header-actions">
                    <div class="float-left">
                        <button id="apply-btn" title="<fmt:message key="cbuilder.apply"/>" class="btn btn-primary btn-sm" data-cbuilder-action="applyElementProperties">
                            <i class="las la-check"></i>
                        </button>
                        <button id="cancel-properties-btn" title="<fmt:message key="cbuilder.cancel"/>" class="btn btn-secondary btn-sm" data-cbuilder-action="closePropertiesWindow">
                            <i class="las la-times"></i>
                        </button>
                    </div>
                    <div class="float-right">
                        <button id="properties-max-button" title="<fmt:message key="cbuilder.maximize"/>" class="btn btn-secondary btn-sm"  data-cbuilder-action="maxPropertiesWindow">
                            <i class="lar la-window-maximize"></i>
                        </button>
                        <button id="properties-min-button" title="<fmt:message key="cbuilder.minimize"/>" class="btn btn-secondary btn-sm"  data-cbuilder-action="minPropertiesWindow" data-cbuilder-shortcut="esc" style="display:none" >
                            <i class="lar la-window-minimize"></i>
                        </button>
                        <button id="properties-close-button" title="<fmt:message key="cbuilder.close"/>" class="btn btn-secondary btn-sm"  data-cbuilder-action="closePropertiesWindow" style="display:none">
                            <i class="las la-window-close"></i>
                        </button>
                    </div> 
                    <div class="clear"></div>        
                </div>
                <div class="element-properties-header">
                    <div class="search">
                        <input class="form-control form-control-sm component-search" placeholder="<fmt:message key="cbuilder.search"/>" type="text" data-cbuilder-action="propertySearch" data-cbuilder-on="keyup">
                        <button class="clear-backspace"  data-cbuilder-action="clearPropertySearch">
                            <i class="la la-close"></i>
                        </button>
                    </div>
                </div>
                <ul class="nav nav-tabs nav-fill" id="properties-tabs" role="tablist">
                    <li id="element-properties-tab-link" class="nav-item content-tab">
                        <a class="nav-link show active" data-toggle="tab" href="#element-properties-tab" role="tab" aria-controls="element-properties-tab" aria-selected="true">
                            <i class="las la-file-invoice"></i> <span><fmt:message key="ubuilder.properties"/></span>
                        </a>
                    </li>
                    <li id="style-properties-tab-link" class="nav-item content-tab" style="display:none;">
                        <a class="nav-link" data-toggle="tab" href="#style-properties-tab" role="tab" aria-controls="style-properties-tab" aria-selected="true">
                            <i class="las la-palette"></i> <span><fmt:message key="cbuilder.styles"/></span>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="element-properties-tab" class="tab-pane fade active show">
                        
                    </div>
                    <div id="style-properties-tab" class="tab-pane fade">
                        
                    </div>
                </div>
            </div>    
            <button id="right-panel-toogle" data-cbuilder-action="toogleRightPanel">
                <i class="las la-angle-right"></i>
            </button>
        </div>    
        <div id="bottom-panel">
            <div id="cbuilder-advanced">
                <div id="cbuilder-info" style="display: none">
                    <form id="cbuilder-preview" action="?" target="preview-iframe" method="post">
                        <textarea id="cbuilder-json" name="json" cols="80" rows="10" style="font-size: smaller"><c:out value="${builderDefJson}"/></textarea>
                        <textarea id="cbuilder-json-original" name="json-original" cols="80" rows="10" style="display:none;"><c:out value="${builderDefJson}"/></textarea>
                        <textarea id="cbuilder-json-current" name="json-current" cols="80" rows="10" style="display:none;"><c:out value="${builderDefJson}"/></textarea>
                    </form>
                    <button onclick="CustomBuilder.updateFromJson()" class="btn button btn-secondary"><fmt:message key="console.builder.update"/></button>
                </div>
            </div>
            <fmt:message key="console.builder.footer"/>
        </div>
        
        <div id="builder-message"></div>
        <div id="builder-screenshot"></div>
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jsondiffpatch/jsondiffpatch.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jsondiffpatch/jsondiffpatch-formatters.min.js"></script>  
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jsondiffpatch/diff_match_patch_uncompressed.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/builderutil.js"></script>
        <script type='text/javascript' src='${pageContext.request.contextPath}/js/boxy/javascripts/jquery.boxy.js'></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery.jeditable.js"></script>
        <script>
            /*** Handle jQuery plugin naming conflict between jQuery UI and Bootstrap ***/
            $.widget.bridge('uibutton', $.ui.button);
            $.widget.bridge('uitooltip', $.ui.tooltip);
        </script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap4/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/builder/jquery.hotkeys.js"></script>
        <script src="${pageContext.request.contextPath}/web/console/i18n/advtool?build=<fmt:message key="build.number"/>"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/wro/advancedTool.js?build=<fmt:message key="build.number"/>"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/web/console/i18n/cbuilder?type=${builderCode}&build=<fmt:message key="build.number"/>"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/builder/builder.js"></script>
        ${builderJS}
        <script>
                $(function () {
                    CustomBuilder.saveUrl = '<c:out value="${saveUrl}"/>';
                    CustomBuilder.previewUrl = '<c:out value="${previewUrl}"/>';
                    CustomBuilder.contextPath = '${pageContext.request.contextPath}';
                    CustomBuilder.appId = '<c:out value="${appDefinition.id}"/>';
                    CustomBuilder.appVersion = '<c:out value="${appDefinition.version}"/>';
                    CustomBuilder.appPath = '/<c:out value="${appDefinition.id}"/>/<c:out value="${appDefinition.version}"/>';
                    CustomBuilder.builderType = '<c:out value="${builderCode}"/>';
                    CustomBuilder.builderLabel = '<c:out value="${builderObjectLabel}"/>';
                    CustomBuilder.builderColor = '<c:out value="${builderColor}"/>';
                    CustomBuilder.builderIcon = '<c:out value="${builderIcon}"/>';
                    CustomBuilder.id = '<c:out value="${builderDef.id}"/>';

                    CustomBuilder.initConfig(${builderConfig});
                    CustomBuilder.initPropertiesOptions(${builderProps});
                    
                    CustomBuilder.initBuilder(function() {
                        CustomBuilder.loadJson($("#cbuilder-json").val());
                    });
                });
        </script>    
        <jsp:include page="/WEB-INF/jsp/console/apps/adminBar.jsp" flush="true">
            <jsp:param name="appId" value="${appDefinition.id}"/>
            <jsp:param name="appVersion" value="${appDefinition.version}"/>
            <jsp:param name="webConsole" value="true"/>
            <jsp:param name="builderMode" value="true"/>
        </jsp:include>
    </body>
</html>
