require "../../spec_helper"

def render_model(shape_name)
  source = ServiceJson.load("dynamodb-2012-08-10.normal.json")

  description = Amazonite::Codegen::Service::Description.new("0.23.2", source)

  structure = description.resolver.find(shape_name).as(Amazonite::Codegen::Service::Structure)
  shape_binding = Amazonite::Codegen::Bindings::Structure.new(structure)
  service_binding = Amazonite::Codegen::Bindings::Service.new(description)

  Amazonite::Codegen::Render.new(service_binding).to_s("model.cr", {"shape" => shape_binding}).strip
end

describe "model.cr.j2 template" do
  it "parses times in 'ArchivalSummary'" do
    actual = render_model("ArchivalSummary")

    expected = load_fixture("templates", "model", "archival_summary.expected.cr").strip
    actual.should eq_diff expected
  end

  it "parses arrays and hashes in 'AttributeValue'" do
    actual = render_model("AttributeValue")

    expected = load_fixture("templates", "model", "attribute_value.expected.cr").strip
    actual.should eq_diff expected
  end

  it "uses data structure and an enum in 'AttributeValueUpdate'" do
    actual = render_model("AttributeValueUpdate")

    expected = load_fixture("templates", "model", "attribute_value_update.expected.cr").strip
    actual.should eq_diff expected
  end

  it "parses int64 in 'AutoScalingSettingsDescription'" do
    actual = render_model("AutoScalingSettingsDescription")

    expected = load_fixture("templates", "model", "auto_scaling_settings_description.expected.cr").strip
    actual.should eq_diff expected
  end

  it "recursively follows data structures until it hits a structure in 'BatchGetItemOutput'" do
    actual = render_model("BatchGetItemOutput")

    expected = load_fixture("templates", "model", "batch_get_item_output.expected.cr").strip
    actual.should eq_diff expected
  end

  it "parses float64 in 'Capacity'" do
    actual = render_model("Capacity")

    expected = load_fixture("templates", "model", "capacity.expected.cr").strip
    actual.should eq_diff expected
  end

  it "parse int32 in 'ScanOutput'" do
    actual = render_model("ScanOutput")

    expected = load_fixture("templates", "model", "scan_output.expected.cr").strip
    actual.should eq_diff expected
  end

  it "orders required parameters first in 'BackupDetails'" do
    actual = render_model("BackupDetails")

    expected = load_fixture("templates", "model", "backup_details.expected.cr").strip
    actual.should eq_diff expected
  end
end
