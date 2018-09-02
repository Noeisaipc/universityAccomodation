defmodule UniversityAccomodation.DormitoryTest do
  use UniversityAccomodation.ModelCase

  alias UniversityAccomodation.Dormitory

  @valid_attrs %{dormitoryNumber: "some dormitoryNumber", hire: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Dormitory.changeset(%Dormitory{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Dormitory.changeset(%Dormitory{}, @invalid_attrs)
    refute changeset.valid?
  end
end
