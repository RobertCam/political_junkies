#just to test for getting data on the 'candidates/show erb'
# REPUBLICAN CANDIDATES
PILOSI = 'N00007360'
BUSH = 'N00037006'
CARSON = 'N00036973'
CHRISTIE = 'N00037008'
CRUZ = 'N00033085'
FIORINA = 'N00031348'
GILMORE = 'N00028961'
GRAHAM = 'N00009975'
HUCKABEE = 'N00007539'
JINDAL = 'N00026786'
KASICH = 'N00009778'
PATAKI = 'N00028981'
PAUL = 'N00030836'
RUBIO = 'N00030612'
SANTORUM = 'N00001380'
TRUMP = 'N00023864'

#DEMOCRATIC CANDIDATES
BIDEN = 'N00001669'
CHAFEE = 'N00009954'
CLINTON = 'N00000019'
LESSIG = 'N00029841'
OMALLEY = 'N00037007'
SANDERS = 'N00000528'

#INDEPENDANT CANDIDATES
STEIN = 'N00033776'
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
end

#landing page (aka home page)
get '/' do
  erb :index
end

#shows a specific candidate
get '/candidates/show/:id' do

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

  @received_don_total = @cand_con_extract[2] + @cand_ind_extract[2] + @cand_sec_extract[2]
  erb :'candidates/show'
end

#shows all the candidates
get '/candidates' do
  erb :'candidates/index'
end

get '/candidates/compare' do
  
  erb :'candidates/compare'
end
