require "xml"
require "../../fixtures/templates/query_model/create_queue_result.expected.cr"

def render_query_model(shape_name, spec_filename = "sqs-2012-11-05.normal.json")
  source = ServiceJson.load(spec_filename)

  description = Amazonite::Codegen::Service::Description.new("0.23.2", "2012-08-10", "1", source)

  structure = description.resolver.find(shape_name).as(Amazonite::Codegen::Service::Structure)
  shape_binding = Amazonite::Codegen::Bindings::Structure.new(structure, description.module_alias)

  Amazonite::Codegen::Render.new(description).to_s("query_model.cr", {"shape" => shape_binding}).strip
end

describe "query_model.cr.j2 template" do
  describe "renders" do
    it "'CreateQueueResult'" do
      actual = render_query_model("CreateQueueResult")

      expected = load_fixture("templates", "query_model", "create_queue_result.expected.cr").strip
      actual.should eq_diff expected
    end

    pending "'SendMessageBatchResult'"
    pending "'DeleteMessageResponse'"
  end

  describe "parses" do
    it "'CreateQueueResult'" do
      create_xml = %(<?xml version="1.0"?>
<CreateQueueResponse xmlns="http://queue.amazonaws.com/doc/2012-11-05/">
  <CreateQueueResult>
    <QueueUrl>https://sqs.eu-west-2.amazonaws.com/integration_test</QueueUrl>
  </CreateQueueResult>
  <ResponseMetadata>
    <RequestId>b82f139e-2c11-587b-816c-4fb231f16634</RequestId>
  </ResponseMetadata>
</CreateQueueResponse>)

      options = XML::ParserOptions.default | XML::ParserOptions::NOBLANKS
      doc = XML.parse(create_xml, options)
      result = Amazonite::SqsV1::CreateQueueResult.new(doc.children[0].children[0])

      result.queue_url.should eq("https://sqs.eu-west-2.amazonaws.com/integration_test")
    end

    pending "'SendMessageBatchResult'"
    pending "'DeleteMessageResponse'"
  end

  pending "builds" # converts a data structure to the required, escaped query string
end