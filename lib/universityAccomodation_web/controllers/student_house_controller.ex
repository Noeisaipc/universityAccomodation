defmodule UniversityAccomodationWeb.StudentHouseController do
  use UniversityAccomodationWeb, :controller
  alias UniversityAccomodation.StudentHouse

  def index(conn, _params) do
    students_houses = StudentHouse.getHousesWithOcupedRooms()
    render(conn, "index.html",students_houses: students_houses)
  end


  def get_student_house(conn,_params) do

  end

end
