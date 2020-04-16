require "../lib/00_Dark_Trader.rb"

describe "my_hash_size method" do
	it "shouldn't return 'nil'" do
		expect(my_hash_size).not_to be_nil
	end
end

describe "select_element method" do
	it "should return the value which correspond to the key : not to be empty, not to be empty" do
		expect(select_element(2)).not_to be_empty
		expect(select_element(20)).not_to be_nil
		expect(select_element(140)).not_to be_empty
		expect(select_element(180)).not_to be_nil
	end
end