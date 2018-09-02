defmodule UniversityAccomodation.UniversityAccomodation.Agreement do
  use Ecto.Schema
  import Ecto.Changeset


  schema "agreements" do
    field :booking_time, :integer
    field :date_to_arrival, :date
    field :date_to_leave, :date
    field :student_id, :id
    field :dormitory_id, :id

    timestamps()
  end

  @doc false
  def changeset(agreement, attrs) do
    agreement
    |> cast(attrs, [:booking_time, :date_to_arrival, :date_to_leave])
    |> validate_required([:booking_time, :date_to_arrival, :date_to_leave])
  end
end
