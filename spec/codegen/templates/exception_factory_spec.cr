require "../../spec_helper"

def render_factory(*error_names)
  source = ServiceJson.load("dynamodb-2012-08-10.normal.json")
  description = Amazonite::Codegen::Service::Description.new("0.23.2", "2012-08-10", "v2", source)

  names = error_names.to_a
  errors = description.error_names.select { |e| names.includes?(e) }
  errors_binding = Amazonite::Codegen::Bindings::Errors.new(errors)

  Amazonite::Codegen::Render.new(description).to_s("exception_factory.cr", {"errors" => errors_binding}).strip
end

describe "exception_factory.cr.j2 template" do
  it "handles method with no input" do
    actual = render_factory("ResourceInUseException", "LimitExceededException", "InternalServerError")

    expected = load_fixture("templates", "exception_factory", "dynamodb_exception_factory.expected.cr").strip
    actual.should eq_diff expected
  end
end
