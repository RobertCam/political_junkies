#just to test for getting data on the 'candidates/show erb'
CID = 'N00023864'

#landing page (aka home page)
get '/' do
  erb :index
end

#shows a specific candidate
get '/candidates/show' do

  candidate = OpenSecrets::Candidate.new
  cand_sum = candidate.summary({:cid => CID})["response"]
  @cand_sum = cand_sum["summary"]

  cand_con = candidate.contributors({:cid => CID})["response"]
  @cand_con = cand_con["contributors"]

  cand_ind = candidate.industries({:cid => CID})["response"]
  @cand_ind = cand_ind["industries"]

  cand_sec = candidate.sector({:cid => CID})["response"]
  @cand_sec = cand_sec["sectors"]

  erb :'candidates/show'
end

#shows all the candidates
get '/candidates' do
  erb :'candidates/index'
end
