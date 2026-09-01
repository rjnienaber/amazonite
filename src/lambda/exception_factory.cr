private alias Core = Amazonite::Core

module Amazonite::Lambda
  class AliasLimitExceededException < Core::ResponseException
  end

  class CallbackTimeoutException < Core::ResponseException
  end

  class CapacityProviderLimitExceededException < Core::ResponseException
  end

  class CodeArtifactUserDeletedException < Core::ResponseException
  end

  class CodeArtifactUserFailedException < Core::ResponseException
  end

  class CodeArtifactUserPendingException < Core::ResponseException
  end

  class CodeSigningConfigNotFoundException < Core::ResponseException
  end

  class CodeStorageExceededException < Core::ResponseException
  end

  class CodeVerificationFailedException < Core::ResponseException
  end

  class DurableExecutionAlreadyStartedException < Core::ResponseException
  end

  class EC2AccessDeniedException < Core::ResponseException
  end

  class EC2ThrottledException < Core::ResponseException
  end

  class EC2UnexpectedException < Core::ResponseException
  end

  class EFSIOException < Core::ResponseException
  end

  class EFSMountConnectivityException < Core::ResponseException
  end

  class EFSMountFailureException < Core::ResponseException
  end

  class EFSMountTimeoutException < Core::ResponseException
  end

  class ENILimitReachedException < Core::ResponseException
  end

  class ENINotReadyException < Core::ResponseException
  end

  class FunctionVersionsPerCapacityProviderLimitExceededException < Core::ResponseException
  end

  class InvalidCodeSignatureException < Core::ResponseException
  end

  class InvalidParameterValueException < Core::ResponseException
  end

  class InvalidRequestContentException < Core::ResponseException
  end

  class InvalidRuntimeException < Core::ResponseException
  end

  class InvalidSecurityGroupIDException < Core::ResponseException
  end

  class InvalidSubnetIDException < Core::ResponseException
  end

  class InvalidZipFileException < Core::ResponseException
  end

  class KMSAccessDeniedException < Core::ResponseException
  end

  class KMSDisabledException < Core::ResponseException
  end

  class KMSInvalidStateException < Core::ResponseException
  end

  class KMSNotFoundException < Core::ResponseException
  end

  class ModeNotSupportedException < Core::ResponseException
  end

  class NoPublishedVersionException < Core::ResponseException
  end

  class PolicyLengthExceededException < Core::ResponseException
  end

  class PreconditionFailedException < Core::ResponseException
  end

  class ProvisionedConcurrencyConfigNotFoundException < Core::ResponseException
  end

  class PublicPolicyException < Core::ResponseException
  end

  class RecursiveInvocationException < Core::ResponseException
  end

  class RequestTooLargeException < Core::ResponseException
  end

  class ResourceConflictException < Core::ResponseException
  end

  class ResourceInUseException < Core::ResponseException
  end

  class ResourceNotFoundException < Core::ResponseException
  end

  class ResourceNotReadyException < Core::ResponseException
  end

  class S3FilesMountConnectivityException < Core::ResponseException
  end

  class S3FilesMountFailureException < Core::ResponseException
  end

  class S3FilesMountTimeoutException < Core::ResponseException
  end

  class SerializedRequestEntityTooLargeException < Core::ResponseException
  end

  class ServiceException < Core::ResponseException
  end

  class ServiceQuotaExceededException < Core::ResponseException
  end

  class SnapStartException < Core::ResponseException
  end

  class SnapStartNotReadyException < Core::ResponseException
  end

  class SnapStartRegenerationFailureException < Core::ResponseException
  end

  class SnapStartTimeoutException < Core::ResponseException
  end

  class SubnetIPAddressLimitReachedException < Core::ResponseException
  end

  class TooManyRequestsException < Core::ResponseException
  end

  class UnsupportedMediaTypeException < Core::ResponseException
  end

  class ExceptionFactory < Core::ResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "AliasLimitExceededException"                               then AliasLimitExceededException.new(http, message, code)
      when "CallbackTimeoutException"                                  then CallbackTimeoutException.new(http, message, code)
      when "CapacityProviderLimitExceededException"                    then CapacityProviderLimitExceededException.new(http, message, code)
      when "CodeArtifactUserDeletedException"                          then CodeArtifactUserDeletedException.new(http, message, code)
      when "CodeArtifactUserFailedException"                           then CodeArtifactUserFailedException.new(http, message, code)
      when "CodeArtifactUserPendingException"                          then CodeArtifactUserPendingException.new(http, message, code)
      when "CodeSigningConfigNotFoundException"                        then CodeSigningConfigNotFoundException.new(http, message, code)
      when "CodeStorageExceededException"                              then CodeStorageExceededException.new(http, message, code)
      when "CodeVerificationFailedException"                           then CodeVerificationFailedException.new(http, message, code)
      when "DurableExecutionAlreadyStartedException"                   then DurableExecutionAlreadyStartedException.new(http, message, code)
      when "EC2AccessDeniedException"                                  then EC2AccessDeniedException.new(http, message, code)
      when "EC2ThrottledException"                                     then EC2ThrottledException.new(http, message, code)
      when "EC2UnexpectedException"                                    then EC2UnexpectedException.new(http, message, code)
      when "EFSIOException"                                            then EFSIOException.new(http, message, code)
      when "EFSMountConnectivityException"                             then EFSMountConnectivityException.new(http, message, code)
      when "EFSMountFailureException"                                  then EFSMountFailureException.new(http, message, code)
      when "EFSMountTimeoutException"                                  then EFSMountTimeoutException.new(http, message, code)
      when "ENILimitReachedException"                                  then ENILimitReachedException.new(http, message, code)
      when "ENINotReadyException"                                      then ENINotReadyException.new(http, message, code)
      when "FunctionVersionsPerCapacityProviderLimitExceededException" then FunctionVersionsPerCapacityProviderLimitExceededException.new(http, message, code)
      when "InvalidCodeSignatureException"                             then InvalidCodeSignatureException.new(http, message, code)
      when "InvalidParameterValueException"                            then InvalidParameterValueException.new(http, message, code)
      when "InvalidRequestContentException"                            then InvalidRequestContentException.new(http, message, code)
      when "InvalidRuntimeException"                                   then InvalidRuntimeException.new(http, message, code)
      when "InvalidSecurityGroupIDException"                           then InvalidSecurityGroupIDException.new(http, message, code)
      when "InvalidSubnetIDException"                                  then InvalidSubnetIDException.new(http, message, code)
      when "InvalidZipFileException"                                   then InvalidZipFileException.new(http, message, code)
      when "KMSAccessDeniedException"                                  then KMSAccessDeniedException.new(http, message, code)
      when "KMSDisabledException"                                      then KMSDisabledException.new(http, message, code)
      when "KMSInvalidStateException"                                  then KMSInvalidStateException.new(http, message, code)
      when "KMSNotFoundException"                                      then KMSNotFoundException.new(http, message, code)
      when "ModeNotSupportedException"                                 then ModeNotSupportedException.new(http, message, code)
      when "NoPublishedVersionException"                               then NoPublishedVersionException.new(http, message, code)
      when "PolicyLengthExceededException"                             then PolicyLengthExceededException.new(http, message, code)
      when "PreconditionFailedException"                               then PreconditionFailedException.new(http, message, code)
      when "ProvisionedConcurrencyConfigNotFoundException"             then ProvisionedConcurrencyConfigNotFoundException.new(http, message, code)
      when "PublicPolicyException"                                     then PublicPolicyException.new(http, message, code)
      when "RecursiveInvocationException"                              then RecursiveInvocationException.new(http, message, code)
      when "RequestTooLargeException"                                  then RequestTooLargeException.new(http, message, code)
      when "ResourceConflictException"                                 then ResourceConflictException.new(http, message, code)
      when "ResourceInUseException"                                    then ResourceInUseException.new(http, message, code)
      when "ResourceNotFoundException"                                 then ResourceNotFoundException.new(http, message, code)
      when "ResourceNotReadyException"                                 then ResourceNotReadyException.new(http, message, code)
      when "S3FilesMountConnectivityException"                         then S3FilesMountConnectivityException.new(http, message, code)
      when "S3FilesMountFailureException"                              then S3FilesMountFailureException.new(http, message, code)
      when "S3FilesMountTimeoutException"                              then S3FilesMountTimeoutException.new(http, message, code)
      when "SerializedRequestEntityTooLargeException"                  then SerializedRequestEntityTooLargeException.new(http, message, code)
      when "ServiceException"                                          then ServiceException.new(http, message, code)
      when "ServiceQuotaExceededException"                             then ServiceQuotaExceededException.new(http, message, code)
      when "SnapStartException"                                        then SnapStartException.new(http, message, code)
      when "SnapStartNotReadyException"                                then SnapStartNotReadyException.new(http, message, code)
      when "SnapStartRegenerationFailureException"                     then SnapStartRegenerationFailureException.new(http, message, code)
      when "SnapStartTimeoutException"                                 then SnapStartTimeoutException.new(http, message, code)
      when "SubnetIPAddressLimitReachedException"                      then SubnetIPAddressLimitReachedException.new(http, message, code)
      when "TooManyRequestsException"                                  then TooManyRequestsException.new(http, message, code)
      when "UnsupportedMediaTypeException"                             then UnsupportedMediaTypeException.new(http, message, code)
      end
    end
  end
end
