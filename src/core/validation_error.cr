module Amazonite::Core
  # Raised by a generated input/output object's `#validate!` when one of
  # its properties violates a constraint declared by the AWS API model
  # (a string/blob length or pattern, a numeric range, or a list/map size) -
  # unlike `ResponseException` and its subclasses, this is raised entirely
  # client-side, before any request is sent.
  class ValidationError < Exception
  end
end
