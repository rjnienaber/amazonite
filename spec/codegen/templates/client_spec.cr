require "../../spec_helper"

def render_partial_client(schema_filename : String, has_errors : Bool, *operation_names)
  source = ServiceJson.load(schema_filename)
  description = Amazonite::Codegen::Service::Description.new("0.23.2", "2012-08-10", "2", source)

  operations = operation_names.map { |name| description.find_operation(name) }.to_a
  description.operations = operations
  operations_binding = Amazonite::Codegen::Bindings::Operations.new(description, has_errors)

  Amazonite::Codegen::Render.new(description).to_s("client.cr", {"operations" => operations_binding}).strip
end

def render_dynamodb_client(has_errors : Bool, *operation_names)
  render_partial_client("dynamodb-2012-08-10.normal.json", has_errors, *operation_names)
end

describe "client.cr.j2 template" do
  it "handles 'CreateTable'" do
    actual = render_dynamodb_client(false, "CreateTable")

    expected = load_fixture("templates", "client", "create_table.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles method with no output" do
    actual = render_dynamodb_client(false, "UntagResource")

    expected = load_fixture("templates", "client", "untag_resource.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles multiple methods" do
    actual = render_dynamodb_client(false, "PutItem", "GetItem", "UpdateItem", "DeleteItem")

    expected = load_fixture("templates", "client", "multiple.expected.cr").strip
    actual.should eq_diff expected
  end

  it "adds exception factory if required" do
    actual = render_dynamodb_client(true, "DeleteTable")

    expected = load_fixture("templates", "client", "delete_table.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles method with no input" do
    actual = render_partial_client("discovery-2015-11-01.normal.json", false, "ExportConfigurations")

    expected = load_fixture("templates", "client", "export_configurations.expected.cr").strip
    actual.should eq_diff expected
  end

  it "handles method with no input" do
    actual = render_partial_client("forecast-2018-06-26.normal.json", false, "CreateAutoPredictor")

    expected = load_fixture("templates", "client", "create_auto_predictor.expected.cr").strip
    actual.should eq_diff expected
  end
end
