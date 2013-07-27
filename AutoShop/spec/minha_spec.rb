describe Array do
	it "deveria adicionar um elemento no array" do
		array = []
		array << 1
		expect(array).to have(1).item
	end
end
