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

alias UniversityAccomodation.{Repo, Student,StudentHouse}
UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Student{matricula: "2016601314",name: "Noe",last_name: "Perez",address: "Jose Maria Facha No.2066"})


room = %UniversityAccomodation.Dormitory.StudentHouseDormitory{dormitory_number: "101",hire: 1000}
room2 = %UniversityAccomodation.Dormitory.StudentHouseDormitory{dormitory_number: "102",hire: 1000}
student_house = %UniversityAccomodation.StudentHouse{name: "Black House",address: "Jose Maria Facha No.2066",phone_number: "5519601039",dormitory: [room,room2]};
director= %UniversityAccomodation.Staff.Employee{address: "Jose Maria Facha No.2066",birth_date: ~D[1985-01-01],charge: "Director",gender: "M",last_name: "Suares",location: "Student House",name: "Alejandro",student_house: student_house}
UniversityAccomodation.Repo.insert!(director)

room = %UniversityAccomodation.Dormitory.StudentHouseDormitory{dormitory_number: "101",hire: 1000}
room2 = %UniversityAccomodation.Dormitory.StudentHouseDormitory{dormitory_number: "102",hire: 1000}
student_house = %UniversityAccomodation.StudentHouse{name: "White House",address: "Juan Sarabia No.2066",phone_number: "5519601039",dormitory: [room,room2]};
director = %UniversityAccomodation.Staff.Employee{address: "Juan Sarabia No.2066",birth_date: ~D[1985-01-01],charge: "Director",gender: "M",last_name: "Yedra",location: "Student House",name: "Jose",student_house: student_house}
UniversityAccomodation.Repo.insert!(director)


room_to_assign = Repo.get(UniversityAccomodation.Dormitory.StudentHouseDormitory,1)
student = Repo.get(Student,1)
student_changeset = student|> Repo.preload(:dormitory) |> Ecto.Changeset.change
student_with_room = Ecto.Changeset.put_assoc(student_changeset,:dormitory,room_to_assign)
student = Repo.update!(student_with_room)
