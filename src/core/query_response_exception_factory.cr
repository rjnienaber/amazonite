require "xml"
require "./response_exception_factory"

module Amazonite::Core
  # awsQuery and restXml services report errors as XML (`<ErrorResponse>
  # <Error><Code>...</Code><Message>...</Message></Error></ErrorResponse>`,
  # or a bare `<Error>` for S3) rather than the JSON body
  # ResponseExceptionFactory#build expects, and identify the error by that
  # <Code> text rather than a JSON __type field or header - overriding #build
  # here (rather than a standalone class) means Core::Client, which is typed
  # against ResponseExceptionFactory, accepts either protocol's generated
  # ExceptionFactory without any further changes. The <Error> search is
  # unanchored, so it finds the element at either depth.
  abstract class QueryResponseExceptionFactory < ResponseExceptionFactory
    # Builds the exception for an awsQuery error response, dispatching on
    # the XML `<Error><Code>` value via `#create`.
    def build(response : HTTP::Client::Response) : ResponseException
      error = XML.parse(response.body).xpath_node("//*[local-name()='Error']")
      code = error.try(&.xpath_node("*[local-name()='Code']")).try(&.content)
      message = error.try(&.xpath_node("*[local-name()='Message']")).try(&.content)
      error_instance = create(code, response, message, code)

      case {code, error_instance}
      when {_, ResponseException}                 then error_instance
      when {VALIDATION_EXCEPTION_TYPE, nil}       then ValidationException.new(response, message)
      when {ENTITY_TOO_LARGE_EXCEPTION_TYPE, nil} then RequestEntityTooLarge.new(response, message)
      else
        ResponseException.new(response, message, code)
      end
    rescue XML::Error
      ResponseException.new(response, response.body)
    end
  end
end
