defmodule UniversityAccomodationWeb.PageController do
  use UniversityAccomodationWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
