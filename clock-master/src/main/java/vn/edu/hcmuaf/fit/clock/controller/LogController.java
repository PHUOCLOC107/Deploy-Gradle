package vn.edu.hcmuaf.fit.clock.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.clock.dao.LogDao;
import vn.edu.hcmuaf.fit.clock.model.Log;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LogController", value = "/logs")
public class LogController extends HttpServlet {
    private LogDao logDao = new LogDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Log> logs = logDao.getAllLogs();
        request.setAttribute("logs", logs);
        request.getRequestDispatcher("logs.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}