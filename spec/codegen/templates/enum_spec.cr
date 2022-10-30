require "../../spec_helper"

def render_enum(spec_file, shape_name)
  source = ServiceJson.load(spec_file)

  description = Amazonite::Codegen::Service::Description.new("0.23.2", "2012-08-10", "2", source)

  e = description.resolver.find(shape_name).as(Amazonite::Codegen::Service::Enum)
  shape_binding = Amazonite::Codegen::Bindings::Enum.new(e)

  Amazonite::Codegen::Render.new(description).to_s("enum.cr", {"shape" => shape_binding}).strip
end

def render_dynamodb_enum(shape_name)
  render_enum("dynamodb-2012-08-10.normal.json", shape_name)
end

describe "enum.cr.j2 template" do
  it "handles 'AttributeAction'" do
    actual = render_dynamodb_enum("AttributeAction")

    expected = load_fixture("templates", "enum", "attribute_action.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles 'BatchStatementErrorCodeEnum'" do
    actual = render_dynamodb_enum("BatchStatementErrorCodeEnum")

    expected = load_fixture("templates", "enum", "batch_statement_error_code_enum.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles 'BillingMode'" do
    actual = render_dynamodb_enum("BillingMode")

    expected = load_fixture("templates", "enum", "billing_mode.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles 'ScalarAttributeType'" do
    actual = render_dynamodb_enum("ScalarAttributeType")

    expected = load_fixture("templates", "enum", "scalar_attribute_type.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles 'OrderByElement'" do
    actual = render_enum("discovery-2015-11-01.normal.json", "OrderString")

    expected = load_fixture("templates", "enum", "order_string.expected.cr").strip
    actual.should eq_diff expected
  end
end
