# Session NEW
get '/sessions/new' do
  erb :'sessions/new'
end

# Session CREATE
post '/categories/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Sorry, email and/or password do not match our records. "]
    erb :"sessions/new"
  end
end

# Session DELETE/DESTROY
delete '/sessions' do
  session[:id] = nil
  redirect '/'
end
