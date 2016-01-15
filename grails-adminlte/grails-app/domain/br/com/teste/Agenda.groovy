package br.com.teste

class Agenda {

	String title
	Boolean allDay = false
	Boolean editable = true
	Date start
	Date end
	String url
	String color
	
    static constraints = {
		title blank: false, nullable: false, size: 10..60
		start blank: false, nullable: false
		end blank: false, nullable: false
    }

	@Override
	public String toString() {
		return "Agenda [title=" + title + ", allDay=" + allDay + ", editable="
				+ editable + ", start=" + start + ", end=" + end + ", url="
				+ url + ", color=" + color + "]";
	}	
}
