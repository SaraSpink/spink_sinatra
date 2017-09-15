require ('sinatra')
require ('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('./lib/define_word')
require ('pry')

  get('/') do
    @list = Word.all()
    erb(:input)
  end

  post('/') do
    @word_app = params["word"]
    @list_app = Word.all()
    word_info = Word.new({:word=> @word_app, :definition=> @definition_app})

    word_info.save
    @list = Word.all()
    erb(:input)
  end

  get('/define/:id') do
    @contact_id = Word.find(params[:id])
    @list = Word.all()
    erb(:definition)
  end

  post('/define/:id') do
    @word_app = params["word"]
    @definition_app = params["definition"]
    save_and_open_page
    @list_app = Word.all()
    word_info = Word.new({:word=> @word_app, :definition=> @definition_app})

    word_info.save
    @list = Word.all()
    erb(:definition)
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
