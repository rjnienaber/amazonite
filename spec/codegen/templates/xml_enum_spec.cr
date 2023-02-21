require "../../spec_helper"

def render_xml_enum(spec_file, shape_name)
  source = ServiceJson.load(spec_file)

  description = Amazonite::Codegen::Service::Description.new("0.23.2", "2012-08-10", "1", source)

  e = description.resolver.find(shape_name).as(Amazonite::Codegen::Service::Enum)
  shape_binding = Amazonite::Codegen::Bindings::Enum.new(e, description.metadata.protocol)

  Amazonite::Codegen::Render.new(description).to_s("xml_enum.cr", {"shape" => shape_binding}).strip
end

describe "xml_enum.cr.j2 template" do
  it "handles 'MessageSystemAttributeName'" do
    actual = render_xml_enum("sqs-2012-11-05.normal.json", "MessageSystemAttributeName")

    expected = load_fixture("templates", "enum", "message_system_attribute_name.expected.cr").strip
    actual.should eq_diff expected
  end

  pending "'MessageAttributeValue'"
end
