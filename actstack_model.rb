require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/actstack.db")

class Premise
  include DataMapper::Resource
  property :id, Serial
  property :premise, Text
  #need date and time created/modified

end

DataMapper.finalize.auto_upgrade!
