require ('sinatra')
require ('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('./lib/define_word')
require ('pry')

get('/') do
  @word_list = Define::Word.all()
  erb(:input)
end
