require "../spec_helper"

private alias AAG = Amazonite::ApiGatewayV1
private alias AC = Amazonite::Core

describe "ApiGatewayV1: basic REST API operations" do
  api_name = "amazonite-integration-test-api"
  client = AAG::Client.new
  api_id = ""

  it "removes existing APIs with the same name" do
    response = client.get_rest_apis(AAG::GetRestApisRequest.new)
    existing = (response.result.items || [] of AAG::RestApi).select { |api| api.name == api_name }
    existing.each do |api|
      id = api.id
      client.delete_rest_api(AAG::DeleteRestApiRequest.new(id)) if id
    end
  end

  it "creates a REST API" do
    response = client.create_rest_api(AAG::CreateRestApiRequest.new(api_name))
    response.http.status_code.should eq(201)

    api_id = response.result.id || raise "expected an id in the response"
    api_id.should_not be_empty
    response.result.name.should eq(api_name)
  end

  it "gets the REST API" do
    response = client.get_rest_api(AAG::GetRestApiRequest.new(api_id))
    response.http.status_code.should eq(200)

    response.result.name.should eq(api_name)
  end

  it "lists REST APIs" do
    response = client.get_rest_apis(AAG::GetRestApisRequest.new)
    response.http.status_code.should eq(200)

    ids = (response.result.items || [] of AAG::RestApi).map(&.id)
    ids.should contain(api_id)
  end

  it "tags the REST API" do
    resource_arn = "arn:aws:apigateway:us-west-2::/restapis/#{api_id}"
    tag_response = client.tag_resource(AAG::TagResourceRequest.new(resource_arn, {"Environment" => "test"}))
    tag_response.http.status_code.should eq(204)

    get_response = client.get_tags(AAG::GetTagsRequest.new(resource_arn))
    get_response.http.status_code.should eq(200)
    (get_response.result.tags || {} of String => String).should eq({"Environment" => "test"})

    untag_response = client.untag_resource(AAG::UntagResourceRequest.new(resource_arn, ["Environment"]))
    untag_response.http.status_code.should eq(204)

    get_response = client.get_tags(AAG::GetTagsRequest.new(resource_arn))
    (get_response.result.tags || {} of String => String).should be_empty
  end

  it "deletes the REST API" do
    response = client.delete_rest_api(AAG::DeleteRestApiRequest.new(api_id))
    response.http.status_code.should eq(202)
  end

  it "throws a typed error" do
    e = expect_raises(AAG::NotFoundException) do
      client.get_rest_api(AAG::GetRestApiRequest.new(api_id))
    end
    e.http.should_not be_nil
  end
end
