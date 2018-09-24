defmodule UniversityAccomodationWeb.BillController do
  use UniversityAccomodationWeb, :controller
  alias UniversityAccomodation.Bill

  def index(conn,_params) do
    render conn, "index.html"
  end

  def schearch_user_amoutn_paid(conn,%{"busqueda" => %{"matricula" => matricula}}) do
    case Bill.getAmountPaidByStudent(matricula) do
      [money] ->
      conn
      |> assign(:money,[money])
      |> assign(:matricula, matricula)
      |> render("result.html")
      nil -> render conn, "Nofound.html"
    end
  end

end
