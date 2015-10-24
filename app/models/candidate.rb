class Candidate
  attr_reader :name, :id, :picture
  def initialize(name, id, picture)
    @name = name
    @id = id
    @picture = picture
  end
end