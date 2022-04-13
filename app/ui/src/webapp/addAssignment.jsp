<f:view>
		<%
		  String thisId = "Main" + org.sakaiproject.tool.cover.ToolManager.getCurrentPlacement().getId();
		%>
	<script type="text/javascript">
		var thisId = "<%= thisId %>";
		var MAX_NEW_ITEMS = <h:outputText value="#{msgs.add_assignment_max_bulk_items}" />;
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/multiItemAdd.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/datePicker.js"></script>
	<script src="/library/js/spinner.js" type="text/javascript"></script>
	<script>includeLatestJQuery('addAssignment.jsp');</script>
    <link rel="stylesheet" href="/library/webjars/jquery-ui/1.12.1/jquery-ui.min.css" type="text/css" />
    <script type="text/javascript" src="/library/js/lang-datepicker/lang-datepicker.js"></script>

   <div class="portletBody">
	<h:form id="gbForm">

		<t:aliasBean alias="#{bean}" value="#{addAssignmentBean}">
			<%@ include file="/inc/appMenu.jspf"%>
			<%@ include file="/inc/breadcrumb.jspf" %>
		</t:aliasBean>

		<sakai:flowState bean="#{addAssignmentBean}" />

		<p class="instruction"><h:outputText value="#{msgs.add_assignment_instruction}" /></p>
		<t:aliasBean alias="#{bean}" value="#{addAssignmentBean}">
			<%@ include file="/inc/globalMessages.jspf"%>

			<%-- Allows bulk creation of Gradebook Items --%>
			<%@ include file="/inc/bulkNewItems.jspf" %>
		</t:aliasBean>

		<%-- Calls a javascript function to add another Add Gradebook Item Pane --%>
		<h:outputLink id="addSecond" value="#" styleClass="addSecond act" >
			<h:outputText value="#{msgs.add_assignment_add_pane}" />
		</h:outputLink>

		<%-- Keeps track of how many panes are displayed --%>
		<h:inputHidden id="numTotalItems" value="#{addAssignmentBean.numTotalItems}" />
		
		<p class="act calendarPadding">
			<h:commandButton
				id="saveButton"
				styleClass="active"
				value="#{msgs.add_assignment_submit}"
				action="#{addAssignmentBean.saveNewAssignment}"
				onclick="SPNR.disableControlsAndSpin( this, null );" />
			<h:commandButton
				value="#{msgs.add_assignment_cancel}"
				action="overview" immediate="true"
				onclick="SPNR.disableControlsAndSpin( this, null );" />
		</p>
 		
 		<%-- Need to attach listeners, must be here --%>
 		<script type="text/javascript">
            jQuery(document).ready(function(){
                // Add functionality for Add another link on page
                jQuery('#gbForm\\:addSecond').click(function(event) {
                    addItemScreen();
                	adjustNumBulkItems(1);
                });

                // adds X remove icon to first pane if more than 2 are displayed
                if (getNumTotalItem() >= 2) {
                    addDelX();
                }

                // Init date pickers
                jQuery('.gbDatePicker').each( function(index, data) {
                    var inputId = this.id;
                    if (inputId !== '' && inputId.endsWith('dueDate')) {
                        // Get the input position
                        var inputPosition = inputId.replace('gbForm:bulkNewAssignmentsTable:', '').replace(':dueDate', '');
                        initLocalDatePicker(inputPosition);
                    }
                });
 			});
		    setMainFrameHeight('<%= thisId %>');
  		</script>
  	</h:form>
  </div>
</f:view>
