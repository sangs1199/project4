package in.co.sunrays.proj4.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.CoursesBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.model.CoursesModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;

/**
 * Course List functionality Controller. Performs operation for list, search
 * and delete operations of Course
 * 
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 *
 */
@WebServlet(name = "CourseListCtl", urlPatterns = { "/ctl/CoursesListCtl" })
public class CoursesListCtl extends BaseCtl {

	private static Logger log = Logger.getLogger(CoursesListCtl.class);

	
	/**
	 * Loads list and other data required to display at HTML form
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 */
	@Override
	protected void preload(HttpServletRequest request) {

		CoursesModel courseModel = new CoursesModel();
		try {
			List list = courseModel.list();
			request.setAttribute("courseList", list);
		} catch (ApplicationException e) {
			log.error(e);
		}

	}

	
	/**
	 * Populates CourseBean object from request parameters
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @return bean:
	 * 				CourseBean object
	 */
	@Override
	protected BaseBean populateBean(HttpServletRequest request) {
		CoursesBean bean = new CoursesBean();

		bean.setId(DataUtility.getLong(request.getParameter("courseId")));
		bean.setName(DataUtility.getString(request.getParameter("name")));
		bean.setDuration(DataUtility.getString(request.getParameter("duration")));
		return bean;
	}

	/**
	 * Display Course List
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @param response:
	 * 					HttpServletResponse object
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("CourseListCtl doGet Start");
		List list = null;
		int pageNo = 1;
		int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
		CoursesBean bean = (CoursesBean) populateBean(request);
		String op = DataUtility.getString(request.getParameter("operation"));

		CoursesModel model = new CoursesModel();
		try {
			list = model.search(bean, pageNo, pageSize);
			ServletUtility.setList(list, request);
			if (list == null || list.size() == 0) {
				ServletUtility.setErrorMessage("No record found ", request);
			}
			ServletUtility.setList(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);
		} catch (ApplicationException e) {
			log.error(e);
			ServletUtility.handleException(e, request, response);
			return;
		}
		log.debug("CourseListCtl doGet End");
	}

	/**
	 * Contains Submit logics
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
		log.debug("CourseListCtl doPost Start");
		List list = null;
		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

		pageNo = (pageNo == 0) ? 1 : pageNo;
		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;
		CoursesBean bean = (CoursesBean) populateBean(request);
		String op = DataUtility.getString(request.getParameter("operation"));
		// get the selected checkbox ids array for delete list
		String[] ids = request.getParameterValues("chk_1");
		CoursesModel model = new CoursesModel();
		try {

			if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op) || "Previous".equalsIgnoreCase(op)) {

				if (OP_SEARCH.equalsIgnoreCase(op)) {
					pageNo = 1;
				} else if (OP_NEXT.equalsIgnoreCase(op)) {
					pageNo++;
				} else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
					pageNo--;
				}

			} else if (OP_NEW.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.COURSES_CTL, request, response);
				return;
			} else if (OP_DELETE.equalsIgnoreCase(op)) {
				pageNo = 1;
				if (ids != null && ids.length > 0) {
					CoursesBean deletebean = new CoursesBean();
					for (String id : ids) {
						deletebean.setId(DataUtility.getInt(id));
						model.delete(deletebean);
						ServletUtility.setSuccessMessage("Record successfully deleted", request);
					}
				} else {
					ServletUtility.setErrorMessage("Select at least one record", request);
				}
			} else if (OP_RESET.equalsIgnoreCase(op) || OP_BACK.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.COURSES_LIST_CTL, request, response);
				return;
			}
			list = model.search(bean, pageNo, pageSize);
			//request.setAttribute("courseList", list);
			//ServletUtility.setList(list, request);
			
				if ((list == null || list.size() == 0)&&!OP_DELETE.equalsIgnoreCase(op)) {
					ServletUtility.setErrorMessage("No records Found", request);
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
		log.debug("CourseListCtl doPost End");
	}

	
	/**
	 * Returns the VIEW page of CourseListCtl
	 * 
	 * @return CourseListView.jsp:
	 * 								View page of CourseListCtl
	 */
	@Override
	protected String getView() {
		return ORSView.COURSES_LIST_VIEW;
	}
}
