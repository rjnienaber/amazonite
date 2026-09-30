private alias Core = Amazonite::Core

module Amazonite::Kms
  class AlreadyExistsException < Core::ResponseException
  end

  class CloudHsmClusterInUseException < Core::ResponseException
  end

  class CloudHsmClusterInvalidConfigurationException < Core::ResponseException
  end

  class CloudHsmClusterNotActiveException < Core::ResponseException
  end

  class CloudHsmClusterNotFoundException < Core::ResponseException
  end

  class CloudHsmClusterNotRelatedException < Core::ResponseException
  end

  class ConflictException < Core::ResponseException
  end

  class CustomKeyStoreHasCMKsException < Core::ResponseException
  end

  class CustomKeyStoreInvalidStateException < Core::ResponseException
  end

  class CustomKeyStoreNameInUseException < Core::ResponseException
  end

  class CustomKeyStoreNotFoundException < Core::ResponseException
  end

  class DependencyTimeoutException < Core::ResponseException
  end

  class DisabledException < Core::ResponseException
  end

  class DryRunOperationException < Core::ResponseException
  end

  class ExpiredImportTokenException < Core::ResponseException
  end

  class IncorrectKeyException < Core::ResponseException
  end

  class IncorrectKeyMaterialException < Core::ResponseException
  end

  class IncorrectTrustAnchorException < Core::ResponseException
  end

  class InvalidAliasNameException < Core::ResponseException
  end

  class InvalidArnException < Core::ResponseException
  end

  class InvalidCiphertextException < Core::ResponseException
  end

  class InvalidGrantIdException < Core::ResponseException
  end

  class InvalidGrantTokenException < Core::ResponseException
  end

  class InvalidImportTokenException < Core::ResponseException
  end

  class InvalidKeyUsageException < Core::ResponseException
  end

  class InvalidMarkerException < Core::ResponseException
  end

  class KMSInternalException < Core::ResponseException
  end

  class KMSInvalidMacException < Core::ResponseException
  end

  class KMSInvalidSignatureException < Core::ResponseException
  end

  class KMSInvalidStateException < Core::ResponseException
  end

  class KeyUnavailableException < Core::ResponseException
  end

  class LimitExceededException < Core::ResponseException
  end

  class MalformedPolicyDocumentException < Core::ResponseException
  end

  class NotFoundException < Core::ResponseException
  end

  class TagException < Core::ResponseException
  end

  class UnsupportedOperationException < Core::ResponseException
  end

  class XksKeyAlreadyInUseException < Core::ResponseException
  end

  class XksKeyInvalidConfigurationException < Core::ResponseException
  end

  class XksKeyNotFoundException < Core::ResponseException
  end

  class XksProxyIncorrectAuthenticationCredentialException < Core::ResponseException
  end

  class XksProxyInvalidConfigurationException < Core::ResponseException
  end

  class XksProxyInvalidResponseException < Core::ResponseException
  end

  class XksProxyUriEndpointInUseException < Core::ResponseException
  end

  class XksProxyUriInUseException < Core::ResponseException
  end

  class XksProxyUriUnreachableException < Core::ResponseException
  end

  class XksProxyVpcEndpointServiceInUseException < Core::ResponseException
  end

  class XksProxyVpcEndpointServiceInvalidConfigurationException < Core::ResponseException
  end

  class XksProxyVpcEndpointServiceNotFoundException < Core::ResponseException
  end

  class ExceptionFactory < Core::ResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "AlreadyExistsException"                                  then AlreadyExistsException.new(http, message, code)
      when "CloudHsmClusterInUseException"                           then CloudHsmClusterInUseException.new(http, message, code)
      when "CloudHsmClusterInvalidConfigurationException"            then CloudHsmClusterInvalidConfigurationException.new(http, message, code)
      when "CloudHsmClusterNotActiveException"                       then CloudHsmClusterNotActiveException.new(http, message, code)
      when "CloudHsmClusterNotFoundException"                        then CloudHsmClusterNotFoundException.new(http, message, code)
      when "CloudHsmClusterNotRelatedException"                      then CloudHsmClusterNotRelatedException.new(http, message, code)
      when "ConflictException"                                       then ConflictException.new(http, message, code)
      when "CustomKeyStoreHasCMKsException"                          then CustomKeyStoreHasCMKsException.new(http, message, code)
      when "CustomKeyStoreInvalidStateException"                     then CustomKeyStoreInvalidStateException.new(http, message, code)
      when "CustomKeyStoreNameInUseException"                        then CustomKeyStoreNameInUseException.new(http, message, code)
      when "CustomKeyStoreNotFoundException"                         then CustomKeyStoreNotFoundException.new(http, message, code)
      when "DependencyTimeoutException"                              then DependencyTimeoutException.new(http, message, code)
      when "DisabledException"                                       then DisabledException.new(http, message, code)
      when "DryRunOperationException"                                then DryRunOperationException.new(http, message, code)
      when "ExpiredImportTokenException"                             then ExpiredImportTokenException.new(http, message, code)
      when "IncorrectKeyException"                                   then IncorrectKeyException.new(http, message, code)
      when "IncorrectKeyMaterialException"                           then IncorrectKeyMaterialException.new(http, message, code)
      when "IncorrectTrustAnchorException"                           then IncorrectTrustAnchorException.new(http, message, code)
      when "InvalidAliasNameException"                               then InvalidAliasNameException.new(http, message, code)
      when "InvalidArnException"                                     then InvalidArnException.new(http, message, code)
      when "InvalidCiphertextException"                              then InvalidCiphertextException.new(http, message, code)
      when "InvalidGrantIdException"                                 then InvalidGrantIdException.new(http, message, code)
      when "InvalidGrantTokenException"                              then InvalidGrantTokenException.new(http, message, code)
      when "InvalidImportTokenException"                             then InvalidImportTokenException.new(http, message, code)
      when "InvalidKeyUsageException"                                then InvalidKeyUsageException.new(http, message, code)
      when "InvalidMarkerException"                                  then InvalidMarkerException.new(http, message, code)
      when "KMSInternalException"                                    then KMSInternalException.new(http, message, code)
      when "KMSInvalidMacException"                                  then KMSInvalidMacException.new(http, message, code)
      when "KMSInvalidSignatureException"                            then KMSInvalidSignatureException.new(http, message, code)
      when "KMSInvalidStateException"                                then KMSInvalidStateException.new(http, message, code)
      when "KeyUnavailableException"                                 then KeyUnavailableException.new(http, message, code)
      when "LimitExceededException"                                  then LimitExceededException.new(http, message, code)
      when "MalformedPolicyDocumentException"                        then MalformedPolicyDocumentException.new(http, message, code)
      when "NotFoundException"                                       then NotFoundException.new(http, message, code)
      when "TagException"                                            then TagException.new(http, message, code)
      when "UnsupportedOperationException"                           then UnsupportedOperationException.new(http, message, code)
      when "XksKeyAlreadyInUseException"                             then XksKeyAlreadyInUseException.new(http, message, code)
      when "XksKeyInvalidConfigurationException"                     then XksKeyInvalidConfigurationException.new(http, message, code)
      when "XksKeyNotFoundException"                                 then XksKeyNotFoundException.new(http, message, code)
      when "XksProxyIncorrectAuthenticationCredentialException"      then XksProxyIncorrectAuthenticationCredentialException.new(http, message, code)
      when "XksProxyInvalidConfigurationException"                   then XksProxyInvalidConfigurationException.new(http, message, code)
      when "XksProxyInvalidResponseException"                        then XksProxyInvalidResponseException.new(http, message, code)
      when "XksProxyUriEndpointInUseException"                       then XksProxyUriEndpointInUseException.new(http, message, code)
      when "XksProxyUriInUseException"                               then XksProxyUriInUseException.new(http, message, code)
      when "XksProxyUriUnreachableException"                         then XksProxyUriUnreachableException.new(http, message, code)
      when "XksProxyVpcEndpointServiceInUseException"                then XksProxyVpcEndpointServiceInUseException.new(http, message, code)
      when "XksProxyVpcEndpointServiceInvalidConfigurationException" then XksProxyVpcEndpointServiceInvalidConfigurationException.new(http, message, code)
      when "XksProxyVpcEndpointServiceNotFoundException"             then XksProxyVpcEndpointServiceNotFoundException.new(http, message, code)
      end
    end
  end
end
