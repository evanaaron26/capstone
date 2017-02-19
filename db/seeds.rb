
Location.create(latitude: 48.8566, longitude: 2.3522, distance_to: 0.5, name: "Eiffel Tower", user_id: 1)

Location.create(latitude: 41.8885, longitude: -87.6354, distance_to: 0.5, name: "merchandise mart", user_id: 1)


Document.create(file_name: "marchandise mart document", location_id: 2, file_text: "dfksdnfsf nsdfnsdl fsdlkfsdf klsdf")

Document.create(file_name: "eiffel tower document", location_id: 1, file_text: "dfksdnfsf nsdfnsdl fsdlkfsdf klsdf")

UserDocument.create(user_id: 1, document_id: 2)

UserDocument.create(user_id: 2, document_id: 1)



#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
