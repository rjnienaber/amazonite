private alias Core = Amazonite::Core

module Amazonite::Iam
  class AccountNotManagementOrDelegatedAdministratorException < Core::ResponseException
  end

  class CallerIsNotManagementAccountException < Core::ResponseException
  end

  class ConcurrentModificationException < Core::ResponseException
  end

  class CredentialReportExpiredException < Core::ResponseException
  end

  class CredentialReportNotPresentException < Core::ResponseException
  end

  class CredentialReportNotReadyException < Core::ResponseException
  end

  class DeleteConflictException < Core::ResponseException
  end

  class DuplicateCertificateException < Core::ResponseException
  end

  class DuplicateSSHPublicKeyException < Core::ResponseException
  end

  class EntityAlreadyExistsException < Core::ResponseException
  end

  class EntityTemporarilyUnmodifiableException < Core::ResponseException
  end

  class FeatureDisabledException < Core::ResponseException
  end

  class FeatureEnabledException < Core::ResponseException
  end

  class InvalidAuthenticationCodeException < Core::ResponseException
  end

  class InvalidCertificateException < Core::ResponseException
  end

  class InvalidInputException < Core::ResponseException
  end

  class InvalidPublicKeyException < Core::ResponseException
  end

  class InvalidUserTypeException < Core::ResponseException
  end

  class KeyPairMismatchException < Core::ResponseException
  end

  class LimitExceededException < Core::ResponseException
  end

  class MalformedCertificateException < Core::ResponseException
  end

  class MalformedPolicyDocumentException < Core::ResponseException
  end

  class NameConflictException < Core::ResponseException
  end

  class NoSuchEntityException < Core::ResponseException
  end

  class OpenIdIdpCommunicationErrorException < Core::ResponseException
  end

  class OrganizationNotFoundException < Core::ResponseException
  end

  class OrganizationNotInAllFeaturesModeException < Core::ResponseException
  end

  class PasswordPolicyViolationException < Core::ResponseException
  end

  class PolicyEvaluationException < Core::ResponseException
  end

  class PolicyNotAttachableException < Core::ResponseException
  end

  class ReportGenerationLimitExceededException < Core::ResponseException
  end

  class RoleModifiedException < Core::ResponseException
  end

  class RoleTemplateDisabledException < Core::ResponseException
  end

  class ServiceAccessNotEnabledException < Core::ResponseException
  end

  class ServiceFailureException < Core::ResponseException
  end

  class ServiceNotSupportedException < Core::ResponseException
  end

  class UnmodifiableEntityException < Core::ResponseException
  end

  class UnrecognizedPublicKeyEncodingException < Core::ResponseException
  end

  class ExceptionFactory < Core::QueryResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "AccountNotManagementOrDelegatedAdministratorException" then AccountNotManagementOrDelegatedAdministratorException.new(http, message, code)
      when "CallerIsNotManagementAccountException"                 then CallerIsNotManagementAccountException.new(http, message, code)
      when "ConcurrentModification"                                then ConcurrentModificationException.new(http, message, code)
      when "ReportExpired"                                         then CredentialReportExpiredException.new(http, message, code)
      when "ReportNotPresent"                                      then CredentialReportNotPresentException.new(http, message, code)
      when "ReportInProgress"                                      then CredentialReportNotReadyException.new(http, message, code)
      when "DeleteConflict"                                        then DeleteConflictException.new(http, message, code)
      when "DuplicateCertificate"                                  then DuplicateCertificateException.new(http, message, code)
      when "DuplicateSSHPublicKey"                                 then DuplicateSSHPublicKeyException.new(http, message, code)
      when "EntityAlreadyExists"                                   then EntityAlreadyExistsException.new(http, message, code)
      when "EntityTemporarilyUnmodifiable"                         then EntityTemporarilyUnmodifiableException.new(http, message, code)
      when "FeatureDisabled"                                       then FeatureDisabledException.new(http, message, code)
      when "FeatureEnabled"                                        then FeatureEnabledException.new(http, message, code)
      when "InvalidAuthenticationCode"                             then InvalidAuthenticationCodeException.new(http, message, code)
      when "InvalidCertificate"                                    then InvalidCertificateException.new(http, message, code)
      when "InvalidInput"                                          then InvalidInputException.new(http, message, code)
      when "InvalidPublicKey"                                      then InvalidPublicKeyException.new(http, message, code)
      when "InvalidUserType"                                       then InvalidUserTypeException.new(http, message, code)
      when "KeyPairMismatch"                                       then KeyPairMismatchException.new(http, message, code)
      when "LimitExceeded"                                         then LimitExceededException.new(http, message, code)
      when "MalformedCertificate"                                  then MalformedCertificateException.new(http, message, code)
      when "MalformedPolicyDocument"                               then MalformedPolicyDocumentException.new(http, message, code)
      when "NameConflict"                                          then NameConflictException.new(http, message, code)
      when "NoSuchEntity"                                          then NoSuchEntityException.new(http, message, code)
      when "OpenIdIdpCommunicationError"                           then OpenIdIdpCommunicationErrorException.new(http, message, code)
      when "OrganizationNotFoundException"                         then OrganizationNotFoundException.new(http, message, code)
      when "OrganizationNotInAllFeaturesModeException"             then OrganizationNotInAllFeaturesModeException.new(http, message, code)
      when "PasswordPolicyViolation"                               then PasswordPolicyViolationException.new(http, message, code)
      when "PolicyEvaluation"                                      then PolicyEvaluationException.new(http, message, code)
      when "PolicyNotAttachable"                                   then PolicyNotAttachableException.new(http, message, code)
      when "ReportGenerationLimitExceeded"                         then ReportGenerationLimitExceededException.new(http, message, code)
      when "RoleModified"                                          then RoleModifiedException.new(http, message, code)
      when "RoleTemplateDisabled"                                  then RoleTemplateDisabledException.new(http, message, code)
      when "ServiceAccessNotEnabledException"                      then ServiceAccessNotEnabledException.new(http, message, code)
      when "ServiceFailure"                                        then ServiceFailureException.new(http, message, code)
      when "NotSupportedService"                                   then ServiceNotSupportedException.new(http, message, code)
      when "UnmodifiableEntity"                                    then UnmodifiableEntityException.new(http, message, code)
      when "UnrecognizedPublicKeyEncoding"                         then UnrecognizedPublicKeyEncodingException.new(http, message, code)
      end
    end
  end
end
