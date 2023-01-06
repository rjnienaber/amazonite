require "xml"

def render_xml_model(shape_name, spec_filename = "sqs-2012-11-05.normal.json")
  source = ServiceJson.load(spec_filename)

  description = Amazonite::Codegen::Service::Description.new("0.23.2", "2012-08-10", "1", source)

  structure = description.resolver.find(shape_name).as(Amazonite::Codegen::Service::Structure)
  shape_binding = Amazonite::Codegen::Bindings::XmlStructure.new(structure, description.module_alias)

  Amazonite::Codegen::Render.new(description).to_s("xml_model.cr", {"shape" => shape_binding}).strip
end

describe "xml_model.cr.j2 template" do
  describe "renders" do
    it "'CreateQueueResult'" do
      actual = render_xml_model("CreateQueueResult").strip

      expected = load_fixture("templates", "query_model", "create_queue_result.expected.cr").strip
      actual.strip.should eq_diff expected.strip
    end

    it "'BatchResultErrorEntry'" do
      actual = render_xml_model("BatchResultErrorEntry").strip

      expected = load_fixture("templates", "query_model", "batch_result_error_entry.expected.cr").strip
      actual.should eq_diff expected
    end

    it "'SendMessageBatchResult'" do
      actual = render_xml_model("SendMessageBatchResult")

      expected = load_fixture("templates", "query_model", "send_message_batch_result.expected.cr").strip
      actual.should eq_diff expected
    end

    it "'SendMessageBatchResultEntry'" do
      actual = render_xml_model("SendMessageBatchResultEntry")

      expected = load_fixture("templates", "query_model", "send_message_batch_result_entry.expected.cr").strip
      actual.should eq_diff expected
    end

    pending "'DeleteMessageResponse'"

    pending "handles enums"
    pending "handles numbers"
    pending "handles maps"
  end

  pending "builds" # converts a data structure to the required, escaped query string
end
