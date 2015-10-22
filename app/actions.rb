# Homepage (Root path)
get '/' do
  erb :index
end

get '/' do
 erb :index
end

get '/candidates/show' do
 erb :'candidates/show'
 # 
end


get '/candidates' do
 erb :'candidates/index'
end
