defmodule UniversityAccomodation.StudentHouse do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "student_houses" do
    field :name, :string
    field :address, :string
    field :phone_number, :string
    has_many :dormitory, UniversityAccomodation.Dormitory.StudentHouseDormitory
    belongs_to :employee,  UniversityAccomodation.Staff.Employee
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :adress, :phone_number])
    |> validate_required([:name, :adress, :phone_number])
  end



  def getHousesWithAvalaibleRooms do
    dormitory_query = from r in UniversityAccomodation.Dormitory.StudentHouseDormitory,
                      where: is_nil(r.student_id)
    query = from h in UniversityAccomodation.StudentHouse,
      join: r in UniversityAccomodation.Dormitory.StudentHouseDormitory,
      where: h.id == r.student_house_id and is_nil(r.student_id),
      distinct: h.id,
      select: h,
      preload: [dormitory: ^dormitory_query]
      UniversityAccomodation.Repo.all(query)
  end

  def getHousesWithOcupedRooms do
    dormitory_query = from r in UniversityAccomodation.Dormitory.StudentHouseDormitory,
                      where: not is_nil(r.student_id),
                      preload: [:student]
    query = from h in UniversityAccomodation.StudentHouse,
      join: r in UniversityAccomodation.Dormitory.StudentHouseDormitory,
      where: h.id == r.student_house_id and not is_nil(r.student_id),
      distinct: h.id,
      select: h,
      preload: [dormitory: ^dormitory_query]
      UniversityAccomodation.Repo.all(query)
  end

  def getRentMax do
    dormitory_query = from r in UniversityAccomodation.Dormitory.StudentHouseDormitory,
                      group_by: r.student_house_id,
                      where: not is_nil(r.student_id),
                      select: [max(r.hire)]

    query = from h in UniversityAccomodation.StudentHouse,
      join: r in UniversityAccomodation.Dormitory.StudentHouseDormitory,
      where: h.id == r.student_house_id and is_nil(r.student_id),
      distinct: h.id,
      select: h,
      preload: [dormitory: ^dormitory_query]
      UniversityAccomodation.Repo.all(query)
  end

  def getRentMin do
    dormitory_query = from r in UniversityAccomodation.Dormitory.StudentHouseDormitory,
                      group_by: r.student_house_id,
                      select: [min(r.hire)]

    query = from h in UniversityAccomodation.StudentHouse,
      join: r in UniversityAccomodation.Dormitory.StudentHouseDormitory,
      where: h.id == r.student_house_id and is_nil(r.student_id),
      distinct: h.id,
      select: h,
      preload: [dormitory: ^dormitory_query]
      UniversityAccomodation.Repo.all(query)
  end

  @spec getNumberOfRooms() :: any()
  def getNumberOfRooms() do
    query = from h in UniversityAccomodation.StudentHouse,
      join: r in UniversityAccomodation.Dormitory.StudentHouseDormitory,on: h.id == r.student_house_id,
      group_by: [h.name],
      select: [h.name,count(r.id)]
      UniversityAccomodation.Repo.all(query)
  end


end
