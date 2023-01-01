require "../spec_helper"

private alias SSM = Amazonite::SsmV1
private alias AC = Amazonite::Core

describe "SsmV1: basic crud operations" do
  now = Time.utc.to_rfc3339
  path = "/integration_test"
  param_name = "#{path}/param1"
  client = SSM::Client.new

  it "lists parameters and removes existing" do
    parameter_response = client.get_parameters_by_path(SSM::GetParametersByPathRequest.new(path))
    parameter_response.http.status_code.should eq(200)

    params = parameter_response.result.parameters
    next if params.nil? || params.try { |v| v.size == 0 }

    names = params.try(&.compact_map(&.name))

    input = SSM::DeleteParametersRequest.new(names)
    delete_response = client.delete_parameters(input)
    delete_response.http.status_code.should eq(200)

    delete_response.result.deleted_parameters.should eq(names)
    delete_response.result.invalid_parameters.should eq([] of String)
  end

  it "creates a parameter" do
    param = SSM::PutParameterRequest.new(param_name, now, type: SSM::ParameterType::String)
    response = client.put_parameter(param)
    response.http.status_code.should eq(200)

    response.result.version.should eq(1)
    response.result.tier.should eq(aws_value(SSM::ParameterTier::Standard))
  end

  it "gets a parameter" do
    param = SSM::GetParameterRequest.new(param_name)
    response = client.get_parameter(param)
    response.http.status_code.should eq(200)

    response.result.parameter.try &.name.should eq(param_name)
    response.result.parameter.try &.value.should eq(now)
  end

  it "updates a parameter" do
    tomorrow = (Time.utc + 1.day).to_rfc3339

    param = SSM::PutParameterRequest.new(param_name, tomorrow, overwrite: true, type: SSM::ParameterType::String)
    response = client.put_parameter(param)
    response.http.status_code.should eq(200)

    response.result.version.should eq(2)
    response.result.tier.should eq(aws_value(SSM::ParameterTier::Standard))
  end

  it "deletes the parameter" do
    input = SSM::DeleteParameterRequest.new(param_name)
    delete_response = client.delete_parameter(input)

    delete_response.http.status_code.should eq(200)
    delete_response.result.should_not be_nil
  end

  it "throws a typed error" do
    input = SSM::DeleteParameterRequest.new(param_name)

    e = expect_raises(SSM::ParameterNotFound, localstack_value("#{param_name} not found")) do
      client.delete_parameter(input)
    end
    e.http.should_not be_nil
  end
end
