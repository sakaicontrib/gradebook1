/**********************************************************************************
*
* $Id$
*
***********************************************************************************
*
* Copyright (c) 2005 The Regents of the University of California, The MIT Corporation
*
* Licensed under the Educational Community License Version 1.0 (the "License");
* By obtaining, using and/or copying this Original Work, you agree that you have read,
* understand, and will comply with the terms and conditions of the Educational Community License.
* You may obtain a copy of the License at:
*
*      http://cvs.sakaiproject.org/licenses/license_1_0.html
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
* INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
* AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
* DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*
**********************************************************************************/

package org.sakaiproject.tool.gradebook.ui;

import java.util.*;

/**
 * Singleton bean to set up URL filtering by current user's role.
 */
public class AuthorizationFilterConfigurationBean {
	private List userAbleToEditPages;
	private List userAbleToGradePages;
	private List userGradablePages;

	public List getUserAbleToEditPages() {
		return userAbleToEditPages;
	}
	public void setUserAbleToEditPages(List userAbleToEditPages) {
		this.userAbleToEditPages = userAbleToEditPages;
	}
	public List getUserAbleToGradePages() {
		return userAbleToGradePages;
	}
	public void setUserAbleToGradePages(List userAbleToGradePages) {
		this.userAbleToGradePages = userAbleToGradePages;
	}
	public List getUserGradablePages() {
		return userGradablePages;
	}
	public void setUserGradablePages(List userGradablePages) {
		this.userGradablePages = userGradablePages;
	}
}