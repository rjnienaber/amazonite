require "compress/zip"
require "../spec_helper"

private alias Lambda = Amazonite::Lambda
private alias AC = Amazonite::Core

private def wait_until_active(client, function_name, attempts = 60)
  attempts.times do
    response = client.get_function_configuration(Lambda::GetFunctionConfigurationRequest.new(function_name))
    return if response.result.state == Lambda::State::Active

    sleep 2.seconds
  end

  raise "timed out waiting for '#{function_name}' to become active"
end

describe "Lambda: basic function operations" do
  function_name = "integration-test-function"
  client = Lambda::Client.new
  function_arn = ""

  it "removes an existing function" do
    client.delete_function(Lambda::DeleteFunctionRequest.new(function_name))
  rescue AC::ResponseException
  end

  it "creates a function" do
    zip_io = IO::Memory.new
    Compress::Zip::Writer.open(zip_io) do |zip|
      zip.add("index.py", "def handler(event, context):\n    return {\"message\": \"hello from amazonite\"}\n")
    end
    code = Lambda::FunctionCode.new(zip_file: zip_io.to_slice)

    request = Lambda::CreateFunctionRequest.new(
      function_name,
      "arn:aws:iam::000000000000:role/lambda-role",
      code,
      runtime: Lambda::Runtime::Python312,
      handler: "index.handler",
    )
    response = client.create_function(request)
    response.http.status_code.should eq(201)

    function_arn = response.result.function_arn || raise "expected a function arn in the response"
    function_arn.should_not be_empty

    # LocalStack pulls the runtime's Docker image on first use, which can
    # take well over the shared wait_until's 10s budget - poll longer here.
    wait_until_active(client, function_name)
  end

  it "gets the function" do
    response = client.get_function(Lambda::GetFunctionRequest.new(function_name))
    response.http.status_code.should eq(200)

    response.result.configuration.try(&.function_name).should eq(function_name)
  end

  it "tags the function" do
    tag_response = client.tag_resource(Lambda::TagResourceRequest.new(function_arn, {"Environment" => "test"}))
    tag_response.http.status_code.should eq(204)

    list_response = client.list_tags(Lambda::ListTagsRequest.new(function_arn))
    list_response.http.status_code.should eq(200)
    list_response.result.tags.should eq({"Environment" => "test"})

    untag_response = client.untag_resource(Lambda::UntagResourceRequest.new(function_arn, ["Environment"]))
    untag_response.http.status_code.should eq(204)

    list_response = client.list_tags(Lambda::ListTagsRequest.new(function_arn))
    list_response.http.status_code.should eq(200)
    (list_response.result.tags || {} of String => String).should be_empty
  end

  it "invokes the function" do
    request = Lambda::InvocationRequest.new(function_name, payload: "{}")
    response = client.invoke(request)
    response.http.status_code.should eq(200)

    response.result.status_code.should eq(200)
    response.result.function_error.should be_nil
    payload = response.result.payload || raise "expected a payload in the response"
    payload.should contain("hello from amazonite")
  end

  it "lists functions" do
    response = client.list_functions(Lambda::ListFunctionsRequest.new)
    response.http.status_code.should eq(200)

    names = (response.result.functions || [] of Lambda::FunctionConfiguration).map(&.function_name)
    names.should contain(function_name)
  end

  it "deletes the function" do
    response = client.delete_function(Lambda::DeleteFunctionRequest.new(function_name))
    response.http.status_code.should eq(204)
  end

  it "throws a typed error" do
    e = expect_raises(Lambda::ResourceNotFoundException) do
      client.get_function(Lambda::GetFunctionRequest.new(function_name))
    end
    e.http.should_not be_nil
  end
end
