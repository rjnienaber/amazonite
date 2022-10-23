module Amazonite::Core
  abstract class ResponseExceptionFactory
    private VALIDATION_EXCEPTION_TYPE       = ValidationException.name.split("::").last
    private ENTITY_TOO_LARGE_EXCEPTION_TYPE = RequestEntityTooLarge.name.split("::").last

    def build(response : HTTP::Client::Response) : ResponseException
      json = JSON::Parser.new(response.body).parse

      exception_type = json["__type"]?.try &.as_s
      message = json["message"]?.try &.as_s || json["Message"]?.try &.as_s
      code = json["code"]?.try &.as_s || json["Code"]?.try &.as_s
      parsed_type = parse_exception_type(exception_type.as(String)) unless exception_type.nil?
      error = create(parsed_type, response, message, code)

      case {parsed_type, error}
      when {_, ResponseException}                 then error
      when {VALIDATION_EXCEPTION_TYPE, nil}       then ValidationException.new(response, message)
      when {ENTITY_TOO_LARGE_EXCEPTION_TYPE, nil} then RequestEntityTooLarge.new(response, message)
      else
        ResponseException.new(response, message, code)
      end
    rescue JSON::ParseException
      ResponseException.new(response, response.body)
    end

    abstract def create(exception_type : String | Nil, http : HTTP::Client::Response, message : String | Nil, code : String | Nil) : ResponseException | Nil

    private def parse_exception_type(exception_type : String)
      parts = exception_type.split("#")
      parts.size > 1 ? parts[1] : parts[0]
    end
  end
end
