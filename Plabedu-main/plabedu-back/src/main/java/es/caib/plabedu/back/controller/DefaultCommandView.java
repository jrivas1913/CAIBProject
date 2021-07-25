package es.caib.plabedu.back.controller;

import javax.inject.Named;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

@Named
@RequestScoped
public class DefaultCommandView {

    private String text;


    private String btn = "btn1";

    private List<String> buttons;

    @PostConstruct
    public void init() {
        buttons = new ArrayList<String>();
        buttons.add("btn1");
    }

    public String getBtn() {
        return btn;
    }

    public void setBtn(String btn) {
        this.btn = btn;
    }

    public List<String> getButtons() {
        return buttons;
    }

    public void setButtons(List<String> buttons) {
        this.buttons = buttons;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void addMessage(String btn) {
        FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Enviat a  " + btn));
    }

    public void btn1Submit() {
        addMessage("btn1");
    }
}
