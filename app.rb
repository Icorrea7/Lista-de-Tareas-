require "sinatra"
require "make_todo"
get '/' do
  @tareas = Tarea.all
  erb :index
end

get '/completadas'do
  @tareas = Tarea.all
  erb :completadas
end

get '/nueva' do
  erb :new
end

post '/nueva' do
  @tarea = Tarea.create(params[:titulo])
  redirect '/'
end

post '/done' do
  Tarea.update(params[:id])
    redirect '/'
end

post '/destroy' do
  @tarea =Tarea.find(params[:id])
  if @tarea["done"]==false
    Tarea.destroy(params[:id])
    redirect '/'
  else
    Tarea.destroy(params[:id])
    redirect '/completadas'
  end
end
