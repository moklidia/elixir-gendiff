defmodule Parser do
	def parse(data, extension) when extension == ".json" do
		JSON.decode(data)
	end

	def parse(data, extension) when extension == ".yaml" or extension == ".yml" do
		YamlElixir.read_from_string(data)
	end
	
end