require "../spec_helper"

private alias AC = Amazonite::Core

class ResourceNotFoundException < AC::ResponseException
end

class ErrorCode < AC::ResponseException
end

class CustomResponseExceptionFactory < AC::ResponseExceptionFactory
  def create(exception_type, http, message, code) : AC::ResponseException | Nil
    case exception_type
    when "ResourceNotFoundException" then ResourceNotFoundException.new(http, message, code)
    when "ErrorCode"                 then ErrorCode.new(http, message, code)
    end
  end
end

def generate_exception(body)
  response = HTTP::Client::Response.new(400, body)
  [CustomResponseExceptionFactory.new.build(response), response]
end

describe "Amazonite::Core::ResponseExceptionFactory" do
  it "parses type for known exceptions" do
    exception, response = generate_exception(%({"__type":"com.amazonaws.dynamodb.v20120810#ResourceNotFoundException","message":"Requested resource not found: Table: Music not found"}))

    exception.should be_a(ResourceNotFoundException)
    exception = exception.as(ResourceNotFoundException)
    exception.http.should eq(response)
    exception.message.should eq("Requested resource not found: Table: Music not found")
    exception.code.should be_nil
  end

  it "parses type for 'ValidationException'" do
    exception, response = generate_exception(%({"__type":"com.amazon.coral.validate#ValidationException","message":"One or more parameter values were invalid: Only DELETE action is allowed when no attribute value is specified"}))

    exception.should be_a(AC::ValidationException)
    exception = exception.as(AC::ValidationException)
    exception.http.should eq(response)
    exception.message.should eq("One or more parameter values were invalid: Only DELETE action is allowed when no attribute value is specified")
    exception.code.should be_nil
  end

  it "removes prefixes from the error code" do
    exception, response = generate_exception(%({"__type":"com.amazon.coral.service#ErrorCode" }))

    exception.should be_a(ErrorCode)
    exception = exception.as(ErrorCode)
    exception.http.should eq(response)
    exception.message.should be_nil
    exception.code.should be_nil
  end

  it "returns null for the message when not present" do
    exception, response = generate_exception(%({"__type":"ErrorCode" }))

    exception.should be_a(ErrorCode)
    exception = exception.as(ErrorCode)
    exception.http.should eq(response)
    exception.message.should be_nil
    exception.code.should be_nil
  end

  it "returns the full code when a # is not present using the code attribute" do
    exception, response = generate_exception(%({"code":"ErrorCode" }))

    exception.should be_a(AC::ResponseException)
    exception = exception.as(AC::ResponseException)
    exception.http.should eq(response)
    exception.message.should be_nil
    exception.code.should eq("ErrorCode")
  end

  it "returns the full code when a # is not present using the Code attribute" do
    exception, response = generate_exception(%({"Code":"ErrorCode" }))

    exception.should be_a(AC::ResponseException)
    exception = exception.as(AC::ResponseException)
    exception.http.should eq(response)
    exception.message.should be_nil
    exception.code.should eq("ErrorCode")
  end

  it "returns empty message when the body is blank" do
    exception, response = generate_exception("")

    exception.should be_a(AC::ResponseException)
    exception = exception.as(AC::ResponseException)
    exception.http.should eq(response)
    exception.message.should eq("")
    exception.code.should be_nil
  end

  it "returns the status code when the body is not valid JSON" do
    exception, response = generate_exception("<html><body><b>Http/1.1 Service Unavailable</b></body> </html>")

    exception.should be_a(AC::ResponseException)
    exception = exception.as(AC::ResponseException)
    exception.http.should eq(response)
    exception.message.should eq("<html><body><b>Http/1.1 Service Unavailable</b></body> </html>")
    exception.code.should be_nil
  end

  it "returns ResponseException when the error type is not set" do
    exception, response = generate_exception(%({"message":"Error Message" }))

    exception.should be_a(AC::ResponseException)
    exception = exception.as(AC::ResponseException)
    exception.http.should eq(response)
    exception.message.should eq("Error Message")
    exception.code.should be_nil
  end

  it "returns the message when present" do
    exception, response = generate_exception(%({"__type":"ErrorCode", "message":"Error Message" }))

    exception.should be_a(ErrorCode)
    exception = exception.as(ErrorCode)
    exception.http.should eq(response)
    exception.message.should eq("Error Message")
    exception.code.should be_nil
  end

  it "returns the message when the message property is upper-cased" do
    exception, response = generate_exception(%({"__type":"ErrorCode", "Message":"Error Message" }))

    exception.should be_a(ErrorCode)
    exception = exception.as(ErrorCode)
    exception.http.should eq(response)
    exception.message.should eq("Error Message")
    exception.code.should be_nil
  end

  it "returns a special message for RequestEntityToLarge errors" do
    exception, response = generate_exception(%({"__type":"RequestEntityTooLarge" }))

    exception.should be_a(AC::RequestEntityTooLarge)
    exception = exception.as(AC::RequestEntityTooLarge)
    exception.http.should eq(response)
    exception.message.should eq("Request body must be less than 1 MB")
    exception.code.should be_nil
  end
end
