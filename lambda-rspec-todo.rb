require_relative "./lambda"

describe "Todo  sample" do 
	it "testing todo sample" do
		# maximize the browser window
		@driver.manage.window.maximize
        puts "Loading URL"
        @driver.navigate.to("https://4dvanceboy.github.io/lambdatest/todo.html")

        puts "Clicking Checkbox"
        @driver.find_element(:name, "todo-4").click
        puts "Clicking Checkbox"
	    @driver.find_element(:name, "todo-5").click

        elems = @driver.find_elements(:class, "done-true")
        expect(elems.length).to eq(2)
        
        puts "Entering Text"
        @driver.find_element(:id, "todotext").send_keys("Get Taste of Lambda and Stick to It")
        @driver.find_element(:id, "addbutton").click

        spanText = @driver.find_element(:xpath, "/html/body/div/div/div/ul/li[6]/span").text
        expect(spanText).to eql("Get Taste of Lambda and Stick to It")


	end
end
