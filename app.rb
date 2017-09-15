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
  @my_word_app = params["my_word"]
  @word_list = Define::Word.all()
  my_word - Define::Word.new({:my_word=> @my_word_app})
  contact_info.save
  @word_list = Define::Word.all()
  erb(:input)
end

get('/define/:id') do
  @word_list = Define::Word.all()
  @my_word_id = Define::Word.find(params[:id])
  @word_list = Define::Word.all()
  erb(:definition)
end
