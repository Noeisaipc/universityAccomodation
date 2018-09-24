defmodule UniversityAccomodationWeb.Router do
  use UniversityAccomodationWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UniversityAccomodationWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/students/wait-list", StudentController, :report_students_in_stand_by
    get "/students/agrements", StudentController, :report_students_agrements
    get "/students/no-assig-parent", StudentController, :list_no_parents
    get "/students/category", StudentController, :list_category
    get "/employee/list-of-Director", EmployeeController, :get_director
    get "/studenhouse", StudentHouseController, :index
    get "/agreement/available-in-sumer", AgreementController, :agreement_sumer
    get "/flats/bad-reports", FlatController, :bad_inspections
    get "/bills/schearch", BillController, :index
    post "/bills/schearch", BillController, :schearch_user_amoutn_paid
  end

  # Other scopes may use custom stacks.
  # scope "/api", UniversityAccomodationWeb do
  #   pipe_through :api
  # end
end
