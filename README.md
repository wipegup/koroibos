# README

This is a brief code-challenge outlined [here](https://github.com/turingschool/backend-curriculum-site/blob/gh-pages/module4/projects/take_home_challenge/prompts/olympic_spec.md).

The data is taken from [here](https://github.com/turingschool/backend-curriculum-site/blob/gh-pages/module4/projects/take_home_challenge/prompts/olympic_data_2016.csv)

The app is deployed [here](https://koroibos-wp.herokuapp.com/).

Available endpoints are:

## `GET api/v1/olympians`  
Optional Query Parameters: `age=youngest` & `age=oldest`  

### Responses
#### With no query string:
Multiple olympians returned
#### With query string:
Single olympian returned  

Status: 200  
Body:
```
{
  "olympians":
    [
      {
        "name": "Maha Abdalsalam",
        "team": "Egypt",
        "age": 18,
        "sport": "Diving"
        "total_medals_won": 0
      },
      {...},
      {...}
    ]
}
```

#### With invalid query string:  

Status: 404  
Body: `{"message": "Invalid Parameter"}`  


## `GET api/v1/events`  

### Responses  

Status:200  
Body:
```
{
  "events":
    [
      {
        "sport": "Archery",
        "events": [
          "Archery Men's Individual",
          "Archery Men's Team",
          "Archery Women's Individual",
          "Archery Women's Team"
        ]
      },
      {
        "sport": "Badminton",
        "events": [
          "Badminton Men's Doubles",
          "Badminton Men's Singles",
          "Badminton Women's Doubles",
          "Badminton Women's Singles",
          "Badminton Mixed Doubles"
        ]
      },
      {...}
    ]
}
```

## `GET api/v1/events/:event_id/medalists`  

### Responses  
#### With valid event_id  

Status: 200  
Body:
```
{
  "event": "Badminton Mixed Doubles",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "team": "Indonesia-1",
        "age": 29,
        "medal": "Gold"
      },
      {
        "name": "Chan Peng Soon",
        "team": "Malaysia",
        "age": 28,
        "medal": "Silver"
      }
    ]
}
```
(Note, many medalists are missing, this is an incomplete data set)

#### With invalid event_id  

Status: 404  
Body: `{"message": "Invalid Parameter"}`
