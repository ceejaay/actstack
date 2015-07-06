require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/actstack.db")

class Premise
  include DataMapper::Resource
  has n, :acts

  property :id, Serial
  property :premise, Text
  property :vote, Text, :default => 0
 #need date and time created/modified

end


class Act
  include DataMapper::Resource
  belongs_to :premise
  property :id, Serial
  property :content, Text
  property :act_number, Text
  
end

DataMapper.finalize.auto_upgrade!
