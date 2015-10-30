class Candidate
  attr_reader :name, :id, :picture, :picture2
  def initialize(name, id, picture, picture2)
    @name = name
    @id = id
    @picture = picture
    @picture2 = picture2
  end
end