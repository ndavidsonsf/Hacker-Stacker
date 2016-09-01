# Display a list of all questions
get '/questions' do
	@questions = Question.all
	erb :'/questions/index'
end

# QUESTIONS NEW
get '/questions/new' do
  @question = Question.new
  erb :'questions/new'
end

# QUESTIONS CREATE
post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect '/questions'
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

# QUESTIONS SHOW
get '/questions/:id' do
  p params
  @question = Question.find(params[:id])
  # @answers = Answer.find_by()
  erb :'questions/show'
end

# QUESTIONS EDIT
# get '/questions/:id/edit' do
#   @question = Question.find(params[:id])
#   erb :'questions/edit'
# end


# QUESTIONS UPDATE
# put '/questions/:id' do
#   @question = Question.find(params[:id])
#   @question.update(params[:question])
#   redirect "/questions/#{@question.id}"
# end


# QUESTIONS DESTROY
# delete '/questions/:id' do
#   @question = Question.find(params[:id])
#   @question.destroy
#   redirect "/questions"
# end

