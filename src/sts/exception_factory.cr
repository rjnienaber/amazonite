private alias Core = Amazonite::Core

module Amazonite::Sts
  class ExpiredTokenException < Core::ResponseException
  end

  class ExpiredTradeInTokenException < Core::ResponseException
  end

  class IDPCommunicationErrorException < Core::ResponseException
  end

  class IDPRejectedClaimException < Core::ResponseException
  end

  class InvalidAuthorizationMessageException < Core::ResponseException
  end

  class InvalidIdentityTokenException < Core::ResponseException
  end

  class JWTPayloadSizeExceededException < Core::ResponseException
  end

  class MalformedPolicyDocumentException < Core::ResponseException
  end

  class OutboundWebIdentityFederationDisabledException < Core::ResponseException
  end

  class PackedPolicyTooLargeException < Core::ResponseException
  end

  class RegionDisabledException < Core::ResponseException
  end

  class SessionDurationEscalationException < Core::ResponseException
  end

  class ExceptionFactory < Core::QueryResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "ExpiredTokenException"                          then ExpiredTokenException.new(http, message, code)
      when "ExpiredTradeInTokenException"                   then ExpiredTradeInTokenException.new(http, message, code)
      when "IDPCommunicationError"                          then IDPCommunicationErrorException.new(http, message, code)
      when "IDPRejectedClaim"                               then IDPRejectedClaimException.new(http, message, code)
      when "InvalidAuthorizationMessageException"           then InvalidAuthorizationMessageException.new(http, message, code)
      when "InvalidIdentityToken"                           then InvalidIdentityTokenException.new(http, message, code)
      when "JWTPayloadSizeExceededException"                then JWTPayloadSizeExceededException.new(http, message, code)
      when "MalformedPolicyDocument"                        then MalformedPolicyDocumentException.new(http, message, code)
      when "OutboundWebIdentityFederationDisabledException" then OutboundWebIdentityFederationDisabledException.new(http, message, code)
      when "PackedPolicyTooLarge"                           then PackedPolicyTooLargeException.new(http, message, code)
      when "RegionDisabledException"                        then RegionDisabledException.new(http, message, code)
      when "SessionDurationEscalationException"             then SessionDurationEscalationException.new(http, message, code)
      end
    end
  end
end
