package in.co.sunrays.proj4.controller;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.SubjectsBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.model.CoursesModel;
import in.co.sunrays.proj4.model.SubjectsModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * College List functionality Controller. Performs operation for list, search
 * and delete operations of College
 * 
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 */
@WebServlet(name = "SubjectListCtl", urlPatterns = { "/ctl/SubjectListCtl" })
public class SubjectListCtl extends BaseCtl {

	private static Logger log = Logger.getLogger(SubjectListCtl.class);

	/**
	 * Loads list and other data required to display at HTML form
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 */
	@Override
	protected void preload(HttpServletRequest request) {

		SubjectsModel model = new SubjectsModel();
		CoursesModel cmodel = new CoursesModel();
		try {
			List subjectList = model.list();
			List courseList = cmodel.list();
			request.setAttribute("subjectList", subjectList);
			request.setAttribute("courseList", courseList);
		} catch (ApplicationException e) {
			log.error(e);
		}
	}

	/**
	 * Populates the SubjectBean object from request parameters
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @return bean:
	 * 				SubjectBean object
	 */
	@Override
	protected BaseBean populateBean(HttpServletRequest request) {

		SubjectsBean bean = new SubjectsBean();

		bean.setId(DataUtility.getLong(request.getParameter("subjectId")));
		bean.setName(DataUtility.getString(request.getParameter("name")));
		bean.setDescription(DataUtility.getString(request.getParameter("description")));
		bean.setCourseId(DataUtility.getLong(request.getParameter("courseId")));

		return bean;
	}

	/**
	 * Display Subject List
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @param response:
	 * 					HttpServletResponse object
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int pageNo = 1;
		int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));

		SubjectsBean bean = (SubjectsBean) populateBean(request);
		SubjectsModel model = new SubjectsModel();

		List list = null;

		try {
			list = model.search(bean, pageNo, pageSize);
		} catch (ApplicationException e) {
			log.error(e);
			ServletUtility.handleException(e, request, response);
			return;
		}

		if (list == null || list.size() == 0) {
			ServletUtility.setErrorMessage("No record found ", request);
		}

		ServletUtility.setList(list, request);
		ServletUtility.setPageNo(pageNo, request);
		ServletUtility.setPageSize(pageSize, request);
		ServletUtility.forward(getView(), request, response);
	}

	/**
	 * Contains submit logic
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @param response:
	 * 					HttpServletResponse object 
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		log.debug("SubjectListCtl doPost Start");

		List list = null;

		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

		pageNo = (pageNo == 0) ? 1 : pageNo;

		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;

		SubjectsBean bean = (SubjectsBean) populateBean(request);

		String op = DataUtility.getString(request.getParameter("operation"));

		// get the selected checkbox ids array for delete list
		String[] ids = request.getParameterValues("chk_1");

		SubjectsModel model = new SubjectsModel();

		try {

			if (OP_SEARCH.equalsIgnoreCase(op) || OP_NEXT.equalsIgnoreCase(op) || OP_PREVIOUS.equalsIgnoreCase(op)) {

				if (OP_SEARCH.equalsIgnoreCase(op)) {
					pageNo = 1;
				} else if (OP_NEXT.equalsIgnoreCase(op)) {
					pageNo++;
				} else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
					pageNo--;
				}

			} else if (OP_NEW.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.SUBJECTS_CTL, request, response);
				return;
			} else if (OP_DELETE.equalsIgnoreCase(op)) {
			
				pageNo = 1;
				if (ids != null && ids.length > 0) {
					SubjectsBean deletebean = new SubjectsBean();
					for (String id : ids) {
						deletebean.setId(DataUtility.getInt(id));
						model.delete(deletebean);
						ServletUtility.setSuccessMessage("Record deleted Successfully", request);
					}
				} else {
					ServletUtility.setErrorMessage("Select at least one record", request);
				}
			}else if(OP_RESET.equalsIgnoreCase(op) || OP_BACK.equalsIgnoreCase(op)){
				ServletUtility.redirect(ORSView.SUBJECTS_LIST_CTL, request, response);
				return;
			}
			
			list = model.search(bean, pageNo, pageSize);
			ServletUtility.setList(list, request);
			if ((list == null || list.size() == 0) && !OP_DELETE.equalsIgnoreCase(op)) {
				ServletUtility.setErrorMessage("No record found ", request);
			}
			ServletUtility.setBean(bean, request);
			ServletUtility.setList(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);
		} catch (ApplicationException e) {
			log.error(e);
			ServletUtility.handleException(e, request, response);
			return;
		}

		log.debug("SubjectListCtl doPost End");
	}

	/**
	 * Returns the view page of SubjectListCtl
	 * 
	 * @return SubjectListView.jsp:
	 * 								View page of SubjectListCtl
	 */
	@Override
	protected String getView() {
		return ORSView.SUBJECTS_LIST_VIEW;
	}
}
