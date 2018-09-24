defmodule UniversityAccomodationWeb.EmployeeController do
  use UniversityAccomodationWeb, :controller
  alias UniversityAccomodation.Staff.Employee
  def index(conn, _params) do
    render conn, "index.html"
  end

  def get_director(conn,_params) do
      listOfDirectors = Employee.getDirectorEmployee()
      render(conn, "director.html", directors: listOfDirectors)
  end

end
