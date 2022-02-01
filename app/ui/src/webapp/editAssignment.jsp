<f:view>
	<script>includeLatestJQuery('editAssignment.jsp');</script>
    <link rel="stylesheet" href="/library/webjars/jquery-ui/1.12.1/jquery-ui.min.css" type="text/css" />
    <script type="text/javascript" src="/library/js/lang-datepicker/lang-datepicker.js"></script>
	<div class="portletBody">
	  <h:form id="gbForm">

		<sakai:flowState bean="#{editAssignmentBean}" />

		<t:aliasBean alias="#{bean}" value="#{editAssignmentBean}">
			<%@ include file="/inc/appMenu.jspf"%>

			<%@ include file="/inc/breadcrumb.jspf" %>
		</t:aliasBean>

		<div class="indnt1">

		<t:aliasBean alias="#{bean}" value="#{editAssignmentBean}">
			<%@ include file="/inc/assignmentEditing.jspf"%>
		</t:aliasBean>

		</div>

		<t:aliasBean alias="#{bean}" value="#{editAssignmentBean}">
			<%-- add link to attach a scoring component  --%>
			<%@include file="/inc/scoringAgent/editAssignment.jspf"%>
		</t:aliasBean>

		<p class="act calendarPadding">
			<h:commandButton
				id="saveButton"
				styleClass="active"
				value="#{msgs.edit_assignment_save_changes}"
				action="#{editAssignmentBean.updateAssignment}"/>
			<h:commandButton
				value="#{msgs.add_assignment_cancel}"
				action="#{editAssignmentBean.navigateBack}"
				immediate="true"/>
		</p>
	  </h:form>
	</div>
</f:view>
