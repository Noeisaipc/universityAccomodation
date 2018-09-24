defmodule UniversityAccomodation.Agreement.FlatAgreement do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query


  schema "flat_agreements" do
    field :booking_time, :integer
    field :date_to_arrival, :date
    field :date_to_leave, :date
    belongs_to :student , UniversityAccomodation.Student
    belongs_to :dormitory, UniversityAccomodation.Dormitory.FlatDormitory

  end

  @doc false
  def changeset(flat_agreement, attrs) do
    flat_agreement
    |> cast(attrs, [:booking_time, :date_to_arrival, :date_to_leave])
    |> validate_required([:booking_time, :date_to_arrival, :date_to_leave])
  end

  def getAgreementsSumer do
    query = from a in UniversityAccomodation.Agreement.FlatAgreement,
        where: a.booking_time >= 2
    UniversityAccomodation.Repo.all(query)
  end

end
