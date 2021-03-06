require ('sinatra')
require ('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('./lib/word')
require ('pry')

  get('/') do
    @list = Word.all()
    erb(:input)
  end

  post('/') do
    @word_app = params["term"]
    new_word = Word.new({:term=> @word_app, :definitions=> @definition_app})
    new_word.save
    redirect "/words/#{new_word.id}"
  end

  get('/words/:id') do
    @word = Word.find(params[:id])
    erb(:definition)

  end

  post('/words/:id/definitions') do
    word = Word.find(params[:id])
    definitions = params["definition"]
    word.add_definitions(definitions)
    redirect "/words/#{word.id}"
  end

  # get('/yourword/:id') do
  #   @contact_id = Word.find(params[:id])
  #   @list = Word.all()
  #   erb(:yourword)
  # end
  #
  # post('/yourword/:id') do
  #   @word_app = params["word"]
  #   @definition_app = params["definition"]
  #   @list_app = Word.all()
  #   word_info = Word.new({:word=> @word_app, :definition=> @definition_app})
  #
  #   word_info.save
  #   @list = Word.all()
  #   erb(:yourword)
  # end
