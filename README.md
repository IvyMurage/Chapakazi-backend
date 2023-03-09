# CHAPAKAZI API

Chapakazi is a web based application designed to match homeowners with trustworthy handymen in their area at competitive prices. The Chapakazi API is a tool that offers details about available handymen, including their areas of expertise, customer ratings, and the types of jobs they perform. Users who register with the app can post jobs and access information on local handymen through the API.

</br> 

## Models indentifes and relationship 

A model is a representation of a specific object, for instance in my application I have a customer, handyman, messages, reviews and jobs. 

The relationship shows how the different models in my application are associated and how they are related.

</br>

* ```A customer has many jobs ```
* ``` A handyman has many jobs through job_handymen ```
* ``` A job has many handymen through job_handymen ```
* ``` A job_handymen belongs to a handyman ```
* ``` A job_handymen belongs toa job ```
* ``` A job belongs to a customer ```
* ``` A job belongs to a handyman ```
* ``` A customer has many reviews ```
* ``` A handyman has many reviews ```
* ``` A review belongs to customer ```
* ``` A review belongs to a handyman ```
* ``` A handyman has many messages ```
* ``` A customer has many messages ```
* ``` A message belongs to a customer ```
* ``` A message belongs to a handyman ```
## Image representation of the models and relationships
![Untitled](https://user-images.githubusercontent.com/108492757/224022525-11764b10-488b-42e6-9e45-8b49f8658753.png)


### Authorization Error
This error is rendered when a user tries to make a request to a protected route  yet they have not sign in to use the application
```
{
    "errors": [
        "Please log in!"
    ]
}
```

### When a user logins 
```
{
    "handyman": {
        "id": 4,
        "username": "Ian Kimondo",
        "location": "Ruiru,Kiambu",
        "image": "https://img.freepik.com/free-photo/carpenter-cutting-plank-by-circular-saw_329181-3731.jpg?w=740&t=st=1672677374~exp=1672677974~hmac=792260726039772412f447b7f9d73b6f04d0160fa9ae7f3fdbdb260b03dcc60621d6e2",
        "description": "Architecto officia est. Eos ut illo. Ex natus ducimus. Minus eos quia. Quia doloremque eos. Non fugiat et. Et architecto similique. Dicta enim ratione. Et et aut. Tenetur possimus odio. Omnis voluptatem dignissimos. Odit nesciunt qui. Accusamus aut amet. Nam .",
        "rating": "$12-$30",
        "speciality": "Capentry",
        "job_handymen": [],
        "jobs": [],
        "messages": [
            {
                "id": 1,
                "handyman_id": 4,
                "customer_id": 5,
                "message": "Vi."
            },
            {
                "id": 7,
                "handyman_id": 4,
                "customer_id": 4,
                "message": "De."
            }
        ]
    },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJoYW5keW1hbl9pZCI6NH0.Ls7PHlfMlJynVeN3r4I0CYaWATAvdEM_RDU2gw8hAFQ"
}
```
