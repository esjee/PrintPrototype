require "spec_helper"
require_relative "kerk_class"

RSpec.describe Printprototype do
  it "it works for foo1" do
    argument_error = get_error_when_executing { Kerk.new.foo1 }

    expect(argument_error.to_s).to include("Method prototype:\n\tdef foo1(a)\n")
  end

  it "it works for foo2" do
    argument_error = get_error_when_executing { Kerk.new.foo2 }

    expect(argument_error.to_s).to include("Method prototype:\n\tdef foo2(a, b:, c:)\n")
  end

  xit "it works for foo3" do
    argument_error = get_error_when_executing { Kerk.new.foo3 }

    expect(argument_error.to_s).to include("Method prototype:\n\tdef foo3(a)\n")
  end

  xit "it works for foo4" do
    argument_error = get_error_when_executing { Kerk.new.foo4 }

    expect(argument_error.to_s).to include("Method prototype:\n\tdef foo4(a, b: 3, c:, d:)\n")
  end

  it "it works for foo5" do
    argument_error = get_error_when_executing { Kerk.new.foo5 }

    expect(argument_error.to_s).to include("Method prototype:\n\tdef foo5 a, b\n")
  end

end
