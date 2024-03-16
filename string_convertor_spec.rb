require_relative "./string_convertor.rb"

RSpec.describe "StringConvertor" do 
    describe ".convert" do 
        context "convert class_method is present" do 
            it "should respond_to 'convert' method" do 
                expect(StringConvertor).to respond_to(:convert)
            end 
        end 
        context "when input is an empty string" do
            it "should return 0" do
              expect(StringConvertor.convert("")).to eq(0)
            end
        end
        context "when input is a single number" do
            it "should return the number" do
              expect(StringConvertor.convert("1")).to eq(1)
            end
        end
    end
end