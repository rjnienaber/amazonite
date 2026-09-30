private alias Core = Amazonite::Core

module Amazonite::S3
  class AccessDenied < Core::ResponseException
  end

  class AnnotationLimitExceeded < Core::ResponseException
  end

  class AnnotationNameTooLong < Core::ResponseException
  end

  class BucketAlreadyExists < Core::ResponseException
  end

  class BucketAlreadyOwnedByYou < Core::ResponseException
  end

  class EncryptionTypeMismatch < Core::ResponseException
  end

  class IdempotencyParameterMismatch < Core::ResponseException
  end

  class InvalidAnnotationName < Core::ResponseException
  end

  class InvalidObjectState < Core::ResponseException
  end

  class InvalidPrefix < Core::ResponseException
  end

  class InvalidRequest < Core::ResponseException
  end

  class InvalidWriteOffset < Core::ResponseException
  end

  class NoSuchAnnotation < Core::ResponseException
  end

  class NoSuchBucket < Core::ResponseException
  end

  class NoSuchKey < Core::ResponseException
  end

  class NoSuchUpload < Core::ResponseException
  end

  class NotFound < Core::ResponseException
  end

  class ObjectAlreadyInActiveTierError < Core::ResponseException
  end

  class ObjectNotInActiveTierError < Core::ResponseException
  end

  class TooManyParts < Core::ResponseException
  end

  class UnsupportedMediaType < Core::ResponseException
  end

  class ExceptionFactory < Core::QueryResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "AccessDenied"                   then AccessDenied.new(http, message, code)
      when "AnnotationLimitExceeded"        then AnnotationLimitExceeded.new(http, message, code)
      when "AnnotationNameTooLong"          then AnnotationNameTooLong.new(http, message, code)
      when "BucketAlreadyExists"            then BucketAlreadyExists.new(http, message, code)
      when "BucketAlreadyOwnedByYou"        then BucketAlreadyOwnedByYou.new(http, message, code)
      when "EncryptionTypeMismatch"         then EncryptionTypeMismatch.new(http, message, code)
      when "IdempotencyParameterMismatch"   then IdempotencyParameterMismatch.new(http, message, code)
      when "InvalidAnnotationName"          then InvalidAnnotationName.new(http, message, code)
      when "InvalidObjectState"             then InvalidObjectState.new(http, message, code)
      when "InvalidPrefix"                  then InvalidPrefix.new(http, message, code)
      when "InvalidRequest"                 then InvalidRequest.new(http, message, code)
      when "InvalidWriteOffset"             then InvalidWriteOffset.new(http, message, code)
      when "NoSuchAnnotation"               then NoSuchAnnotation.new(http, message, code)
      when "NoSuchBucket"                   then NoSuchBucket.new(http, message, code)
      when "NoSuchKey"                      then NoSuchKey.new(http, message, code)
      when "NoSuchUpload"                   then NoSuchUpload.new(http, message, code)
      when "NotFound"                       then NotFound.new(http, message, code)
      when "ObjectAlreadyInActiveTierError" then ObjectAlreadyInActiveTierError.new(http, message, code)
      when "ObjectNotInActiveTierError"     then ObjectNotInActiveTierError.new(http, message, code)
      when "TooManyParts"                   then TooManyParts.new(http, message, code)
      when "UnsupportedMediaType"           then UnsupportedMediaType.new(http, message, code)
      end
    end
  end
end
