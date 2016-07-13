

question1 = Question.create(question: "¿Cual es el trabajo mejor pagado?",  vote_like: 2, vote_dislike: 0)
answer1 = Answer.create(answer: "El de programador web",  vote_like: 3, vote_dislike: 1)
answer2 = Answer.create(answer: "Depende el puesto que tengas!!",  vote_like: 3, vote_dislike: 5)
question1.answers << answer1
question1.answers << answer2

question2 = Question.create(question: "¿Que tipo de lenguajes de programacion conoces?",  vote_like: 0, vote_dislike: 0)
answer1 = Answer.create(answer: "C, C++, Java",  vote_like: 3, vote_dislike: 4)
answer2 = Answer.create(answer: "Phyton, Ruby, JavaScript",  vote_like: 1, vote_dislike: 0)
question2.answers << answer1
question2.answers << answer2







