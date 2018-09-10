defmodule UniversityAccomodation.Agreement do
  use Ecto.Schema
  import Ecto.Changeset


  schema "agreements" do
    field :booking_time, :integer
    field :date_to_arrival, :date
    field :date_to_leave, :date
    belongs_to :student , UniversityAccomodation.Student
    belongs_to :dormitory, UniversityAccomodation.Dormitory
  end

  @doc false
  def changeset(agreement, attrs) do
    agreement
    |> cast(attrs, [:booking_time, :date_to_arrival, :date_to_leave])
    |> validate_required([:booking_time, :date_to_arrival, :date_to_leave])
  end

end
