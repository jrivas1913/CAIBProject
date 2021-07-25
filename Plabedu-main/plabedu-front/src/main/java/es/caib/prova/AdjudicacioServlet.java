package es.caib.prova;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.json.JsonObject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

/**
 * Servlet implementation class AdjudicacioServlet. 
 */
@WebServlet("/AdjudicacioServlet")
/**
 * La classe AdjudicacioServlet envia un objecte JSON com a paràmetre a Adjudicacio.jsp amb els objectes Plaza
 * per poder-los visualitzar al Datatable.
 * @author e41621391q
 *
 */
public class AdjudicacioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static JSONObject jsonObject;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdjudicacioServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * Recupera una llista amb les places que es volen mostrar al Datatable.
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		jsonObject = new JSONObject();
		Gson gson = new Gson();
		String actString = "show";
		List<Plaza> list = new ArrayList<>();
		// if(actString.equals("show")) {
		list = this.getPlazas();
		JsonElement jsonElement = gson.toJsonTree(list, new TypeToken<List<Plaza>>() {
		}.getType());
		JsonArray jsonArray = jsonElement.getAsJsonArray();
		// Sets the content type of the response being sent to the client.
		response.setContentType("application/json");
		jsonObject.put("status", true);
		jsonObject.put("result", jsonArray);
		response.getWriter().print(jsonObject);
		// }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	private List<Plaza> getPlazas() {
		//AQUI ANIRÀ LA CONSULTA A LA BBDD
		List<Plaza> list = new ArrayList<>();
		list.add(Plaza.createAdjudgedPlace("02-01-2021", "Eventual", "Parcial", "03-01-2021", "15-01-2021",
				"IT", "Mallorca", "Palma", "Riera Bosch, Barbara", "IES Ses Estacions"));
		list.add(Plaza.createAdjudgedPlace("08-01-2021", "Lloc vacant", "Completa", "10-01-2021", "20-01-2021",
				"Paternitat", "Eivissa", "Santa Eulària Des Riu", "Afanador Garcia, Marc", "IES Xarc"));
		list.add(Plaza.createAdjudgedPlace("12-01-2021", "Substitució", "Completa", "20-01-2021", "01-02-2021",
				"Excedència", "Menorca", "Alaior", "Gallardo Beltran, Maria Antònia",
				"IES Josep Miquel Guàrdia"));
		list.add(Plaza.createAdjudgedPlace("01-02-2021", "Eventual", "Completa", "05-02-2021", "15-02-2021",
				"IT", "Formentera", "Sant Francesc Xavier", "Ginés Rodriguez, Juan Antonio",
				"IES Marc Ferrer"));
		return list;
	}

}
