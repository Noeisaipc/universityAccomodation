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

user = UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Student{matricula: "2016601314",name: "Noe",last_name: "Perez",address: "Jose Maria Facha No.2066",phone_number: "5519601039",category: "primer año"})
UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Family{name: "Raymundo",last_name: "Perez",address: "Jose Maria Facha No.2066",phone_number: "5519601039",relationship: "Padre",student: user})
UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Student{matricula: "2016601714",name: "Edgar",last_name: "Osorio",address: "Jose Maria Facha No.2066",phone_number: "5519602339",category: "primer año"})
UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Student{matricula: "2016601614",name: "Mei",last_name: "Garcia",address: "Jose Maria Facha No.2066",phone_number: "5519601539",category: "segundo año"})
UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Student{matricula: "2016601514",name: "Edson",last_name: "Bernal",address: "Jose Maria Facha No.2066",phone_number: "5519605439",category: "posgrado"})



room = %UniversityAccomodation.Dormitory.StudentHouseDormitory{dormitory_number: "101",hire: 1000}
room2 = %UniversityAccomodation.Dormitory.StudentHouseDormitory{dormitory_number: "102",hire: 1000}
room3 = %UniversityAccomodation.Dormitory.StudentHouseDormitory{dormitory_number: "103",hire: 2000}
room4 = %UniversityAccomodation.Dormitory.StudentHouseDormitory{dormitory_number: "104",hire: 900}
student_house = %UniversityAccomodation.StudentHouse{name: "Black House",address: "Jose Maria Facha No.2066",phone_number: "5519601039",dormitory: [room,room2,room3,room4]};
director= %UniversityAccomodation.Staff.Employee{address: "Jose Maria Facha No.2066",birth_date: ~D[1985-01-01],charge: "Director",gender: "M",last_name: "Suares",location: "Student House",name: "Alejandro",student_house: student_house,phone_number: "5519605439"}
UniversityAccomodation.Repo.insert!(director)

room = %UniversityAccomodation.Dormitory.StudentHouseDormitory{dormitory_number: "101",hire: 1000}
room2 = %UniversityAccomodation.Dormitory.StudentHouseDormitory{dormitory_number: "102",hire: 1000}
room3 = %UniversityAccomodation.Dormitory.StudentHouseDormitory{dormitory_number: "103",hire: 2000}
room4 = %UniversityAccomodation.Dormitory.StudentHouseDormitory{dormitory_number: "104",hire: 900}
student_house = %UniversityAccomodation.StudentHouse{name: "White House",address: "Juan Sarabia No.2066",phone_number: "5519601039",dormitory: [room,room2,room3,room4]};
director = %UniversityAccomodation.Staff.Employee{address: "Juan Sarabia No.2066",birth_date: ~D[1985-01-01],charge: "Director",gender: "M",last_name: "Yedra",location: "Student House",name: "Jose",student_house: student_house,phone_number: "5519605439"}
UniversityAccomodation.Repo.insert!(director)

room = %UniversityAccomodation.Dormitory.FlatDormitory{dormitory_number: "A1",hire: 1000}
room2 = %UniversityAccomodation.Dormitory.FlatDormitory{dormitory_number: "A2",hire: 1000}
room3 = %UniversityAccomodation.Dormitory.FlatDormitory{dormitory_number: "A3",hire: 2000}
room4 = %UniversityAccomodation.Dormitory.FlatDormitory{dormitory_number: "A4",hire: 900}
flat = %UniversityAccomodation.Apartment.Flat{address: "Culiacan No 201",dormitory: [room,room2,room3,room4]}
UniversityAccomodation.Repo.insert!(flat)

limpieza = %UniversityAccomodation.Staff.Employee{address: "Juan Sarabia No.2066",birth_date: ~D[1985-01-01],charge: "Limpieza",gender: "M",last_name: "Garcia",location: "Aseo",name: "Silvino",phone_number: "5519605439"};
UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Staff.Inspection{comment: "Mesa de estar en mal estado",inspection_date:  ~D[2018-01-15],flat: flat,employee: limpieza})


room = %UniversityAccomodation.Dormitory.FlatDormitory{dormitory_number: "B1",hire: 1200}
room2 = %UniversityAccomodation.Dormitory.FlatDormitory{dormitory_number: "B2",hire: 1000}
flat = %UniversityAccomodation.Apartment.Flat{address: "Liborio Crespo No. 1943",dormitory: [room,room2]}
UniversityAccomodation.Repo.insert!(flat)


limpieza = %UniversityAccomodation.Staff.Employee{address: "Juan Sarabia No.2066",birth_date: ~D[1985-01-01],charge: "Limpieza",gender: "M",last_name: "Manriquez",location: "Aseo",name: "Manuel",phone_number: "5519605439"};
UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Staff.Inspection{comment: "Mesa de estar en mal estado",inspection_date:  ~D[2018-01-15],flat: flat,employee: limpieza})


room_to_assign = Repo.get(UniversityAccomodation.Dormitory.StudentHouseDormitory,1)
student = Repo.get(Student,1)
student_changeset = student|> Repo.preload(:dormitory) |> Ecto.Changeset.change
student_with_room = Ecto.Changeset.put_assoc(student_changeset,:dormitory,room_to_assign)
student = Repo.update!(student_with_room)
agreement =  %UniversityAccomodation.Agreement.StudentAgreement{booking_time: 3,date_to_arrival: ~D[2018-01-01],date_to_leave: ~D[2018-12-10],student: student,dormitory: room_to_assign}
UniversityAccomodation.Repo.insert!(agreement)

UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Bill{ammount_to_pay: 1000,first_recordatory: ~D[2018-01-10],matricula: "2016601314",num_agreement: 1,pay_date: ~D[2018-01-15],payment_method: "Credit Card",resident_addres: "Juan Sarabia No.2066",room_name: "101",room_number: 1,semestre: 1,student_name: "Noe Perez"})
UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Bill{ammount_to_pay: 1000,first_recordatory: ~D[2018-05-10],matricula: "2016601314",num_agreement: 1,pay_date: ~D[2018-05-30],payment_method: "Credit Card",resident_addres: "Juan Sarabia No.2066",room_name: "101",room_number: 1,semestre: 2,student_name: "Noe Perez"})


room_to_assign = Repo.get(UniversityAccomodation.Dormitory.FlatDormitory,1)
student = Repo.get(Student,2)
student_changeset = student|> Repo.preload(:flat_dormitory) |> Ecto.Changeset.change
student_with_room = Ecto.Changeset.put_assoc(student_changeset,:flat_dormitory,room_to_assign)
student = Repo.update!(student_with_room)
agreement =  %UniversityAccomodation.Agreement.FlatAgreement{booking_time: 3,date_to_arrival: ~D[2018-01-01],date_to_leave: ~D[2018-12-10],student: student,dormitory: room_to_assign}
UniversityAccomodation.Repo.insert!(agreement)


UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Bill{ammount_to_pay: 1000,first_recordatory: ~D[2018-01-10],matricula: "2016601714",num_agreement: 1,pay_date: ~D[2018-01-20],payment_method: "Credit Card",resident_addres: "Culiacan No 201",room_name: "A1",room_number: 1,semestre: 1,student_name: "Edgar Osorio"})
UniversityAccomodation.Repo.insert!(%UniversityAccomodation.Bill{ammount_to_pay: 1000,first_recordatory: ~D[2018-05-10],second_recordatory: ~D[2018-05-20],matricula: "2016601714",num_agreement: 1,resident_addres: "Culiacan No 201",room_name: "A1",room_number: 1,semestre: 2,student_name: "Edgar Osorio"})
