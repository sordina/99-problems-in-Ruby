require 'rubygems'
require 'rspec'
require './99_problems'

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :should }
end

describe "P01-P05" do
  before(:each) do
    @list = %w{a b c d e f g h i j k l}
  end

  it "P01 should find the last element of a list" do
    solution_01(@list).should == "l"
  end

  it "P02 should find the last but one element of a list" do
    solution_02(@list).should == "k"
  end

  it "P03 should find the kth element of a list" do
    solution_03(@list).should == "c"
  end

  it "P04 should find the number of elements of a list" do
    solution_04(@list).should == 12
  end

  it "P05 should reverse a list" do
    solution_05(@list).should == %w{l k j i h g f e d c b a}
  end
end

describe "P06" do
  it "P06 should return true if the list is a palindrome" do
    list = %w{a b c d e d c b a}
    solution_06(list).should == true
  end

  it "P06 should return false if the list is not a palindrome" do
    list = %w{a b c d e f g h i j k l}
    solution_06(list).should == false
  end
end

describe "P07" do
  it "P07 should flatten a nested list structure" do
    list = [1,2,[3,[4,[5]]],6,[7,8],9]
    solution_07(list).should == [1,2,3,4,5,6,7,8,9]
  end
end

describe "P08-P17" do
  before(:each) do
    @list = %w{a a a b b b b c a a}
  end

  it "P08 should eliminate consecutive duplicates of list elements" do
    solution_08(@list).should == %w{a b c a}
  end

  it "P09 should pack consecutive duplicates of list elements into sublists" do
    solution_09(@list).should == [%w{a a a}, %w{b b b b}, %w{c}, %w{a a}]
  end

  it "P10 should be able to run-length encode a list" do
    solution_10(@list).should == [[3, "a"], [4, "b"], [1, "c"], [2, "a"]]
  end

  it "P11 should be able to modified run-length encode a list" do
    solution_11(@list).should == [[3, "a"], [4, "b"], "c", [2, "a"]]
  end

  it "P12 should be able to decode a modified run-length encoded list" do
    modified_run_length_encoded_list = solution_11(@list)
    solution_12(modified_run_length_encoded_list).should == @list
  end

  it "P13 should be able to run-length encode a list directly" do
    solution_13(@list).should == [[3, "a"], [4, "b"], "c", [2, "a"]]
  end

  it "P14 should duplicate the elements of a list" do
    solution_14(@list).should == %w{a a a a a a b b b b b b b b c c a a a a}
  end

  it "P15 should duplicate the elements n times" do
    solution_15(@list,3).should == %w{a a a a a a a a a b b b b b b b b b b b b c c c a a a a a a}
  end

  it "P16 should drop every nth element of a list" do
    solution_16(@list,3).should == %w{a a b b b c a}
    solution_16(@list,2).should == %w{a a b b a}
    solution_16(@list,1).should == %w{}
  end

  it "P17 should split a list into two parts; the length of the first part is given." do
    x, y = solution_17(@list,4)
    x.should == %w{a a a b}
    y.should == %w{b b b c a a}
  end
end
