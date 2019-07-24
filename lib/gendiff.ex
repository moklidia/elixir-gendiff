defmodule Gendiff do
  @moduledoc """
  Documentation for Gendiff.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Gendiff.hello()
      :world

  """
  def main(args) do
    {opts,_,_}= OptionParser.parse(args, 
      switches: [before: :string, after: :string], 
      aliases: [b: :before, a: :after]
      )
    Generator.generate_difference(opts[:before], opts[:after])
  end
end
