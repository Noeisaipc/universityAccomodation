# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     UniversityAccomodation.Repo.insert!(%UniversityAccomodation.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Student{matricula: "2016601314",name: "Noe",last_name: "Perez",adress: "Jose Maria Facha No.2066"})
UniversityAccomodation.Repo.insert!(%UniversityAccomodation.StudentHouse{name: "Black House",adress: "Jose Maria Facha No.2066",phone_number: "5519601039"})
UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Dormitory{dormitory_number: "101",hire: 1000})
UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Dormitory{dormitory_number: "102",hire: 1200})


room_to_assign = Repo.get(Dormitory,1)
student = Repo.get(Student,1)
student_changeset = student|> Repo.preload(:dormitory) |> Ecto.Changeset.change
student_with_room = Ecto.Changeset.put_assoc(student_changeset,:dormitory,room_to_assign)
student = Repo.update!(student_with_room)
