module Amazonite::Core
  # Builds the `ResponseException` for an error response. Each generated
  # service module has its own subclass implementing `#create` to map the
  # service's exception type name to its generated exception class;
  # `Client` calls `#build` on that instance whenever a request fails.
  abstract class ResponseExceptionFactory
    private VALIDATION_EXCEPTION_TYPE       = ValidationException.name.split("::").last
    private ENTITY_TOO_LARGE_EXCEPTION_TYPE = RequestEntityTooLarge.name.split("::").last

    # Builds the exception for a JSON (awsJson/rest-json) error response,
    # dispatching on the `x-amzn-errortype` header or the body's `__type`
    # field via `#create`.
    def build(response : HTTP::Client::Response) : ResponseException
      json = JSON::Parser.new(response.body).parse

      # rest-json services identify the error type via the x-amzn-errortype
      # response header (sometimes suffixed with a docs URL, e.g.
      # "ResourceNotFoundException:https://...") rather than a JSON __type
      # field - awsJson services never send this header, so this is a no-op
      # fallback to the existing body-based detection for them.
      header_type = response.headers["x-amzn-errortype"]?.try &.split(':').first
      exception_type = header_type || json["__type"]?.try &.as_s
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

    # Returns the specific exception for `exception_type` (the service's
    # exception type name, e.g. "ResourceNotFoundException"), or `nil` if
    # the service doesn't declare that exception type - in which case
    # `#build` falls back to a generic `ResponseException`.
    abstract def create(exception_type : String?, http : HTTP::Client::Response, message : String?, code : String?) : ResponseException?

    private def parse_exception_type(exception_type : String)
      parts = exception_type.split("#")
      parts.size > 1 ? parts[1] : parts[0]
    end
  end
end
