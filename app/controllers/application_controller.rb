require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(name: params["name"], content: params["content"])
    erb :show
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id/edit' do
    @post = Post.find(params["id"])
    erb :edit
  end

  get '/posts/:id' do
    @post = Post.find(params["id"])
    erb :show
  end

  patch '/posts/:id' do
    @post = Post.update(id = params["id"], name: params["name"], content: params["content"])
    erb :show
  end

  delete '/posts/:id/delete' do
    post = Post.find(params['id'])
    @name = post.name
    Post.delete(params['id'])
    erb :deleted
  end

end
