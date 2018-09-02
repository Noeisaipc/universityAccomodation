defmodule UniversityAccomodation.Student do
  use Ecto.Schema
  import Ecto.Changeset



  schema "students" do
    field :matricula, :string
    field :name, :string
    field :last_name, :string
    field :adress,  :string
    has_one :dormitory, UniversityAccomodation.Dormitory

  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:matricula,:name, :last_name,:adress])
    |> cast_assoc(:dormitory)
    |> validate_required([:matricula,:name, :last_name,:adress])
  end

end
