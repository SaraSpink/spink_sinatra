require ('sinatra')
require ('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('./lib/define_word')
require ('pry')

  get('/') do
    @list = Word.all()
    erb(:input)
  end

  get('/define/:id') do
  
    @contact_id = Word.find(params[:id])
    @list = Word.all()
    erb(:definition)
  end

  post('/') do
    @word_app = params["word"]
    @definition_app = params["definition"]
    @list_app = Word.all()
    contact_info = Word.new({:word=> @word_app, :definition=> @definition_app})

    contact_info.save
    @list = Word.all()
    erb(:input)
  end
