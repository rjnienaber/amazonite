private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum StateReasonCode
    Idle
    Creating
    Restoring
    EniLimitExceeded
    InsufficientRolePermissions
    InvalidConfiguration
    InternalError
    SubnetOutOfIpAddresses
    InvalidSubnet
    InvalidSecurityGroup
    ImageDeleted
    ImageAccessDenied
    InvalidImage
    KmsKeyAccessDenied
    KmsKeyNotFound
    InvalidStateKmsKey
    DisabledKmsKey
    EfsioError
    EfsMountConnectivityError
    EfsMountFailure
    EfsMountTimeout
    InvalidRuntime
    InvalidZipFileException
    FunctionError
    ServiceQuotaExceededException
    VcpuLimitExceeded
    CapacityProviderScalingLimitExceeded
    InsufficientCapacity
    Ec2RequestLimitExceeded
    FunctionErrorInitTimeout
    FunctionErrorRuntimeInitError
    FunctionErrorExtensionInitError
    FunctionErrorInvalidEntryPoint
    FunctionErrorInvalidWorkingDirectory
    FunctionErrorPermissionDenied
    FunctionErrorTooManyExtensions
    FunctionErrorInitResourceExhausted
    DisallowedByVpcEncryptionControl
    DrainingDurableExecutions
    DependencyError

    def self.to_json(e : StateReasonCode, json : JSON::Builder) : Nil
      value = case e
              when AL::StateReasonCode::Idle                                 then "Idle"
              when AL::StateReasonCode::Creating                             then "Creating"
              when AL::StateReasonCode::Restoring                            then "Restoring"
              when AL::StateReasonCode::EniLimitExceeded                     then "EniLimitExceeded"
              when AL::StateReasonCode::InsufficientRolePermissions          then "InsufficientRolePermissions"
              when AL::StateReasonCode::InvalidConfiguration                 then "InvalidConfiguration"
              when AL::StateReasonCode::InternalError                        then "InternalError"
              when AL::StateReasonCode::SubnetOutOfIpAddresses               then "SubnetOutOfIPAddresses"
              when AL::StateReasonCode::InvalidSubnet                        then "InvalidSubnet"
              when AL::StateReasonCode::InvalidSecurityGroup                 then "InvalidSecurityGroup"
              when AL::StateReasonCode::ImageDeleted                         then "ImageDeleted"
              when AL::StateReasonCode::ImageAccessDenied                    then "ImageAccessDenied"
              when AL::StateReasonCode::InvalidImage                         then "InvalidImage"
              when AL::StateReasonCode::KmsKeyAccessDenied                   then "KMSKeyAccessDenied"
              when AL::StateReasonCode::KmsKeyNotFound                       then "KMSKeyNotFound"
              when AL::StateReasonCode::InvalidStateKmsKey                   then "InvalidStateKMSKey"
              when AL::StateReasonCode::DisabledKmsKey                       then "DisabledKMSKey"
              when AL::StateReasonCode::EfsioError                           then "EFSIOError"
              when AL::StateReasonCode::EfsMountConnectivityError            then "EFSMountConnectivityError"
              when AL::StateReasonCode::EfsMountFailure                      then "EFSMountFailure"
              when AL::StateReasonCode::EfsMountTimeout                      then "EFSMountTimeout"
              when AL::StateReasonCode::InvalidRuntime                       then "InvalidRuntime"
              when AL::StateReasonCode::InvalidZipFileException              then "InvalidZipFileException"
              when AL::StateReasonCode::FunctionError                        then "FunctionError"
              when AL::StateReasonCode::ServiceQuotaExceededException        then "ServiceQuotaExceededException"
              when AL::StateReasonCode::VcpuLimitExceeded                    then "VcpuLimitExceeded"
              when AL::StateReasonCode::CapacityProviderScalingLimitExceeded then "CapacityProviderScalingLimitExceeded"
              when AL::StateReasonCode::InsufficientCapacity                 then "InsufficientCapacity"
              when AL::StateReasonCode::Ec2RequestLimitExceeded              then "EC2RequestLimitExceeded"
              when AL::StateReasonCode::FunctionErrorInitTimeout             then "FunctionError.InitTimeout"
              when AL::StateReasonCode::FunctionErrorRuntimeInitError        then "FunctionError.RuntimeInitError"
              when AL::StateReasonCode::FunctionErrorExtensionInitError      then "FunctionError.ExtensionInitError"
              when AL::StateReasonCode::FunctionErrorInvalidEntryPoint       then "FunctionError.InvalidEntryPoint"
              when AL::StateReasonCode::FunctionErrorInvalidWorkingDirectory then "FunctionError.InvalidWorkingDirectory"
              when AL::StateReasonCode::FunctionErrorPermissionDenied        then "FunctionError.PermissionDenied"
              when AL::StateReasonCode::FunctionErrorTooManyExtensions       then "FunctionError.TooManyExtensions"
              when AL::StateReasonCode::FunctionErrorInitResourceExhausted   then "FunctionError.InitResourceExhausted"
              when AL::StateReasonCode::DisallowedByVpcEncryptionControl     then "DisallowedByVpcEncryptionControl"
              when AL::StateReasonCode::DrainingDurableExecutions            then "DrainingDurableExecutions"
              when AL::StateReasonCode::DependencyError                      then "DependencyError"
              else
                raise Exception.new("unknown enum value for 'StateReasonCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::StateReasonCode
      value = pull.read_string
      case value
      when "Idle"                                  then AL::StateReasonCode::Idle
      when "Creating"                              then AL::StateReasonCode::Creating
      when "Restoring"                             then AL::StateReasonCode::Restoring
      when "EniLimitExceeded"                      then AL::StateReasonCode::EniLimitExceeded
      when "InsufficientRolePermissions"           then AL::StateReasonCode::InsufficientRolePermissions
      when "InvalidConfiguration"                  then AL::StateReasonCode::InvalidConfiguration
      when "InternalError"                         then AL::StateReasonCode::InternalError
      when "SubnetOutOfIPAddresses"                then AL::StateReasonCode::SubnetOutOfIpAddresses
      when "InvalidSubnet"                         then AL::StateReasonCode::InvalidSubnet
      when "InvalidSecurityGroup"                  then AL::StateReasonCode::InvalidSecurityGroup
      when "ImageDeleted"                          then AL::StateReasonCode::ImageDeleted
      when "ImageAccessDenied"                     then AL::StateReasonCode::ImageAccessDenied
      when "InvalidImage"                          then AL::StateReasonCode::InvalidImage
      when "KMSKeyAccessDenied"                    then AL::StateReasonCode::KmsKeyAccessDenied
      when "KMSKeyNotFound"                        then AL::StateReasonCode::KmsKeyNotFound
      when "InvalidStateKMSKey"                    then AL::StateReasonCode::InvalidStateKmsKey
      when "DisabledKMSKey"                        then AL::StateReasonCode::DisabledKmsKey
      when "EFSIOError"                            then AL::StateReasonCode::EfsioError
      when "EFSMountConnectivityError"             then AL::StateReasonCode::EfsMountConnectivityError
      when "EFSMountFailure"                       then AL::StateReasonCode::EfsMountFailure
      when "EFSMountTimeout"                       then AL::StateReasonCode::EfsMountTimeout
      when "InvalidRuntime"                        then AL::StateReasonCode::InvalidRuntime
      when "InvalidZipFileException"               then AL::StateReasonCode::InvalidZipFileException
      when "FunctionError"                         then AL::StateReasonCode::FunctionError
      when "ServiceQuotaExceededException"         then AL::StateReasonCode::ServiceQuotaExceededException
      when "VcpuLimitExceeded"                     then AL::StateReasonCode::VcpuLimitExceeded
      when "CapacityProviderScalingLimitExceeded"  then AL::StateReasonCode::CapacityProviderScalingLimitExceeded
      when "InsufficientCapacity"                  then AL::StateReasonCode::InsufficientCapacity
      when "EC2RequestLimitExceeded"               then AL::StateReasonCode::Ec2RequestLimitExceeded
      when "FunctionError.InitTimeout"             then AL::StateReasonCode::FunctionErrorInitTimeout
      when "FunctionError.RuntimeInitError"        then AL::StateReasonCode::FunctionErrorRuntimeInitError
      when "FunctionError.ExtensionInitError"      then AL::StateReasonCode::FunctionErrorExtensionInitError
      when "FunctionError.InvalidEntryPoint"       then AL::StateReasonCode::FunctionErrorInvalidEntryPoint
      when "FunctionError.InvalidWorkingDirectory" then AL::StateReasonCode::FunctionErrorInvalidWorkingDirectory
      when "FunctionError.PermissionDenied"        then AL::StateReasonCode::FunctionErrorPermissionDenied
      when "FunctionError.TooManyExtensions"       then AL::StateReasonCode::FunctionErrorTooManyExtensions
      when "FunctionError.InitResourceExhausted"   then AL::StateReasonCode::FunctionErrorInitResourceExhausted
      when "DisallowedByVpcEncryptionControl"      then AL::StateReasonCode::DisallowedByVpcEncryptionControl
      when "DrainingDurableExecutions"             then AL::StateReasonCode::DrainingDurableExecutions
      when "DependencyError"                       then AL::StateReasonCode::DependencyError
      else
        raise Exception.new("unknown enum value for 'StateReasonCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::StateReasonCode::Idle                                 then "Idle"
      when AL::StateReasonCode::Creating                             then "Creating"
      when AL::StateReasonCode::Restoring                            then "Restoring"
      when AL::StateReasonCode::EniLimitExceeded                     then "EniLimitExceeded"
      when AL::StateReasonCode::InsufficientRolePermissions          then "InsufficientRolePermissions"
      when AL::StateReasonCode::InvalidConfiguration                 then "InvalidConfiguration"
      when AL::StateReasonCode::InternalError                        then "InternalError"
      when AL::StateReasonCode::SubnetOutOfIpAddresses               then "SubnetOutOfIPAddresses"
      when AL::StateReasonCode::InvalidSubnet                        then "InvalidSubnet"
      when AL::StateReasonCode::InvalidSecurityGroup                 then "InvalidSecurityGroup"
      when AL::StateReasonCode::ImageDeleted                         then "ImageDeleted"
      when AL::StateReasonCode::ImageAccessDenied                    then "ImageAccessDenied"
      when AL::StateReasonCode::InvalidImage                         then "InvalidImage"
      when AL::StateReasonCode::KmsKeyAccessDenied                   then "KMSKeyAccessDenied"
      when AL::StateReasonCode::KmsKeyNotFound                       then "KMSKeyNotFound"
      when AL::StateReasonCode::InvalidStateKmsKey                   then "InvalidStateKMSKey"
      when AL::StateReasonCode::DisabledKmsKey                       then "DisabledKMSKey"
      when AL::StateReasonCode::EfsioError                           then "EFSIOError"
      when AL::StateReasonCode::EfsMountConnectivityError            then "EFSMountConnectivityError"
      when AL::StateReasonCode::EfsMountFailure                      then "EFSMountFailure"
      when AL::StateReasonCode::EfsMountTimeout                      then "EFSMountTimeout"
      when AL::StateReasonCode::InvalidRuntime                       then "InvalidRuntime"
      when AL::StateReasonCode::InvalidZipFileException              then "InvalidZipFileException"
      when AL::StateReasonCode::FunctionError                        then "FunctionError"
      when AL::StateReasonCode::ServiceQuotaExceededException        then "ServiceQuotaExceededException"
      when AL::StateReasonCode::VcpuLimitExceeded                    then "VcpuLimitExceeded"
      when AL::StateReasonCode::CapacityProviderScalingLimitExceeded then "CapacityProviderScalingLimitExceeded"
      when AL::StateReasonCode::InsufficientCapacity                 then "InsufficientCapacity"
      when AL::StateReasonCode::Ec2RequestLimitExceeded              then "EC2RequestLimitExceeded"
      when AL::StateReasonCode::FunctionErrorInitTimeout             then "FunctionError.InitTimeout"
      when AL::StateReasonCode::FunctionErrorRuntimeInitError        then "FunctionError.RuntimeInitError"
      when AL::StateReasonCode::FunctionErrorExtensionInitError      then "FunctionError.ExtensionInitError"
      when AL::StateReasonCode::FunctionErrorInvalidEntryPoint       then "FunctionError.InvalidEntryPoint"
      when AL::StateReasonCode::FunctionErrorInvalidWorkingDirectory then "FunctionError.InvalidWorkingDirectory"
      when AL::StateReasonCode::FunctionErrorPermissionDenied        then "FunctionError.PermissionDenied"
      when AL::StateReasonCode::FunctionErrorTooManyExtensions       then "FunctionError.TooManyExtensions"
      when AL::StateReasonCode::FunctionErrorInitResourceExhausted   then "FunctionError.InitResourceExhausted"
      when AL::StateReasonCode::DisallowedByVpcEncryptionControl     then "DisallowedByVpcEncryptionControl"
      when AL::StateReasonCode::DrainingDurableExecutions            then "DrainingDurableExecutions"
      when AL::StateReasonCode::DependencyError                      then "DependencyError"
      else
        raise Exception.new("unknown enum value for 'StateReasonCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::StateReasonCode?
      case key
      when "Idle"                                  then AL::StateReasonCode::Idle
      when "Creating"                              then AL::StateReasonCode::Creating
      when "Restoring"                             then AL::StateReasonCode::Restoring
      when "EniLimitExceeded"                      then AL::StateReasonCode::EniLimitExceeded
      when "InsufficientRolePermissions"           then AL::StateReasonCode::InsufficientRolePermissions
      when "InvalidConfiguration"                  then AL::StateReasonCode::InvalidConfiguration
      when "InternalError"                         then AL::StateReasonCode::InternalError
      when "SubnetOutOfIPAddresses"                then AL::StateReasonCode::SubnetOutOfIpAddresses
      when "InvalidSubnet"                         then AL::StateReasonCode::InvalidSubnet
      when "InvalidSecurityGroup"                  then AL::StateReasonCode::InvalidSecurityGroup
      when "ImageDeleted"                          then AL::StateReasonCode::ImageDeleted
      when "ImageAccessDenied"                     then AL::StateReasonCode::ImageAccessDenied
      when "InvalidImage"                          then AL::StateReasonCode::InvalidImage
      when "KMSKeyAccessDenied"                    then AL::StateReasonCode::KmsKeyAccessDenied
      when "KMSKeyNotFound"                        then AL::StateReasonCode::KmsKeyNotFound
      when "InvalidStateKMSKey"                    then AL::StateReasonCode::InvalidStateKmsKey
      when "DisabledKMSKey"                        then AL::StateReasonCode::DisabledKmsKey
      when "EFSIOError"                            then AL::StateReasonCode::EfsioError
      when "EFSMountConnectivityError"             then AL::StateReasonCode::EfsMountConnectivityError
      when "EFSMountFailure"                       then AL::StateReasonCode::EfsMountFailure
      when "EFSMountTimeout"                       then AL::StateReasonCode::EfsMountTimeout
      when "InvalidRuntime"                        then AL::StateReasonCode::InvalidRuntime
      when "InvalidZipFileException"               then AL::StateReasonCode::InvalidZipFileException
      when "FunctionError"                         then AL::StateReasonCode::FunctionError
      when "ServiceQuotaExceededException"         then AL::StateReasonCode::ServiceQuotaExceededException
      when "VcpuLimitExceeded"                     then AL::StateReasonCode::VcpuLimitExceeded
      when "CapacityProviderScalingLimitExceeded"  then AL::StateReasonCode::CapacityProviderScalingLimitExceeded
      when "InsufficientCapacity"                  then AL::StateReasonCode::InsufficientCapacity
      when "EC2RequestLimitExceeded"               then AL::StateReasonCode::Ec2RequestLimitExceeded
      when "FunctionError.InitTimeout"             then AL::StateReasonCode::FunctionErrorInitTimeout
      when "FunctionError.RuntimeInitError"        then AL::StateReasonCode::FunctionErrorRuntimeInitError
      when "FunctionError.ExtensionInitError"      then AL::StateReasonCode::FunctionErrorExtensionInitError
      when "FunctionError.InvalidEntryPoint"       then AL::StateReasonCode::FunctionErrorInvalidEntryPoint
      when "FunctionError.InvalidWorkingDirectory" then AL::StateReasonCode::FunctionErrorInvalidWorkingDirectory
      when "FunctionError.PermissionDenied"        then AL::StateReasonCode::FunctionErrorPermissionDenied
      when "FunctionError.TooManyExtensions"       then AL::StateReasonCode::FunctionErrorTooManyExtensions
      when "FunctionError.InitResourceExhausted"   then AL::StateReasonCode::FunctionErrorInitResourceExhausted
      when "DisallowedByVpcEncryptionControl"      then AL::StateReasonCode::DisallowedByVpcEncryptionControl
      when "DrainingDurableExecutions"             then AL::StateReasonCode::DrainingDurableExecutions
      when "DependencyError"                       then AL::StateReasonCode::DependencyError
      else
        nil
      end
    end
  end
end
