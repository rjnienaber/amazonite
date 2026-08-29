private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class DecryptionFailure < Core::ResponseException
  end

  class EncryptionFailure < Core::ResponseException
  end

  class InternalServiceError < Core::ResponseException
  end

  class InvalidNextTokenException < Core::ResponseException
  end

  class InvalidParameterException < Core::ResponseException
  end

  class InvalidRequestException < Core::ResponseException
  end

  class LimitExceededException < Core::ResponseException
  end

  class MalformedPolicyDocumentException < Core::ResponseException
  end

  class PreconditionNotMetException < Core::ResponseException
  end

  class PublicPolicyException < Core::ResponseException
  end

  class ResourceExistsException < Core::ResponseException
  end

  class ResourceNotFoundException < Core::ResponseException
  end

  class ExceptionFactory < Core::ResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "DecryptionFailure"                then DecryptionFailure.new(http, message, code)
      when "EncryptionFailure"                then EncryptionFailure.new(http, message, code)
      when "InternalServiceError"             then InternalServiceError.new(http, message, code)
      when "InvalidNextTokenException"        then InvalidNextTokenException.new(http, message, code)
      when "InvalidParameterException"        then InvalidParameterException.new(http, message, code)
      when "InvalidRequestException"          then InvalidRequestException.new(http, message, code)
      when "LimitExceededException"           then LimitExceededException.new(http, message, code)
      when "MalformedPolicyDocumentException" then MalformedPolicyDocumentException.new(http, message, code)
      when "PreconditionNotMetException"      then PreconditionNotMetException.new(http, message, code)
      when "PublicPolicyException"            then PublicPolicyException.new(http, message, code)
      when "ResourceExistsException"          then ResourceExistsException.new(http, message, code)
      when "ResourceNotFoundException"        then ResourceNotFoundException.new(http, message, code)
      end
    end
  end
end
