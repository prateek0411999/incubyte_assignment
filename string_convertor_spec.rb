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
        context "when input is two numbers separated by a comma" do
            it "should return the sum of the numbers" do
              expect(StringConvertor.convert("1,5")).to eq(6)
            end
        end
        context "when input contains new lines between numbers" do
            it "should return the sum of the numbers" do
              expect(StringConvertor.convert("1\n2,3")).to eq(6)
            end
            it "should return the sum of the numbers" do
                expect(StringConvertor.convert("\n4\n5,6")).to eq(15)
            end
            it "should return the sum of the numbers" do
                expect(StringConvertor.convert("7\n8\n9")).to eq(24)
            end
            it "should return the sum of the numbers" do
                expect(StringConvertor.convert("7,8\n9,10")).to eq(34)
            end
        end
        context "when input contains a different delimiter" do
            it "should return the sum of the numbers" do
              expect(StringConvertor.convert("//;\n1;2")).to eq(3)
            end
            it "should return the sum of the numbers" do
                expect(StringConvertor.convert("//;\n1;;;;;;2")).to eq(3)
            end
            it "should return the sum of the numbers" do
                expect(StringConvertor.convert("//,\n1,2,,,,,5,,,")).to eq(8)
            end
            it "should return the sum of the numbers" do
                expect(StringConvertor.convert("//!\n1!10!!")).to eq(11)
            end
        end
        context "when input contains negative numbers" do
            it "raises an error with the negative numbers listed" do
              expect { StringConvertor.convert("1,-2,3,-4") }.to raise_error("negative numbers not allowed -2,-4")
            end
            it "raises an error with the negative numbers listed" do
                expect { StringConvertor.convert("-11,-2,-3,-4") }.to raise_error("negative numbers not allowed -11,-2,-3,-4")
            end
            it "raises an error with the negative numbers listed" do
                expect { StringConvertor.convert("-11,-2,3,4") }.to raise_error("negative numbers not allowed -11,-2")
            end
        end
       
    end
end