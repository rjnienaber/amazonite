require "../../spec_helper"

def render_enum(shape_name)
  source = ServiceJson.load("dynamodb-2012-08-10.normal.json")

  description = Amazonite::Codegen::Service::Description.new("0.23.2", "2012-08-10", "v2", source)

  e = description.resolver.find(shape_name).as(Amazonite::Codegen::Service::Enum)
  shape_binding = Amazonite::Codegen::Bindings::Enum.new(e)

  Amazonite::Codegen::Render.new(description).to_s("enum.cr", {"shape" => shape_binding}).strip
end

describe "enum.cr.j2 template" do
  it "handles 'AttributeAction'" do
    # testing enum generation, simplified enum serialization
    actual = render_enum("AttributeAction")

    expected = load_fixture("templates", "enum", "attribute_action.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles 'BatchStatementErrorCodeEnum'" do
    # testing enum generation, simplified enum serialization
    actual = render_enum("BatchStatementErrorCodeEnum")

    expected = load_fixture("templates", "enum", "batch_statement_error_code_enum.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles 'BillingMode'" do
    # testing enum generation, simplified enum serialization
    actual = render_enum("BillingMode")

    expected = load_fixture("templates", "enum", "billing_mode.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles 'ScalarAttributeType'" do
    # testing enum generation, simplified enum serialization
    actual = render_enum("ScalarAttributeType")

    expected = load_fixture("templates", "enum", "scalar_attribute_type.expected.cr").strip
    actual.should eq_diff expected
  end
end
