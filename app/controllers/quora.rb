before '/quora' do
  if session[:email]
    redirect to '/quora/quora_temp'
  else
    redirect to '/logout'
  end

end


get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

get '/quora/question_temp' do

  @question_val = Question.all.order(:id)
  erb :questions

end


get '/quora/quora_temp' do

  
  erb :quora_index

end



get '/quora/temp_new_question' do

  erb :new_question

end

get '/quora/question/answer' do

  erb :new_answer

end




get '/quora/question/:question_id' do

  session[:question_id] = params[:question_id]
  @question = Question.find(session[:question_id])
  @answers = @question.answers

  erb :question_answer

end


get '/quora/question/me_disgusta/:question_id' do

  question_id = params[:question_id]
  @question = Question.find(question_id)
  @question.update(vote_dislike: (@question.vote_dislike + 1))
  @question_val = Question.all.order(:id)

  erb :questions

end


get '/quora/question/me_gusta/:question_id' do

  question_id = params[:question_id]
  @question = Question.find(question_id)
  @question.update(vote_like: (@question.vote_like + 1))
  @question_val = Question.all.order(:id)

  erb :questions

end


get '/quora/answer/me_disgusta/:answer_id' do

  answer_id = params[:answer_id]
  @answer = Answer.find(answer_id)
  @answer.update(vote_dislike: (@answer.vote_dislike + 1))
  @answer_val = Answer.all.order(:id)

  
  @question = Question.find(session[:question_id])
  @answers = @question.answers

  erb :question_answer

end


get '/quora/answer/me_gusta/:answer_id' do

  answer_id = params[:answer_id]
  @answer = Answer.find(answer_id)
  @answer.update(vote_like: (@answer.vote_like + 1))
  @answer_val = Answer.all.order(:id)


  @question = Question.find(session[:question_id])
  @answers = @question.answers

  erb :question_answer

end


post '/quora/new_question' do

  question_val = params[:question_val]
  new_question = Question.create(question: question_val, vote_like: 0, vote_dislike: 0)
  @question_val = Question.all
  erb :questions

end

post '/quora/new_question' do

  question_val = params[:question_val]
  new_question = Question.create(question: question_val, vote_like: 0, vote_dislike: 0)
  @question_val = Question.all
  erb :questions

end


post '/quora/new_answer' do

  question_id = session[:question_id]
  answer_val = params[:answer_val]
  question = Question.find(session[:question_id])
  answer = Answer.create(answer: answer_val,  vote_like: 0, vote_dislike: 0)
  question.answers << answer
  redirect to "/quora/question/#{question_id}"

end





get '/salir' do

  erb :index

end