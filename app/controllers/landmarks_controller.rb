class LandmarksController < ApplicationController
  
  get '/landmarks' do 
    erb :'/landmarks/index'
  end
  
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end
  
  get "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end
  
  get '/landmarks/:id/edit' do
   @landmark = Landmark.find_by_id(params[:id])
   erb :'/landmarks/edit'
  end
  
   post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
  end
  
  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect "/landmarks/#{@landmark.id}"
  end
  
end
