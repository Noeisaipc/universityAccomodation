defmodule UniversityAccomodationWeb.StudentController do
  use UniversityAccomodationWeb, :controller
  alias UniversityAccomodation.Student

  def index(conn, _params) do
    render conn, "index.html"
  end


  def report_students_in_stand_by(conn, _params) do
      students = Student.getStudentWhitOutStudentHouseRoom()
      render(conn, "report.html",students: students)
  end


  def report_students_agrements(conn,_params) do
    students = Student.getAgreementStudentsHouse()
    render(conn,"agrements.html",students: students)
  end


  def list_no_parents(conn,_params) do
    list = Student.getStudentsWhitOutParentAssigned()
    render(conn,"padres.html",students: list)
  end

  def list_category(conn,_params) do
    categories = Student.getStudentsCategory()
    render(conn,"category.html",categories: categories)
  end

end
