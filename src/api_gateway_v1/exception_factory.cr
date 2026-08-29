private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  class BadRequestException < Core::ResponseException
  end

  class ConflictException < Core::ResponseException
  end

  class LimitExceededException < Core::ResponseException
  end

  class NotFoundException < Core::ResponseException
  end

  class ServiceUnavailableException < Core::ResponseException
  end

  class TooManyRequestsException < Core::ResponseException
  end

  class UnauthorizedException < Core::ResponseException
  end

  class ExceptionFactory < Core::ResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "BadRequestException"         then BadRequestException.new(http, message, code)
      when "ConflictException"           then ConflictException.new(http, message, code)
      when "LimitExceededException"      then LimitExceededException.new(http, message, code)
      when "NotFoundException"           then NotFoundException.new(http, message, code)
      when "ServiceUnavailableException" then ServiceUnavailableException.new(http, message, code)
      when "TooManyRequestsException"    then TooManyRequestsException.new(http, message, code)
      when "UnauthorizedException"       then UnauthorizedException.new(http, message, code)
      end
    end
  end
end
