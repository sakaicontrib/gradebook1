<f:view>
	<script>includeLatestJQuery('editAssignment.jsp');</script>
    <link rel="stylesheet" href="/library/webjars/jquery-ui/1.12.1/jquery-ui.min.css" type="text/css" />
    <script type="text/javascript" src="/library/js/lang-datepicker/lang-datepicker.js"></script>
	<div class="portletBody">
     <h:form id="gbForm">
       <t:aliasBean alias="#{bean}" value="#{spreadsheetUploadBean}">
           <%@ include file="/inc/appMenu.jspf"%>
       </t:aliasBean>
       <sakai:flowState bean="#{spreadsheetUploadBean}" />
       <h2><h:outputText value="#{msgs.import_assignment_page_title}"/></h2>
       <div class="instruction">
           <h:outputText value="#{msgs.import_assignment_instruction}" escape="false"/>
       </div>
       <p/>
       <%@ include file="/inc/globalMessages.jspf"%>
       <h4><h:outputText value="#{msgs.import_assignment_header}"/></h4>

			 <h:panelGrid cellpadding="0" cellspacing="0" columns="2" columnClasses="itemSummaryLite itemName, itemSummaryLite shorttext" styleClass="itemSummaryLite">
					<h:outputLabel for="title" id="titleLabel" value="#{msgs.import_assignment_title}"/>
					<h:panelGroup>
						<h:inputText id="title" value="#{spreadsheetUploadBean.assignment.name}" required="true" >
               <f:validateLength minimum="1" maximum="255"/>
           	</h:inputText>
						<h:message for="title" styleClass="alertMessageInline"/>
					</h:panelGroup>

					<h:outputLabel for="points" id="pointsLabel" value="#{msgs.import_assignment_points}"/>
					<h:panelGroup>
						<h:inputText id="points" required="true" value="#{spreadsheetUploadBean.assignment.pointsPossible}" onkeypress="return submitOnEnter(event, 'gbForm:saveButton');" rendered="#{spreadsheetUploadBean.localGradebook.grade_type != 3 && (!spreadsheetUploadBean.selectedCategoryDropsScores || (spreadsheetUploadBean.selectedCategoryDropsScores && empty spreadsheetUploadBean.assignmentCategory.assignmentList) || (spreadsheetUploadBean.selectedCategoryDropsScores && (spreadsheetUploadBean.assignment.selectedGradeEntryValue == msgs.add_assignment_type_adjustment)))}">
							<f:converter converterId="org.sakaiproject.gradebook.jsf.converter.NONTRAILING_DOUBLE" />
							<f:validateDoubleRange minimum="0.01" />
							<f:validator validatorId="org.sakaiproject.gradebook.jsf.validator.ASSIGNMENT_GRADE"/>
						</h:inputText>
						<h:message for="points" styleClass="alertMessageInline" />
						<h:outputText id="pointsDropScores" value="#{spreadsheetUploadBean.assignmentCategory.itemValue}" rendered="#{spreadsheetUploadBean.selectedCategoryDropsScores && !empty spreadsheetUploadBean.assignmentCategory.assignmentList && (spreadsheetUploadBean.assignment.selectedGradeEntryValue != msgs.add_assignment_type_adjustment)}" />
					</h:panelGroup>
					
					<h:outputText value=""  rendered="#{!spreadsheetUploadBean.extraCreditCatSelected}"/>
					<h:panelGrid columns="2" columnClasses="prefixedCheckbox" rendered="#{!spreadsheetUploadBean.extraCreditCatSelected}">
						<h:selectBooleanCheckbox id="extraCredit" value="#{spreadsheetUploadBean.assignment.isExtraCredit}" onkeypress="return submitOnEnter(event, 'gbForm:saveButton');"/>
						<h:outputLabel for="extraCredit" value="#{msgs.extra_credit}" />
					</h:panelGrid>
           
					<h:panelGroup>
						<h:outputLabel for="dueDate" id="dueDateLabel" value="#{msgs.due_date}"/>
						<h:outputText style="font-weight:normal;" value=" #{spreadsheetUploadBean.dateEntryFormatDescription}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:inputText value="#{spreadsheetUploadBean.assignment.dueDate}" id="dueDate" styleClass="gbDatePicker"><f:convertDateTime pattern="#{msgs.date_entry_format}" /></h:inputText>
						<h:message for="dueDate" styleClass="alertMessageInline" />
					</h:panelGroup>
					
					<h:outputLabel for="category" id="categoryLabel" value="#{msgs.add_assignment_category}" rendered="#{spreadsheetUploadBean.categoriesEnabled}" />
					<h:panelGroup rendered="#{spreadsheetUploadBean.categoriesEnabled}">
                        <h:selectOneMenu id="selectCategory" value="#{spreadsheetUploadBean.selectedCategory}"
							valueChangeListener="#{spreadsheetUploadBean.processCategoryChangeInImport}"
							onchange="this.form.submit();" immediate="true">
							<f:selectItems value="#{(spreadsheetUploadBean.assignment.selectedGradeEntryValue == msgs.add_assignment_type_adjustment) ? spreadsheetUploadBean.categoriesAdjustmentSelectList : spreadsheetUploadBean.categoriesSelectList}" />
						</h:selectOneMenu>
						<f:verbatim><div class="instruction"></f:verbatim>
							<h:outputText value="#{msgs.add_assignment_category_info}" rendered="#{spreadsheetUploadBean.weightingEnabled}"/>
						<f:verbatim></div></f:verbatim>			
					</h:panelGroup>
					
					<h:outputLabel for="selectCommentColumn" id="commentsLabel" value="#{msgs.import_assignment_comments}"/>
          <h:selectOneMenu id="selectCommentColumn" converter="javax.faces.Integer" value="#{spreadsheetUploadBean.selectedCommentsColumnId}">
             <f:selectItem itemValue="" itemLabel="#{msgs.import_assignment_comments_none}"/>
             <f:selectItems value="#{spreadsheetUploadBean.assignmentColumnSelectItems}" />
          </h:selectOneMenu>
					
				</h:panelGrid>
				
				<%/*
					This would be positioned directly under the Point Value entry if
					only JSF supported "colspan"....
				*/%>
				<h:panelGrid columns="2" columnClasses="prefixedCheckbox">
				    <h:selectBooleanCheckbox id="released" value="#{spreadsheetUploadBean.assignment.released}" onclick="assignmentReleased(this.form.name, true);"
						onkeypress="return submitOnEnter(event, 'gbForm:saveButton');"/>
					<h:outputLabel for="released" value="#{msgs.add_assignment_released}" />
					
					<h:outputText escape="false" value="&nbsp;" rendered="#{!spreadsheetUploadBean.localGradebook.assignmentsDisplayed}" />
					<h:outputText styleClass="instruction" value="#{msgs.add_assignment_released_conditional}" rendered="#{!spreadsheetUploadBean.localGradebook.assignmentsDisplayed}" />
				
					<h:outputText escape="false" value="&nbsp;" />
					
					<h:panelGrid columns="2" columnClasses="prefixedCheckbox">
						<h:selectBooleanCheckbox id="countAssignment" value="#{spreadsheetUploadBean.assignment.counted}"
							onkeypress="return submitOnEnter(event, 'gbForm:saveButton');"/>
						<h:outputLabel for="countAssignment" value="#{msgs.add_assignment_counted}" />
					</h:panelGrid>
				</h:panelGrid>
				<h:outputText escape="false" value="<script type='text/javascript'>cat = #{spreadsheetUploadBean.categoriesEnabled};</script>" />
				
				<script type="text/javascript">
					assignmentReleased('gbForm', false);

                    jQuery(document).ready(function(){
                        localDatePicker({
                            input: '#gbForm\\:dueDate',
                            useTime: 0,
                            allowEmptyDate: true,
                            val: $('#gbForm\\:dueDate').val(),
                            ashidden: {
                                iso8601: 'dueDateISO8601',
                                month: "gbForm_dueDate_month",
                                day: "gbForm_dueDate_day",
                                year: "gbForm_dueDate_year"}
                        });
                    });
				</script>

       <p class="act calendarPadding">
           <h:commandButton
                   id="saveButton"
                   styleClass="active"
                   value="#{msgs.import_assignment_submit}"
                   action="#{spreadsheetUploadBean.saveGrades}"/>
           <h:commandButton
                   value="#{msgs.import_assignment_cancel}"
                   action="spreadsheetPreview" immediate="true" />
       </p>
     </h:form>
    </div>
</f:view>
