defmodule Generator do
	def generate_difference(path_before, path_after) do
		raw_before = File.read!(path_before)
		raw_after = File.read!(path_after)
		parsed_before = Parser.parse(raw_before, Path.extname(path_before))|> elem(1)
		IO.inspect(parsed_before)
		parsed_after = Parser.parse(raw_after, Path.extname(path_after)) |> elem(1)
		ast = Ast.gen_ast(parsed_before, parsed_after)
		IO.inspect(ast)	
	end

	
end