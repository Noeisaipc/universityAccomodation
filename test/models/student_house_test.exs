defmodule UniversityAccomodation.StudentHouseTest do
  use UniversityAccomodation.ModelCase

  alias UniversityAccomodation.StudentHouse

  @valid_attrs %{adress: "some adress", name: "some name", phone_number: "some phone_number"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = StudentHouse.changeset(%StudentHouse{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = StudentHouse.changeset(%StudentHouse{}, @invalid_attrs)
    refute changeset.valid?
  end
end
