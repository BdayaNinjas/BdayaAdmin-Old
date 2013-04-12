class Fc
  include Mongoid::Document
  include Mongoid::Timestamps
  field :cashIn, type: Integer
  field :cashIn_source, type: String
  field :cashOut, type: Integer
  field :cashOut_source, type: String
  field :bankIn, type: Integer
  field :bankIn_source, type: String
  field :bankOut, type: Integer
  field :bankOut_source, type: String
  field :netCash, type: String
  field :netBank, type: String
  field :netFunds, type: String
  field :comments, type: String

  def self.get_all
    return Fc.all.to_a
  end

  def self.add(ci, cis, co, cos, bi, bis, bo, bos, nc, nf, nb, c)
    x = Fc.new(:cashIn => ci, :cashIn_source => cis, :cashOut => co, :cashOut_source => cos, 
                            :bankIn => bi, :bankIn_source => bis, :bankOut => bo, :bankOut_source => bos,
                            :netCash => nc, :netFunds => nf, :netBank => nb ,:comments => c)
    x.save
  end

end
