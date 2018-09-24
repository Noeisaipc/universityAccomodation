defmodule UniversityAccomodationWeb.FlatController do
  use UniversityAccomodationWeb, :controller
  alias UniversityAccomodation.Staff.Inspection

  def index(conn, _params) do
    render conn, "index.html"
  end

  def bad_inspections(conn, _params) do
      inspections = Inspection.getBadInspectons()
      render(conn, "report.html",inspections: inspections)
  end

end
