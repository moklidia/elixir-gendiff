defmodule Generator do
	def generate_difference(path_before, path_after) do
		raw_before = File.read!(path_before)
		raw_after = File.read!(path_after)
		parsed_before = Parser.parse(raw_before, Path.extname(path_before))|> elem(1)
		IO.inspect(parsed_before)
		parsed_after = Parser.parse(raw_after, Path.extname(path_after)) |> elem(1)
		keys_before = Map.keys(parsed_before)
		IO.inspect(keys_before)
		keys_after = Map.keys(parsed_after)
		keys = keys_before ++ keys_after |> Enum.uniq()
		diff_list = Enum.map(keys, fn key -> get_diff(key, parsed_before, parsed_after) end)
		diff_to_string = Enum.join(diff_list, "\n")
		diff = "{\n#{diff_to_string}\n}"
		
		IO.inspect(diff)
	end

	def get_diff(key, data1, data2) do
		cond do
			!Map.has_key?(data2, key) -> "  - #{key}: #{data1[key]}"
			!Map.has_key?(data1, key) -> "  + #{key}: #{data2[key]}"
			data1[key] == data2[key] -> "    #{key}: #{data1[key]}"
			data1[key] != data2[key] -> 
				"  + #{key}: #{data2[key]}\n  - #{key}: #{data1[key]}"
		end
	end
end