defmodule UniversityAccomodation.StudentHouse do
  use Ecto.Schema
  import Ecto.Changeset

  schema "student_houses" do
    field :name, :string
    field :adress, :string
    field :phone_number, :string
    has_many :dormitories, UniversityAccomodation.Dormitory
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :adress, :phone_number])
    |> validate_required([:name, :adress, :phone_number])
  end
end
