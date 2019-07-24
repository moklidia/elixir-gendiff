defmodule GeneratorTest do
  use ExUnit.Case
  doctest Generator

  test "plain json" do
  	path_before = Path.join(File.cwd!(), "test/fixtures/before.json")
  	path_after = Path.join(File.cwd!(), "test/fixtures/after.json") 
  	result = Path.join(File.cwd!(),"test/fixtures/expected/flatPrettyJson") |> File.read!
    assert Generator.generate_difference(path_before, path_after) == result
  end

  test "plain yaml" do
  	path_before = Path.join(File.cwd!(), "test/fixtures/before.yaml")
  	path_after = Path.join(File.cwd!(), "test/fixtures/after.yaml") 
  	result = Path.join(File.cwd!(),"test/fixtures/expected/flatPrettyYaml") |> File.read!
    assert Generator.generate_difference(path_before, path_after) == result
  end

  test "nested json" do
    path_before = Path.join(File.cwd!(), "test/fixtures/beforeNested.json")
    path_after = Path.join(File.cwd!(), "test/fixtures/afterNested.json") 
    result = Path.join(File.cwd!(),"test/fixtures/expected/nestedPrettyJson") |> File.read!
    assert Generator.generate_difference(path_before, path_after) == result
  end
end
