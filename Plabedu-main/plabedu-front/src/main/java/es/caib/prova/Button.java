package es.caib.prova;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Button {

	private Calendar beginDate;
	private Calendar finishDate;
	private Calendar executionDate;
	private String id;
	public Calendar getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Calendar beginDate) {
		this.beginDate = beginDate;
	}
	public Calendar getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Calendar finishDate) {
		this.finishDate = finishDate;
	}
		
	public Calendar getExecutionDate() {
		return executionDate;
	}
	public void setExecutionDate(Calendar executionDate) {
		this.executionDate = executionDate;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Button(GregorianCalendar beginDate, GregorianCalendar finishDate, String id) {
		super();
		this.beginDate = beginDate;
		this.finishDate = finishDate;
		this.id = id;
	}
	
	
}
