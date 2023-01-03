require "../../spec_helper"

def render_json_model(shape_name, spec_filename = "dynamodb-2012-08-10.normal.json")
  source = ServiceJson.load(spec_filename)

  description = Amazonite::Codegen::Service::Description.new("0.23.2", "2012-08-10", "2", source)

  structure = description.resolver.find(shape_name).as(Amazonite::Codegen::Service::Structure)
  shape_binding = Amazonite::Codegen::Bindings::Structure.new(structure, description.module_alias)

  Amazonite::Codegen::Render.new(description).to_s("json_model.cr", {"shape" => shape_binding}).strip
end

describe "json_model.cr.j2 template" do
  it "parses times in 'ArchivalSummary'" do
    actual = render_json_model("ArchivalSummary")

    expected = load_fixture("templates", "json_model", "archival_summary.expected.cr").strip
    actual.should eq_diff expected
  end

  it "parses arrays and hashes in 'AttributeValue'" do
    actual = render_json_model("AttributeValue")

    expected = load_fixture("templates", "json_model", "attribute_value.expected.cr").strip
    actual.should eq_diff expected
  end

  it "uses data structure and an enum in 'AttributeValueUpdate'" do
    actual = render_json_model("AttributeValueUpdate")

    expected = load_fixture("templates", "json_model", "attribute_value_update.expected.cr").strip
    actual.should eq_diff expected
  end

  it "parses int64 in 'AutoScalingSettingsDescription'" do
    actual = render_json_model("AutoScalingSettingsDescription")

    expected = load_fixture("templates", "json_model", "auto_scaling_settings_description.expected.cr").strip
    actual.should eq_diff expected
  end

  it "recursively follows data structures until it hits a structure in 'BatchGetItemOutput'" do
    actual = render_json_model("BatchGetItemOutput")

    expected = load_fixture("templates", "json_model", "batch_get_item_output.expected.cr").strip
    actual.should eq_diff expected
  end

  it "parses float in 'DocumentLabel'" do
    actual = render_json_model("DocumentLabel", "comprehend-2017-11-27.normal.json")

    expected = load_fixture("templates", "json_model", "document_label.expected.cr").strip
    actual.should eq_diff expected
  end

  it "parses float64 in 'Capacity'" do
    actual = render_json_model("Capacity")

    expected = load_fixture("templates", "json_model", "capacity.expected.cr").strip
    actual.should eq_diff expected
  end

  it "parse int32 in 'ScanOutput'" do
    actual = render_json_model("ScanOutput")

    expected = load_fixture("templates", "json_model", "scan_output.expected.cr").strip
    actual.should eq_diff expected
  end

  it "orders required parameters first in 'BackupDetails'" do
    actual = render_json_model("BackupDetails")

    expected = load_fixture("templates", "json_model", "backup_details.expected.cr").strip
    actual.should eq_diff expected
  end

  it "formats initialize correctly when no parameters" do
    actual = render_json_model("DescribeLimitsInput")
    expected = load_fixture("templates", "json_model", "describe_limits_input.expected.cr").strip
    actual.should eq_diff expected
  end

  it "deal with 'TagKeys'" do
    actual = render_json_model("UntagResourceInput", "backup-gateway-2021-01-01.normal.json")
    expected = load_fixture("templates", "json_model", "untag_resource_input.expected.cr").strip
    actual.should eq_diff expected
  end

  it "deal with 'AgentConfigurationStatus'" do
    actual = render_json_model("AgentConfigurationStatus", "discovery-2015-11-01.normal.json")
    expected = load_fixture("templates", "json_model", "agent_configuration_status.expected.cr").strip
    actual.should eq_diff expected
  end
end
