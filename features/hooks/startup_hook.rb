Before '@startup' do

    @nname = Faker::Company.name
    @city= Faker::Address.city

    @body = {
        "nome": @name,
        "cidade": @city
    }

    @startup = Startup.new(@body)
    
end