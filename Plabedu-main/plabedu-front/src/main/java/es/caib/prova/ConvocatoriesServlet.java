package es.caib.prova;
import es.caib.prova.Convocatoria;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Proves
 */
@WebServlet("/ConvocatoriesServlet")
public class ConvocatoriesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Button> buttonList = new ArrayList<>();
	GregorianCalendar startObertTramit = new GregorianCalendar(2021, 05, 8, 0, 0);
	GregorianCalendar finishObertTramit = new GregorianCalendar(2021, 05, 10, 0, 0);
	GregorianCalendar startExecucioTramit = new GregorianCalendar(2021, 05, 10, 0, 1);
	GregorianCalendar finishExecucioTramit = new GregorianCalendar(2021, 05, 10, 23, 59);
	public ConvocatoriesServlet() {
		super();
		
		this.createButtons(startObertTramit, finishObertTramit, "obert");
		this.createButtons(startExecucioTramit, finishExecucioTramit, "execucio");
	}

	private void createButtons(GregorianCalendar beginDate, GregorianCalendar finishDate, String id) {
		Button button = new Button(beginDate, finishDate, id);
		this.buttonList.add(button);
	}

	private boolean insideThreshold(Button button) {
		Calendar calendar = new GregorianCalendar(2021, 05, 11, 0, 28);
		if (calendar.after(button.getBeginDate()) && calendar.before(button.getFinishDate())) return false;
		return true;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id="";
		
		for(Button button:buttonList) {
			if(!this.insideThreshold(button)) id=button.getId();
		}
		if(id.equals("")) {
			id="tancat";
		}
		List<Convocatoria> convocatories = this.getAllConvocatories();
		request.setAttribute("convocatories", convocatories);
		request.setAttribute("id", id);
		RequestDispatcher myDispatcher = request.getRequestDispatcher("/Convocatories.jsp");
		myDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private List<Convocatoria> getAllConvocatories() {
		
		List<Convocatoria> convocatories = new ArrayList<>();
		
		convocatories.add(Convocatoria.crearConvocatoria("C397 - LLOC DE FEINA DEL 7 AL 10 DE MAIG DE 2021", "07/05/2021", "07/05/2021 12:32", "10/05/2021 12:00"));
		convocatories.add(Convocatoria.crearConvocatoria("C395 - LLOC DE FEINA DEL 30 D'ABRIL AL 03 DE MAIG DE 2021", "30/04/2021", "30/04/2021 12:25", "04/05/2021 09:00"));
		convocatories.add(Convocatoria.crearConvocatoria("C393 - LLOC DE FEINA DEL 23 AL 26 D'ABRIL DE 2021", "23/04/2021", "23/04/2021 13:11", "26/04/2021 12:00"));
		return convocatories;
	}

}
