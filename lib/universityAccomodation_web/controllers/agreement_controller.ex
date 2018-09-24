defmodule UniversityAccomodationWeb.AgreementController do
  use UniversityAccomodationWeb, :controller
  alias UniversityAccomodation.Agreement.StudentAgreement
  alias UniversityAccomodation.Agreement.FlatAgreement

  def agreement_sumer(conn, _params) do
    sumer_agreement_student = StudentAgreement.getAgreementsSumer()
    sumer_agreement_flat = FlatAgreement.getAgreementsSumer()
    conn
    |> assign(:studenthouse, sumer_agreement_student)
    |> assign(:flat, sumer_agreement_flat)
    |> render("sumerAgreements.html")
  end

end
