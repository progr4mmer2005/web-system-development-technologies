person1 = { first: "Michael", last: "Hartl" }
person2 = { first: "Jane", last: "Hartl" }
person3 = { first: "Sam", last: "Hartl" }

params = { father: person1, mother: person2, child: person3 }

p params
p params[:father]
p params[:mother]
p params[:child]
p params[:father][:first]
p params[:mother][:first]
p params[:child][:first]
p params[:father] == person1
p params[:mother] == person2
p params[:child] == person3
p params[:father][:first] == "Michael"
p params[:mother][:first] == "Jane"
p params[:child][:first] == "Sam"
