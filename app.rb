require ('sinatra')
require ('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('./lib/define_word')
require ('pry')

get('/') do
  @word_list = Word.all()
  erb(:input)
end

post('/') do
  input_word = params["my_word"]

  word_list = {"my_word"=> my_word}

  new_word = Word.new(word_list)
  new_word.save()
  @word_list = Word.sort()
  erb(:input)
end
