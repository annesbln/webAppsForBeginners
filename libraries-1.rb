require "json"

data = '{
  "emails": [
    {
      "subject": "Hi there, Ruby Monstas!",
      "date": "2015-01-02",
      "from": "Ferdous"
    },
    {
      "subject": "Keep on coding!",
      "date": "2015-01-03",
      "from": "Dajana"
    }
  ]
}'
data = JSON.parse(data)

# Show the keys of the data array.
p data.keys

# Show the first subject.
p data["emails"].first["subject"]

# Show the whole data set in the array.
p data["emails"]