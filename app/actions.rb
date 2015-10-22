#just to test for getting data on the 'candidates/show erb'
CID = 'N00023864'

helpers do

  def extract_amounts(cand_type)
    total = 0
    sum_pac = 0
    sum_indiv = 0
    
    cand_type.each do |org|
      total += org["total"].to_i
      sum_pac += org["pacs"].to_i 
      sum_indiv += org["indivs"].to_i
    end
    [sum_pac, sum_indiv, total]
end

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
  @cand_con_extract = extract_amounts(@cand_con["contributor"])

  cand_ind = candidate.industries({:cid => CID})["response"]
  @cand_ind = cand_ind["industries"]
  @cand_ind_extract = extract_amounts(@cand_ind["industry"])

  cand_sec = candidate.sector({:cid => CID})["response"]
  @cand_sec = cand_sec["sectors"]
  @cand_sec_extract = extract_amounts(@cand_sec["sector"])

  @received_don_total = @cand_con_extract[2] + @cand_ind_extract[2] + @cand_sec_extract[2]
  erb :'candidates/show'

end

#shows all the candidates
get '/candidates' do
  erb :'candidates/index'
end


end
