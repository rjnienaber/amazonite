require "../../spec_helper"

def render_partial_client(schema_filename : String, *operation_names)
  source = ServiceJson.load(schema_filename)
  description = Amazonite::Codegen::Service::Description.new("0.23.2", source)

  metadata = description.metadata
  operations = operation_names.map {|n| description.find_operation(n) }.to_a
  operations_binding = Amazonite::Codegen::Bindings::Operations.new(metadata, operations)
  service_binding = Amazonite::Codegen::Bindings::Service.new(description)

  Amazonite::Codegen::Render.new(service_binding).to_s("client.cr", {"operations" => operations_binding}).strip
end

def render_dynamodb_client(*operation_names)
  render_partial_client("dynamodb-2012-08-10.normal.json", *operation_names)
end

describe "client.cr.j2 template" do
  it "handles 'CreateTable'" do
    actual = render_dynamodb_client("CreateTable")

    expected = load_fixture("templates", "client", "create_table.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles method with no output" do
    actual = render_dynamodb_client("UntagResource")

    expected = load_fixture("templates", "client", "untag_resource.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles multiple methods" do
    actual = render_dynamodb_client("PutItem", "GetItem", "UpdateItem", "DeleteItem")

    expected = load_fixture("templates", "client", "multiple.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles method with no input" do
    actual = render_partial_client("opsworks-2013-02-18.normal.json", "DescribeOperatingSystems")

    expected = load_fixture("templates", "client", "describe_operating_systems.expected.cr").strip
    actual.should eq_diff expected
  end
end
