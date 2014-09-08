require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"
require 'pry'

require_relative 'models/contact'

get '/' do
  if params['query'] != nil
    @contacts = Contact.where("first_name ILIKE ? OR last_name ILIKE ?", params['query'],params['query'])
  else
    @contacts = Contact.all
  end
  erb :index
end

get '/contacts/:id' do
  @contact = Contact.where("id = ?", params[:id])
  erb :show
end
