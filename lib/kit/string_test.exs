defmodule Kit.StringTest do
  use ExUnit.Case
  doctest Kit.String

  describe "dedent" do
    test "works with single line strings" do
      assert Kit.String.dedent("  hello") == "hello"
    end

    test "works with multi line strings" do
      assert Kit.String.dedent("  first\n second") == " first\nsecond"
      assert Kit.String.dedent("  first\n   second\n third") == " first\n  second\nthird"
    end
  end
end
