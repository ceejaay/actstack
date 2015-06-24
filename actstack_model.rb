require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/actstack.db")

class Premise
  include DataMapper::Resource
  property :id, Serial
  property :premise, Text

end

DataMapper.finalize.auto_upgrade!
