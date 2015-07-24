require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/actstack.db")

class Premise
  include DataMapper::Resource
  has n, :acts

  property :id, Serial
  property :premise, Text, :required => true
  property :vote, Integer, :default => 0
 #need date and time created/modified

end


class Act
  include DataMapper::Resource
  belongs_to :premise
  property :id, Serial
  property :content, Text, :required => true
  property :act_number, Text
  property :vote, Integer, :default => 0

end

DataMapper.finalize.auto_upgrade!
