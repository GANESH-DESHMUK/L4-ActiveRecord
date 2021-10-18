require 'active_record'

def connect_db!
  ActiveRecord::Base.establish_connection(
    host: 'fanny.db.elephantsql.com', 
    adapter: 'postgresql',
    database: 'otytzrmz', 
    user: 'otytzrmz', 
    password: 'hq5iSLwMM5671KUrrGu-eLsxwIeZkgMU'
  )
end