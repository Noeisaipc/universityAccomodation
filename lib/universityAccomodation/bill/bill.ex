defmodule UniversityAccomodation.Bill do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query


  schema "bills" do
    field :ammount_to_pay, :integer
    field :first_recordatory, :date
    field :matricula, :string
    field :num_agreement, :integer
    field :pay_date, :date
    field :payment_method, :string
    field :resident_addres, :string
    field :room_name, :string
    field :room_number, :integer
    field :second_recordatory, :date
    field :semestre, :integer
    field :student_name, :string


  end

  @doc false
  def changeset(bill, attrs) do
    bill
    |> cast(attrs, [:matricula, :student_name, :num_agreement, :semestre, :ammount_to_pay, :room_number, :room_name, :resident_addres, :pay_date, :payment_method, :first_recordatory, :second_recordatory])
    |> validate_required([:matricula, :student_name, :num_agreement, :semestre, :ammount_to_pay, :room_number, :room_name, :resident_addres, :pay_date, :payment_method, :first_recordatory, :second_recordatory])
  end


  def getAmountPaidByStudent(matricula) do
    query = from b in UniversityAccomodation.Bill,
            where: b.matricula == ^matricula and not is_nil(b.pay_date),
            group_by: b.matricula,
            select: [sum(b.ammount_to_pay)]

    UniversityAccomodation.Repo.one(query)
  end

  def getStudentsWithOutPayment(date) do
    parsedate = Ecto.Date.cast(date) |> elem(1)
    query = from b in UniversityAccomodation.Bill,
            where: b.first_recordatory <= ^parsedate and is_nil(b.pay_date),
            group_by: b.student_name,
            select: [b.student_name]
    UniversityAccomodation.Repo.all(query)
  end

end
