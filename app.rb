require ('sinatra')
require ('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('./lib/define_word')
require ('pry')

  get('/') do
    @list = Contact.all()
    erb(:input)
  end

  get('/contacts/:id') do
    @list = Contact.all()
    @contact_id = Contact.find(params[:id])
    @list = Contact.all()
    erb(:definition)
  end

  post('/') do
    @first_name_app = params["first_name"]
    @last_name_app = params["last_name"]
    @address_app = params["address"]
    @city_app = params["city"]
    @state_app = params["state"]
    @zip_app = params["zip"]
    @list_app = Contact.all()
    contact_info = Contact.new({:first_name=> @first_name_app, :last_name=> @last_name_app, :address=> @address_app, :city=> @city_app, :state=> @state_app, :zip=> @zip_app})

    contact_info.save
    @list = Contact.all()
    erb(:input)
  end
