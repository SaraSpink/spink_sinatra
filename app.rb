require ('sinatra')
require ('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('./lib/define_word')
require ('pry')

get('/') do
  @word_list = Define::Word.all()
  erb(:input)
end

post('/') do
  @input_word = params["my_word"]

  new_word = Define::Word.new({:my_word=> @input_word})
  new_word.save()
stop_and_open_page
  @word_list = Define::Word.sort()
  @word_list = Define::Word.all()
  erb(:input)
end
