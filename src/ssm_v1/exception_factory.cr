private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class AlreadyExistsException < Core::ResponseException
  end

  class AssociatedInstances < Core::ResponseException
  end

  class AssociationAlreadyExists < Core::ResponseException
  end

  class AssociationDoesNotExist < Core::ResponseException
  end

  class AssociationExecutionDoesNotExist < Core::ResponseException
  end

  class AssociationLimitExceeded < Core::ResponseException
  end

  class AssociationVersionLimitExceeded < Core::ResponseException
  end

  class AutomationDefinitionNotApprovedException < Core::ResponseException
  end

  class AutomationDefinitionNotFoundException < Core::ResponseException
  end

  class AutomationDefinitionVersionNotFoundException < Core::ResponseException
  end

  class AutomationExecutionLimitExceededException < Core::ResponseException
  end

  class AutomationExecutionNotFoundException < Core::ResponseException
  end

  class AutomationStepNotFoundException < Core::ResponseException
  end

  class ComplianceTypeCountLimitExceededException < Core::ResponseException
  end

  class CustomSchemaCountLimitExceededException < Core::ResponseException
  end

  class DocumentAlreadyExists < Core::ResponseException
  end

  class DocumentLimitExceeded < Core::ResponseException
  end

  class DocumentPermissionLimit < Core::ResponseException
  end

  class DocumentVersionLimitExceeded < Core::ResponseException
  end

  class DoesNotExistException < Core::ResponseException
  end

  class DuplicateDocumentContent < Core::ResponseException
  end

  class DuplicateDocumentVersionName < Core::ResponseException
  end

  class DuplicateInstanceId < Core::ResponseException
  end

  class FeatureNotAvailableException < Core::ResponseException
  end

  class HierarchyLevelLimitExceededException < Core::ResponseException
  end

  class HierarchyTypeMismatchException < Core::ResponseException
  end

  class IdempotentParameterMismatch < Core::ResponseException
  end

  class IncompatiblePolicyException < Core::ResponseException
  end

  class InternalServerError < Core::ResponseException
  end

  class InvalidActivation < Core::ResponseException
  end

  class InvalidActivationId < Core::ResponseException
  end

  class InvalidAggregatorException < Core::ResponseException
  end

  class InvalidAllowedPatternException < Core::ResponseException
  end

  class InvalidAssociation < Core::ResponseException
  end

  class InvalidAssociationVersion < Core::ResponseException
  end

  class InvalidAutomationExecutionParametersException < Core::ResponseException
  end

  class InvalidAutomationSignalException < Core::ResponseException
  end

  class InvalidAutomationStatusUpdateException < Core::ResponseException
  end

  class InvalidCommandId < Core::ResponseException
  end

  class InvalidDeleteInventoryParametersException < Core::ResponseException
  end

  class InvalidDeletionIdException < Core::ResponseException
  end

  class InvalidDocument < Core::ResponseException
  end

  class InvalidDocumentContent < Core::ResponseException
  end

  class InvalidDocumentOperation < Core::ResponseException
  end

  class InvalidDocumentSchemaVersion < Core::ResponseException
  end

  class InvalidDocumentType < Core::ResponseException
  end

  class InvalidDocumentVersion < Core::ResponseException
  end

  class InvalidFilter < Core::ResponseException
  end

  class InvalidFilterKey < Core::ResponseException
  end

  class InvalidFilterOption < Core::ResponseException
  end

  class InvalidFilterValue < Core::ResponseException
  end

  class InvalidInstanceId < Core::ResponseException
  end

  class InvalidInstanceInformationFilterValue < Core::ResponseException
  end

  class InvalidInventoryGroupException < Core::ResponseException
  end

  class InvalidInventoryItemContextException < Core::ResponseException
  end

  class InvalidInventoryRequestException < Core::ResponseException
  end

  class InvalidItemContentException < Core::ResponseException
  end

  class InvalidKeyId < Core::ResponseException
  end

  class InvalidNextToken < Core::ResponseException
  end

  class InvalidNotificationConfig < Core::ResponseException
  end

  class InvalidOptionException < Core::ResponseException
  end

  class InvalidOutputFolder < Core::ResponseException
  end

  class InvalidOutputLocation < Core::ResponseException
  end

  class InvalidParameters < Core::ResponseException
  end

  class InvalidPermissionType < Core::ResponseException
  end

  class InvalidPluginName < Core::ResponseException
  end

  class InvalidPolicyAttributeException < Core::ResponseException
  end

  class InvalidPolicyTypeException < Core::ResponseException
  end

  class InvalidResourceId < Core::ResponseException
  end

  class InvalidResourceType < Core::ResponseException
  end

  class InvalidResultAttributeException < Core::ResponseException
  end

  class InvalidRole < Core::ResponseException
  end

  class InvalidSchedule < Core::ResponseException
  end

  class InvalidTag < Core::ResponseException
  end

  class InvalidTarget < Core::ResponseException
  end

  class InvalidTargetMaps < Core::ResponseException
  end

  class InvalidTypeNameException < Core::ResponseException
  end

  class InvalidUpdate < Core::ResponseException
  end

  class InvocationDoesNotExist < Core::ResponseException
  end

  class ItemContentMismatchException < Core::ResponseException
  end

  class ItemSizeLimitExceededException < Core::ResponseException
  end

  class MaxDocumentSizeExceeded < Core::ResponseException
  end

  class OpsItemAlreadyExistsException < Core::ResponseException
  end

  class OpsItemInvalidParameterException < Core::ResponseException
  end

  class OpsItemLimitExceededException < Core::ResponseException
  end

  class OpsItemNotFoundException < Core::ResponseException
  end

  class OpsItemRelatedItemAlreadyExistsException < Core::ResponseException
  end

  class OpsItemRelatedItemAssociationNotFoundException < Core::ResponseException
  end

  class OpsMetadataAlreadyExistsException < Core::ResponseException
  end

  class OpsMetadataInvalidArgumentException < Core::ResponseException
  end

  class OpsMetadataKeyLimitExceededException < Core::ResponseException
  end

  class OpsMetadataLimitExceededException < Core::ResponseException
  end

  class OpsMetadataNotFoundException < Core::ResponseException
  end

  class OpsMetadataTooManyUpdatesException < Core::ResponseException
  end

  class ParameterAlreadyExists < Core::ResponseException
  end

  class ParameterLimitExceeded < Core::ResponseException
  end

  class ParameterMaxVersionLimitExceeded < Core::ResponseException
  end

  class ParameterNotFound < Core::ResponseException
  end

  class ParameterPatternMismatchException < Core::ResponseException
  end

  class ParameterVersionLabelLimitExceeded < Core::ResponseException
  end

  class ParameterVersionNotFound < Core::ResponseException
  end

  class PoliciesLimitExceededException < Core::ResponseException
  end

  class ResourceDataSyncAlreadyExistsException < Core::ResponseException
  end

  class ResourceDataSyncConflictException < Core::ResponseException
  end

  class ResourceDataSyncCountExceededException < Core::ResponseException
  end

  class ResourceDataSyncInvalidConfigurationException < Core::ResponseException
  end

  class ResourceDataSyncNotFoundException < Core::ResponseException
  end

  class ResourceInUseException < Core::ResponseException
  end

  class ResourceLimitExceededException < Core::ResponseException
  end

  class ServiceSettingNotFound < Core::ResponseException
  end

  class StatusUnchanged < Core::ResponseException
  end

  class SubTypeCountLimitExceededException < Core::ResponseException
  end

  class TargetInUseException < Core::ResponseException
  end

  class TargetNotConnected < Core::ResponseException
  end

  class TooManyTagsError < Core::ResponseException
  end

  class TooManyUpdates < Core::ResponseException
  end

  class TotalSizeLimitExceededException < Core::ResponseException
  end

  class UnsupportedCalendarException < Core::ResponseException
  end

  class UnsupportedFeatureRequiredException < Core::ResponseException
  end

  class UnsupportedInventoryItemContextException < Core::ResponseException
  end

  class UnsupportedInventorySchemaVersionException < Core::ResponseException
  end

  class UnsupportedOperatingSystem < Core::ResponseException
  end

  class UnsupportedParameterType < Core::ResponseException
  end

  class UnsupportedPlatformType < Core::ResponseException
  end

  class ExceptionFactory < Core::ResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "AlreadyExistsException"                         then AlreadyExistsException.new(http, message, code)
      when "AssociatedInstances"                            then AssociatedInstances.new(http, message, code)
      when "AssociationAlreadyExists"                       then AssociationAlreadyExists.new(http, message, code)
      when "AssociationDoesNotExist"                        then AssociationDoesNotExist.new(http, message, code)
      when "AssociationExecutionDoesNotExist"               then AssociationExecutionDoesNotExist.new(http, message, code)
      when "AssociationLimitExceeded"                       then AssociationLimitExceeded.new(http, message, code)
      when "AssociationVersionLimitExceeded"                then AssociationVersionLimitExceeded.new(http, message, code)
      when "AutomationDefinitionNotApprovedException"       then AutomationDefinitionNotApprovedException.new(http, message, code)
      when "AutomationDefinitionNotFoundException"          then AutomationDefinitionNotFoundException.new(http, message, code)
      when "AutomationDefinitionVersionNotFoundException"   then AutomationDefinitionVersionNotFoundException.new(http, message, code)
      when "AutomationExecutionLimitExceededException"      then AutomationExecutionLimitExceededException.new(http, message, code)
      when "AutomationExecutionNotFoundException"           then AutomationExecutionNotFoundException.new(http, message, code)
      when "AutomationStepNotFoundException"                then AutomationStepNotFoundException.new(http, message, code)
      when "ComplianceTypeCountLimitExceededException"      then ComplianceTypeCountLimitExceededException.new(http, message, code)
      when "CustomSchemaCountLimitExceededException"        then CustomSchemaCountLimitExceededException.new(http, message, code)
      when "DocumentAlreadyExists"                          then DocumentAlreadyExists.new(http, message, code)
      when "DocumentLimitExceeded"                          then DocumentLimitExceeded.new(http, message, code)
      when "DocumentPermissionLimit"                        then DocumentPermissionLimit.new(http, message, code)
      when "DocumentVersionLimitExceeded"                   then DocumentVersionLimitExceeded.new(http, message, code)
      when "DoesNotExistException"                          then DoesNotExistException.new(http, message, code)
      when "DuplicateDocumentContent"                       then DuplicateDocumentContent.new(http, message, code)
      when "DuplicateDocumentVersionName"                   then DuplicateDocumentVersionName.new(http, message, code)
      when "DuplicateInstanceId"                            then DuplicateInstanceId.new(http, message, code)
      when "FeatureNotAvailableException"                   then FeatureNotAvailableException.new(http, message, code)
      when "HierarchyLevelLimitExceededException"           then HierarchyLevelLimitExceededException.new(http, message, code)
      when "HierarchyTypeMismatchException"                 then HierarchyTypeMismatchException.new(http, message, code)
      when "IdempotentParameterMismatch"                    then IdempotentParameterMismatch.new(http, message, code)
      when "IncompatiblePolicyException"                    then IncompatiblePolicyException.new(http, message, code)
      when "InternalServerError"                            then InternalServerError.new(http, message, code)
      when "InvalidActivation"                              then InvalidActivation.new(http, message, code)
      when "InvalidActivationId"                            then InvalidActivationId.new(http, message, code)
      when "InvalidAggregatorException"                     then InvalidAggregatorException.new(http, message, code)
      when "InvalidAllowedPatternException"                 then InvalidAllowedPatternException.new(http, message, code)
      when "InvalidAssociation"                             then InvalidAssociation.new(http, message, code)
      when "InvalidAssociationVersion"                      then InvalidAssociationVersion.new(http, message, code)
      when "InvalidAutomationExecutionParametersException"  then InvalidAutomationExecutionParametersException.new(http, message, code)
      when "InvalidAutomationSignalException"               then InvalidAutomationSignalException.new(http, message, code)
      when "InvalidAutomationStatusUpdateException"         then InvalidAutomationStatusUpdateException.new(http, message, code)
      when "InvalidCommandId"                               then InvalidCommandId.new(http, message, code)
      when "InvalidDeleteInventoryParametersException"      then InvalidDeleteInventoryParametersException.new(http, message, code)
      when "InvalidDeletionIdException"                     then InvalidDeletionIdException.new(http, message, code)
      when "InvalidDocument"                                then InvalidDocument.new(http, message, code)
      when "InvalidDocumentContent"                         then InvalidDocumentContent.new(http, message, code)
      when "InvalidDocumentOperation"                       then InvalidDocumentOperation.new(http, message, code)
      when "InvalidDocumentSchemaVersion"                   then InvalidDocumentSchemaVersion.new(http, message, code)
      when "InvalidDocumentType"                            then InvalidDocumentType.new(http, message, code)
      when "InvalidDocumentVersion"                         then InvalidDocumentVersion.new(http, message, code)
      when "InvalidFilter"                                  then InvalidFilter.new(http, message, code)
      when "InvalidFilterKey"                               then InvalidFilterKey.new(http, message, code)
      when "InvalidFilterOption"                            then InvalidFilterOption.new(http, message, code)
      when "InvalidFilterValue"                             then InvalidFilterValue.new(http, message, code)
      when "InvalidInstanceId"                              then InvalidInstanceId.new(http, message, code)
      when "InvalidInstanceInformationFilterValue"          then InvalidInstanceInformationFilterValue.new(http, message, code)
      when "InvalidInventoryGroupException"                 then InvalidInventoryGroupException.new(http, message, code)
      when "InvalidInventoryItemContextException"           then InvalidInventoryItemContextException.new(http, message, code)
      when "InvalidInventoryRequestException"               then InvalidInventoryRequestException.new(http, message, code)
      when "InvalidItemContentException"                    then InvalidItemContentException.new(http, message, code)
      when "InvalidKeyId"                                   then InvalidKeyId.new(http, message, code)
      when "InvalidNextToken"                               then InvalidNextToken.new(http, message, code)
      when "InvalidNotificationConfig"                      then InvalidNotificationConfig.new(http, message, code)
      when "InvalidOptionException"                         then InvalidOptionException.new(http, message, code)
      when "InvalidOutputFolder"                            then InvalidOutputFolder.new(http, message, code)
      when "InvalidOutputLocation"                          then InvalidOutputLocation.new(http, message, code)
      when "InvalidParameters"                              then InvalidParameters.new(http, message, code)
      when "InvalidPermissionType"                          then InvalidPermissionType.new(http, message, code)
      when "InvalidPluginName"                              then InvalidPluginName.new(http, message, code)
      when "InvalidPolicyAttributeException"                then InvalidPolicyAttributeException.new(http, message, code)
      when "InvalidPolicyTypeException"                     then InvalidPolicyTypeException.new(http, message, code)
      when "InvalidResourceId"                              then InvalidResourceId.new(http, message, code)
      when "InvalidResourceType"                            then InvalidResourceType.new(http, message, code)
      when "InvalidResultAttributeException"                then InvalidResultAttributeException.new(http, message, code)
      when "InvalidRole"                                    then InvalidRole.new(http, message, code)
      when "InvalidSchedule"                                then InvalidSchedule.new(http, message, code)
      when "InvalidTag"                                     then InvalidTag.new(http, message, code)
      when "InvalidTarget"                                  then InvalidTarget.new(http, message, code)
      when "InvalidTargetMaps"                              then InvalidTargetMaps.new(http, message, code)
      when "InvalidTypeNameException"                       then InvalidTypeNameException.new(http, message, code)
      when "InvalidUpdate"                                  then InvalidUpdate.new(http, message, code)
      when "InvocationDoesNotExist"                         then InvocationDoesNotExist.new(http, message, code)
      when "ItemContentMismatchException"                   then ItemContentMismatchException.new(http, message, code)
      when "ItemSizeLimitExceededException"                 then ItemSizeLimitExceededException.new(http, message, code)
      when "MaxDocumentSizeExceeded"                        then MaxDocumentSizeExceeded.new(http, message, code)
      when "OpsItemAlreadyExistsException"                  then OpsItemAlreadyExistsException.new(http, message, code)
      when "OpsItemInvalidParameterException"               then OpsItemInvalidParameterException.new(http, message, code)
      when "OpsItemLimitExceededException"                  then OpsItemLimitExceededException.new(http, message, code)
      when "OpsItemNotFoundException"                       then OpsItemNotFoundException.new(http, message, code)
      when "OpsItemRelatedItemAlreadyExistsException"       then OpsItemRelatedItemAlreadyExistsException.new(http, message, code)
      when "OpsItemRelatedItemAssociationNotFoundException" then OpsItemRelatedItemAssociationNotFoundException.new(http, message, code)
      when "OpsMetadataAlreadyExistsException"              then OpsMetadataAlreadyExistsException.new(http, message, code)
      when "OpsMetadataInvalidArgumentException"            then OpsMetadataInvalidArgumentException.new(http, message, code)
      when "OpsMetadataKeyLimitExceededException"           then OpsMetadataKeyLimitExceededException.new(http, message, code)
      when "OpsMetadataLimitExceededException"              then OpsMetadataLimitExceededException.new(http, message, code)
      when "OpsMetadataNotFoundException"                   then OpsMetadataNotFoundException.new(http, message, code)
      when "OpsMetadataTooManyUpdatesException"             then OpsMetadataTooManyUpdatesException.new(http, message, code)
      when "ParameterAlreadyExists"                         then ParameterAlreadyExists.new(http, message, code)
      when "ParameterLimitExceeded"                         then ParameterLimitExceeded.new(http, message, code)
      when "ParameterMaxVersionLimitExceeded"               then ParameterMaxVersionLimitExceeded.new(http, message, code)
      when "ParameterNotFound"                              then ParameterNotFound.new(http, message, code)
      when "ParameterPatternMismatchException"              then ParameterPatternMismatchException.new(http, message, code)
      when "ParameterVersionLabelLimitExceeded"             then ParameterVersionLabelLimitExceeded.new(http, message, code)
      when "ParameterVersionNotFound"                       then ParameterVersionNotFound.new(http, message, code)
      when "PoliciesLimitExceededException"                 then PoliciesLimitExceededException.new(http, message, code)
      when "ResourceDataSyncAlreadyExistsException"         then ResourceDataSyncAlreadyExistsException.new(http, message, code)
      when "ResourceDataSyncConflictException"              then ResourceDataSyncConflictException.new(http, message, code)
      when "ResourceDataSyncCountExceededException"         then ResourceDataSyncCountExceededException.new(http, message, code)
      when "ResourceDataSyncInvalidConfigurationException"  then ResourceDataSyncInvalidConfigurationException.new(http, message, code)
      when "ResourceDataSyncNotFoundException"              then ResourceDataSyncNotFoundException.new(http, message, code)
      when "ResourceInUseException"                         then ResourceInUseException.new(http, message, code)
      when "ResourceLimitExceededException"                 then ResourceLimitExceededException.new(http, message, code)
      when "ServiceSettingNotFound"                         then ServiceSettingNotFound.new(http, message, code)
      when "StatusUnchanged"                                then StatusUnchanged.new(http, message, code)
      when "SubTypeCountLimitExceededException"             then SubTypeCountLimitExceededException.new(http, message, code)
      when "TargetInUseException"                           then TargetInUseException.new(http, message, code)
      when "TargetNotConnected"                             then TargetNotConnected.new(http, message, code)
      when "TooManyTagsError"                               then TooManyTagsError.new(http, message, code)
      when "TooManyUpdates"                                 then TooManyUpdates.new(http, message, code)
      when "TotalSizeLimitExceededException"                then TotalSizeLimitExceededException.new(http, message, code)
      when "UnsupportedCalendarException"                   then UnsupportedCalendarException.new(http, message, code)
      when "UnsupportedFeatureRequiredException"            then UnsupportedFeatureRequiredException.new(http, message, code)
      when "UnsupportedInventoryItemContextException"       then UnsupportedInventoryItemContextException.new(http, message, code)
      when "UnsupportedInventorySchemaVersionException"     then UnsupportedInventorySchemaVersionException.new(http, message, code)
      when "UnsupportedOperatingSystem"                     then UnsupportedOperatingSystem.new(http, message, code)
      when "UnsupportedParameterType"                       then UnsupportedParameterType.new(http, message, code)
      when "UnsupportedPlatformType"                        then UnsupportedPlatformType.new(http, message, code)
      end
    end
  end
end
