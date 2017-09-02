Book.destroy_all

Book.create! [
	{name: "Eloquent Ruby",author: "Russ Olsen"},
	{name: "Beginning Ruby",author: "Peter Cooper"},
	{name: "Metaprograming Ruby 2",author: "Paolo Perrotta"},
	{name: "Design Patterns in Ruby",author: "Russ Olsen"},
	{name: "The Ruby",author: "David Flanagan"}
]

eloquent = Book.find_by name: "Eloquent Ruby"
eloquent.notes.create! [
	{title: "Wow", note: "Great book to learn ruby."},
	{title: "Funny", note: "Doesnt put you to sleep."}
]

reviewers = Reviewer.create! [
	{name:"Hemang",password:"abc123"},
	{name:"Mike",password:"123abc"}
]

Book.all.each do |book|
	book.reviewer = reviewers.sample
	book.save!
end