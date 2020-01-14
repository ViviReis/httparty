Dado("the API address to maintain the Startup registry") do
  #already instantiated by the class Startup
end

Given("make a request to register a startup") do
  $response = @startup.postStartup
end

Then("the API will return the data of the registry of Startup answering the code {int}") do |int|
  #expect do status code e message
  expect($response.code).to eq(int)
  puts "Response code: #{$response.code}"
  expect($response.message).to eq("Created")
  puts "Response Message: #{$response.message}"
  
  #prints the requisition attributes
  puts "ID    : #{$response["id"]}"
  puts "Data  : #{$response["data"]}"
  puts "Nome  : #{$response["nome"]}"
  puts "Conta : #{$response["conta"]}"
  puts "Cidade: #{$response["cidade"]}"

  $id = $response["id"]
  
end

Given("make a request by passing the startup ID") do
  $get = @startup.getStartup($id)
end

Then("the API will return the corresponding Startup data by replying to the code {int}") do |int|
  expect($get.code).to eq(int)
  expect($get.message).to eq("OK")
  expect($get["id"]).to eq($response["id"])

  puts "ID    : #{$get["id"]}"
  puts "Data  : #{$get["data"]}"
  puts "Nome  : #{$get["nome"]}"
  puts "Conta : #{$get["conta"]}"
  puts "Cidade: #{$get["cidade"]}"
  puts "Status Code: #{$get.code}"
  
end

Given("make a request to change a startup") do
  $put = @startup.putStartup($id)
end

Then("the API will return the changed Startup data by replying to the code {int}") do |int|
  expect($put.code).to eq(int)
  expect($put.message).to eq("OK")
  expect($put["id"]).to eq($response["id"])

  puts "ID    : #{$put["id"]}"
  puts "Data  : #{$put["data"]}"
  puts "Nome  : #{$put["nome"]}"
  puts "Conta : #{$put["conta"]}"
  puts "Cidade: #{$put["cidade"]}"
  puts "Status Code: #{$put.code}"
end

Given("make a request to delete a startup") do
$delete = @startup.deleteStartup($put["id"])
end

Then("the API should return the exclusion data by replying to the code {int}") do |int|
  expect($delete.code).to eq(int)
  expect($delete.message).to eq("OK")


  puts "ID    : #{$delete["id"]}"
  puts "Data  : #{$delete["data"]}"
  puts "Nome  : #{$delete["nome"]}"
  puts "Conta : #{$delete["conta"]}"
  puts "Cidade: #{$delete["cidade"]}"
  puts "Status Code: #{$delete.code}"
end