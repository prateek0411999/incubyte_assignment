require_relative "./string_convertor.rb"

RSpec.describe "StringConvertor" do 
    describe ".convert" do 
        context "convert class_method is present" do 
            it "should respond_to 'convert' method" do 
                expect(StringConvertor).to respond_to(:convert)
            end 
        end 
    end 
end 