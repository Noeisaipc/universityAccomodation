defmodule UniversityAccomodation.Repo.Migrations.CreateBills do
  use Ecto.Migration

  def change do
    create table(:bills) do
      add :matricula, :string
      add :student_name, :string
      add :num_agreement, :integer
      add :semestre, :integer
      add :ammount_to_pay, :integer
      add :room_number, :integer
      add :room_name, :string
      add :resident_addres, :string
      add :pay_date, :date
      add :payment_method, :string
      add :first_recordatory, :date
      add :second_recordatory, :date

    end

  end
end
