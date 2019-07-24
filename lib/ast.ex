defmodule Ast do
	def gen_ast(data_before, data_after) do
		keys = Map.keys(data_before) ++ Map.keys(data_after) |> Enum.uniq()
		Enum.reduce(keys, [], fn (key, acc) -> [get_types(key, data_before, data_after) |acc] end) |> Enum.reverse()
	end

	def get_types(key, data1, data2) do
		cond do
			!Map.has_key?(data2, key) -> %{:type => "deleted", :name => key, :value => data1[key]}
			!Map.has_key?(data1, key) -> %{:type => "added", :name => key, :value => data2[key]}
			is_map(data1[key]) and is_map(data2[key]) -> %{:type => "parent", :name => key, :children => gen_ast(data1[key], data2[key])}
			data1[key] == data2[key] -> %{:type => "unchanged", :name => key, :value => data1[key]}
			data1[key] != data2[key] -> %{:type => "changed", :name => key, :old_value => data1[key], :new_value => data2[key]}
		end
	end
end