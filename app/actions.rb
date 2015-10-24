#just to test for getting data on the 'candidates/show erb'
# REPUBLICAN CANDIDATES
PILOSI = 'N00007360'
CRUZ = 'N00033085'
GRAHAM = 'N00009975'
PAUL = 'N00030836'
RUBIO = 'N00030612'

#DEMOCRATIC CANDIDATES
CLINTON = 'N00000019'
SANDERS = 'N00000528'
# ----------------------------------------

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
  
  # turns integer into a decimal and adds Million string
  def to_million(num)
    "$#{(num.to_f / 1000000).round(2)} Million"
  end

  # takes "last_name, first_name" format and outputs first name only
  def first_name(full_name)
    full_name.partition(', ').last
  end

  # takes integer and transforms it into a number with commas ex: 10000 => "10,000"
  def fancy_number(num)
    "$" + num.to_s.reverse.scan(/\d{3}|.+/).join(",").reverse
  end

end

image = {
  "N00007360" => "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTXNDBSoEiJ-RicDoZPa0l5qMjRcrEt5JcwC20Pe3Yi3sOFeoYXoQ",
  "N00000528" => "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTJfUjJClB4eQHoy0kTZmIVj5qPYjbA3pSIDQ3fNs8K2GIfitUGIw",
  "N00000019" => "data:image/jpeg;base64,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", 
  "N00009975" => "data:image/jpeg;base64,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",
  "N00033085" => "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQJoMXxhqFD1QjSSGCxnzvP9YIXEVXAIxv0yh6pIoJWOXVwT-zD", 
  "N00030612" => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5drphTeVglLF2qcFfl9vUiebsJ5qST36x_r3tpUfCAzuDYnmk",
  "N00030836" => "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQRZMebXmqySiT94ZRC37VVpVbtLUrgJG5UikHzfeMPF-e3thqttg"
    }

#landing page (aka home page)
get '/' do
  erb :index
end

#shows a specific candidate
get '/candidates/show/:id' do
  image.each do |can, img|
    if can == params[:id].to_s 
      @cand_img = img
    end 
  end 

  candidate = OpenSecrets::Candidate.new
  cand_sum = candidate.summary({:cid => params[:id]})["response"]
  @cand_sum = cand_sum["summary"]

  cand_con = candidate.contributors({:cid => params[:id]})["response"]
  @cand_con = cand_con["contributors"]
  @cand_con_extract = extract_amounts(@cand_con["contributor"])

  cand_ind = candidate.industries({:cid => params[:id]})["response"]
  @cand_ind = cand_ind["industries"]
  @cand_ind_extract = extract_amounts(@cand_ind["industry"])

  cand_sec = candidate.sector({:cid => params[:id]})["response"]
  @cand_sec = cand_sec["sectors"]
  @cand_sec_extract = extract_amounts(@cand_sec["sector"])

  erb :'candidates/show'
end

#shows all the candidates
get '/candidates' do
  erb :'candidates/index'
end

get '/candidates/compare_candidates' do
  erb :'candidates/compare_candidates'
end

post '/candidates/compare' do
# Candidate one
  candidate = OpenSecrets::Candidate.new
  cand_sum = candidate.summary({:cid => params[:cand1]})["response"]
  @cand_sum = cand_sum["summary"]

  cand_con = candidate.contributors({:cid => params[:cand1]})["response"]
  @cand_con = cand_con["contributors"]
  @cand_con_extract = extract_amounts(@cand_con["contributor"])

  cand_ind = candidate.industries({:cid => params[:cand1]})["response"]
  @cand_ind = cand_ind["industries"]
  @cand_ind_extract = extract_amounts(@cand_ind["industry"])

  cand_sec = candidate.sector({:cid => params[:cand1]})["response"]
  @cand_sec = cand_sec["sectors"]
  @cand_sec_extract = extract_amounts(@cand_sec["sector"])

  image.each do |can, img|
    if can == params[:cand1].to_s 
      # fix the logic above to do comparison by the candidate ID rather than name
      @cand1_img = img
    end
  end
  
# Candidate two 
  cand2_sum = candidate.summary({:cid => params[:cand2]})["response"]
  @cand2_sum = cand2_sum["summary"]

  cand2_con = candidate.contributors({:cid => params[:cand2]})["response"]
  @cand2_con = cand2_con["contributors"]
  @cand2_con_extract = extract_amounts(@cand2_con["contributor"])

  cand2_ind = candidate.industries({:cid => params[:cand2]})["response"]
  @cand2_ind = cand2_ind["industries"]
  @cand2_ind_extract = extract_amounts(@cand2_ind["industry"])

  cand2_sec = candidate.sector({:cid => params[:cand2]})["response"]
  @cand2_sec = cand2_sec["sectors"]
  @cand2_sec_extract = extract_amounts(@cand2_sec["sector"])

  image.each do |can, img|
    if can == params[:cand2].to_s 
      # fix the logic above to do comparison by the candidate ID rather than name
      @cand2_img = img
    end
  end
  erb :'candidates/compare'

end