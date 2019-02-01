@startup
Feature: Keep Startup data through the API
As a system user
I want to perform the requests in the API
In order to manipulate the information of the startup registry

Scenario: Register a Startup
    Given the API address to maintain the Startup registry
    When make a request to register a startup
    Then the API will return the data of the registry of Startup answering the code 201

Scenario: Consult a Startup
    Given the API address to maintain the Startup registry
    When make a request by passing the startup ID
    Then the API will return the corresponding Startup data by replying to the code 200

Scenario: Change a Startup
    Given the API address to maintain the Startup registry
    When make a request to change a startup
    Then the API will return the changed Startup data by replying to the code 200

Scenario: Delete a Startup
    Given the API address to maintain the Startup registry
    When make a request to delete a startup
    Then the API should return the exclusion data by replying to the code 200