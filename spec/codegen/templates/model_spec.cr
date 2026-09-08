require "../../spec_helper"

def render_model(shape_name, spec_filename = "dynamodb-2012-08-10.normal.json")
  source = ServiceJson.load(spec_filename)

  description = Amazonite::Codegen::Service::Description.new("0.23.2", "2012-08-10", source)

  structure = description.resolver.find(shape_name).as(Amazonite::Codegen::Service::Structure)
  shape_binding = Amazonite::Codegen::Bindings::Structure.new(structure, description.module_alias, false)

  Amazonite::Codegen::Render.new(description).to_s("model.cr", {"shape" => shape_binding}).strip
end

# S3 is the only restXml service generated, and the protocol renders a
# different template branch (plain properties plus build_xml/from_xml rather
# than JSON::Serializable), so its shapes need their own flags.
def render_rest_xml_model(shape_name)
  source = ServiceJson.load("s3-2006-03-01.normal.json")

  description = Amazonite::Codegen::Service::Description.new("0.23.2", "2006-03-01", source)

  structure = description.resolver.find(shape_name).as(Amazonite::Codegen::Service::Structure)
  shape_binding = Amazonite::Codegen::Bindings::Structure.new(structure, description.module_alias, true, false, true)

  Amazonite::Codegen::Render.new(description).to_s("model.cr", {"shape" => shape_binding}).strip
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

  it "parses float in 'DocumentLabel'" do
    actual = render_model("DocumentLabel", "comprehend-2017-11-27.normal.json")

    expected = load_fixture("templates", "model", "document_label.expected.cr").strip
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

  it "formats initialize correctly when no parameters" do
    actual = render_model("DescribeLimitsInput")
    expected = load_fixture("templates", "model", "describe_limits_input.expected.cr").strip
    actual.should eq_diff expected
  end

  it "deal with 'TagKeys'" do
    actual = render_model("UntagResourceInput", "backup-gateway-2021-01-01.normal.json")
    expected = load_fixture("templates", "model", "untag_resource_input.expected.cr").strip
    actual.should eq_diff expected
  end

  it "deal with 'AgentConfigurationStatus'" do
    actual = render_model("AgentConfigurationStatus", "discovery-2015-11-01.normal.json")
    expected = load_fixture("templates", "model", "agent_configuration_status.expected.cr").strip
    actual.should eq_diff expected
  end

  it "generates #validate! for length/pattern-constrained scalars and recurses into nested structures/lists in 'RestoreTableFromBackupInput'" do
    actual = render_model("RestoreTableFromBackupInput")

    expected = load_fixture("templates", "model", "restore_table_from_backup_input.expected.cr").strip
    actual.should eq_diff expected
  end

  it "wraps a list in its own element in restXml's 'Tagging'" do
    actual = render_rest_xml_model("Tagging")

    expected = load_fixture("templates", "model", "tagging.expected.cr").strip
    actual.should eq_diff expected
  end

  it "repeats a flattened list's items without a wrapper in restXml's 'Delete'" do
    actual = render_rest_xml_model("Delete")

    expected = load_fixture("templates", "model", "delete.expected.cr").strip
    actual.should eq_diff expected
  end

  it "reads and writes scalars and times in restXml's 'ObjectIdentifier'" do
    actual = render_rest_xml_model("ObjectIdentifier")

    expected = load_fixture("templates", "model", "object_identifier.expected.cr").strip
    actual.should eq_diff expected
  end

  it "leaves a header-bound member out of the body in restXml's 'GetObjectTaggingOutput'" do
    actual = render_rest_xml_model("GetObjectTaggingOutput")

    expected = load_fixture("templates", "model", "get_object_tagging_output.expected.cr").strip
    actual.should eq_diff expected
  end
end
