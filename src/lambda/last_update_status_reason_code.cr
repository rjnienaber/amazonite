private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum LastUpdateStatusReasonCode
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
    DependencyError

    def self.to_json(e : LastUpdateStatusReasonCode, json : JSON::Builder) : Nil
      value = case e
              when AL::LastUpdateStatusReasonCode::EniLimitExceeded                     then "EniLimitExceeded"
              when AL::LastUpdateStatusReasonCode::InsufficientRolePermissions          then "InsufficientRolePermissions"
              when AL::LastUpdateStatusReasonCode::InvalidConfiguration                 then "InvalidConfiguration"
              when AL::LastUpdateStatusReasonCode::InternalError                        then "InternalError"
              when AL::LastUpdateStatusReasonCode::SubnetOutOfIpAddresses               then "SubnetOutOfIPAddresses"
              when AL::LastUpdateStatusReasonCode::InvalidSubnet                        then "InvalidSubnet"
              when AL::LastUpdateStatusReasonCode::InvalidSecurityGroup                 then "InvalidSecurityGroup"
              when AL::LastUpdateStatusReasonCode::ImageDeleted                         then "ImageDeleted"
              when AL::LastUpdateStatusReasonCode::ImageAccessDenied                    then "ImageAccessDenied"
              when AL::LastUpdateStatusReasonCode::InvalidImage                         then "InvalidImage"
              when AL::LastUpdateStatusReasonCode::KmsKeyAccessDenied                   then "KMSKeyAccessDenied"
              when AL::LastUpdateStatusReasonCode::KmsKeyNotFound                       then "KMSKeyNotFound"
              when AL::LastUpdateStatusReasonCode::InvalidStateKmsKey                   then "InvalidStateKMSKey"
              when AL::LastUpdateStatusReasonCode::DisabledKmsKey                       then "DisabledKMSKey"
              when AL::LastUpdateStatusReasonCode::EfsioError                           then "EFSIOError"
              when AL::LastUpdateStatusReasonCode::EfsMountConnectivityError            then "EFSMountConnectivityError"
              when AL::LastUpdateStatusReasonCode::EfsMountFailure                      then "EFSMountFailure"
              when AL::LastUpdateStatusReasonCode::EfsMountTimeout                      then "EFSMountTimeout"
              when AL::LastUpdateStatusReasonCode::InvalidRuntime                       then "InvalidRuntime"
              when AL::LastUpdateStatusReasonCode::InvalidZipFileException              then "InvalidZipFileException"
              when AL::LastUpdateStatusReasonCode::FunctionError                        then "FunctionError"
              when AL::LastUpdateStatusReasonCode::ServiceQuotaExceededException        then "ServiceQuotaExceededException"
              when AL::LastUpdateStatusReasonCode::VcpuLimitExceeded                    then "VcpuLimitExceeded"
              when AL::LastUpdateStatusReasonCode::CapacityProviderScalingLimitExceeded then "CapacityProviderScalingLimitExceeded"
              when AL::LastUpdateStatusReasonCode::InsufficientCapacity                 then "InsufficientCapacity"
              when AL::LastUpdateStatusReasonCode::Ec2RequestLimitExceeded              then "EC2RequestLimitExceeded"
              when AL::LastUpdateStatusReasonCode::FunctionErrorInitTimeout             then "FunctionError.InitTimeout"
              when AL::LastUpdateStatusReasonCode::FunctionErrorRuntimeInitError        then "FunctionError.RuntimeInitError"
              when AL::LastUpdateStatusReasonCode::FunctionErrorExtensionInitError      then "FunctionError.ExtensionInitError"
              when AL::LastUpdateStatusReasonCode::FunctionErrorInvalidEntryPoint       then "FunctionError.InvalidEntryPoint"
              when AL::LastUpdateStatusReasonCode::FunctionErrorInvalidWorkingDirectory then "FunctionError.InvalidWorkingDirectory"
              when AL::LastUpdateStatusReasonCode::FunctionErrorPermissionDenied        then "FunctionError.PermissionDenied"
              when AL::LastUpdateStatusReasonCode::FunctionErrorTooManyExtensions       then "FunctionError.TooManyExtensions"
              when AL::LastUpdateStatusReasonCode::FunctionErrorInitResourceExhausted   then "FunctionError.InitResourceExhausted"
              when AL::LastUpdateStatusReasonCode::DisallowedByVpcEncryptionControl     then "DisallowedByVpcEncryptionControl"
              when AL::LastUpdateStatusReasonCode::DependencyError                      then "DependencyError"
              else
                raise Exception.new("unknown enum value for 'LastUpdateStatusReasonCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::LastUpdateStatusReasonCode
      value = pull.read_string
      case value
      when "EniLimitExceeded"                      then AL::LastUpdateStatusReasonCode::EniLimitExceeded
      when "InsufficientRolePermissions"           then AL::LastUpdateStatusReasonCode::InsufficientRolePermissions
      when "InvalidConfiguration"                  then AL::LastUpdateStatusReasonCode::InvalidConfiguration
      when "InternalError"                         then AL::LastUpdateStatusReasonCode::InternalError
      when "SubnetOutOfIPAddresses"                then AL::LastUpdateStatusReasonCode::SubnetOutOfIpAddresses
      when "InvalidSubnet"                         then AL::LastUpdateStatusReasonCode::InvalidSubnet
      when "InvalidSecurityGroup"                  then AL::LastUpdateStatusReasonCode::InvalidSecurityGroup
      when "ImageDeleted"                          then AL::LastUpdateStatusReasonCode::ImageDeleted
      when "ImageAccessDenied"                     then AL::LastUpdateStatusReasonCode::ImageAccessDenied
      when "InvalidImage"                          then AL::LastUpdateStatusReasonCode::InvalidImage
      when "KMSKeyAccessDenied"                    then AL::LastUpdateStatusReasonCode::KmsKeyAccessDenied
      when "KMSKeyNotFound"                        then AL::LastUpdateStatusReasonCode::KmsKeyNotFound
      when "InvalidStateKMSKey"                    then AL::LastUpdateStatusReasonCode::InvalidStateKmsKey
      when "DisabledKMSKey"                        then AL::LastUpdateStatusReasonCode::DisabledKmsKey
      when "EFSIOError"                            then AL::LastUpdateStatusReasonCode::EfsioError
      when "EFSMountConnectivityError"             then AL::LastUpdateStatusReasonCode::EfsMountConnectivityError
      when "EFSMountFailure"                       then AL::LastUpdateStatusReasonCode::EfsMountFailure
      when "EFSMountTimeout"                       then AL::LastUpdateStatusReasonCode::EfsMountTimeout
      when "InvalidRuntime"                        then AL::LastUpdateStatusReasonCode::InvalidRuntime
      when "InvalidZipFileException"               then AL::LastUpdateStatusReasonCode::InvalidZipFileException
      when "FunctionError"                         then AL::LastUpdateStatusReasonCode::FunctionError
      when "ServiceQuotaExceededException"         then AL::LastUpdateStatusReasonCode::ServiceQuotaExceededException
      when "VcpuLimitExceeded"                     then AL::LastUpdateStatusReasonCode::VcpuLimitExceeded
      when "CapacityProviderScalingLimitExceeded"  then AL::LastUpdateStatusReasonCode::CapacityProviderScalingLimitExceeded
      when "InsufficientCapacity"                  then AL::LastUpdateStatusReasonCode::InsufficientCapacity
      when "EC2RequestLimitExceeded"               then AL::LastUpdateStatusReasonCode::Ec2RequestLimitExceeded
      when "FunctionError.InitTimeout"             then AL::LastUpdateStatusReasonCode::FunctionErrorInitTimeout
      when "FunctionError.RuntimeInitError"        then AL::LastUpdateStatusReasonCode::FunctionErrorRuntimeInitError
      when "FunctionError.ExtensionInitError"      then AL::LastUpdateStatusReasonCode::FunctionErrorExtensionInitError
      when "FunctionError.InvalidEntryPoint"       then AL::LastUpdateStatusReasonCode::FunctionErrorInvalidEntryPoint
      when "FunctionError.InvalidWorkingDirectory" then AL::LastUpdateStatusReasonCode::FunctionErrorInvalidWorkingDirectory
      when "FunctionError.PermissionDenied"        then AL::LastUpdateStatusReasonCode::FunctionErrorPermissionDenied
      when "FunctionError.TooManyExtensions"       then AL::LastUpdateStatusReasonCode::FunctionErrorTooManyExtensions
      when "FunctionError.InitResourceExhausted"   then AL::LastUpdateStatusReasonCode::FunctionErrorInitResourceExhausted
      when "DisallowedByVpcEncryptionControl"      then AL::LastUpdateStatusReasonCode::DisallowedByVpcEncryptionControl
      when "DependencyError"                       then AL::LastUpdateStatusReasonCode::DependencyError
      else
        raise Exception.new("unknown enum value for 'LastUpdateStatusReasonCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::LastUpdateStatusReasonCode::EniLimitExceeded                     then "EniLimitExceeded"
      when AL::LastUpdateStatusReasonCode::InsufficientRolePermissions          then "InsufficientRolePermissions"
      when AL::LastUpdateStatusReasonCode::InvalidConfiguration                 then "InvalidConfiguration"
      when AL::LastUpdateStatusReasonCode::InternalError                        then "InternalError"
      when AL::LastUpdateStatusReasonCode::SubnetOutOfIpAddresses               then "SubnetOutOfIPAddresses"
      when AL::LastUpdateStatusReasonCode::InvalidSubnet                        then "InvalidSubnet"
      when AL::LastUpdateStatusReasonCode::InvalidSecurityGroup                 then "InvalidSecurityGroup"
      when AL::LastUpdateStatusReasonCode::ImageDeleted                         then "ImageDeleted"
      when AL::LastUpdateStatusReasonCode::ImageAccessDenied                    then "ImageAccessDenied"
      when AL::LastUpdateStatusReasonCode::InvalidImage                         then "InvalidImage"
      when AL::LastUpdateStatusReasonCode::KmsKeyAccessDenied                   then "KMSKeyAccessDenied"
      when AL::LastUpdateStatusReasonCode::KmsKeyNotFound                       then "KMSKeyNotFound"
      when AL::LastUpdateStatusReasonCode::InvalidStateKmsKey                   then "InvalidStateKMSKey"
      when AL::LastUpdateStatusReasonCode::DisabledKmsKey                       then "DisabledKMSKey"
      when AL::LastUpdateStatusReasonCode::EfsioError                           then "EFSIOError"
      when AL::LastUpdateStatusReasonCode::EfsMountConnectivityError            then "EFSMountConnectivityError"
      when AL::LastUpdateStatusReasonCode::EfsMountFailure                      then "EFSMountFailure"
      when AL::LastUpdateStatusReasonCode::EfsMountTimeout                      then "EFSMountTimeout"
      when AL::LastUpdateStatusReasonCode::InvalidRuntime                       then "InvalidRuntime"
      when AL::LastUpdateStatusReasonCode::InvalidZipFileException              then "InvalidZipFileException"
      when AL::LastUpdateStatusReasonCode::FunctionError                        then "FunctionError"
      when AL::LastUpdateStatusReasonCode::ServiceQuotaExceededException        then "ServiceQuotaExceededException"
      when AL::LastUpdateStatusReasonCode::VcpuLimitExceeded                    then "VcpuLimitExceeded"
      when AL::LastUpdateStatusReasonCode::CapacityProviderScalingLimitExceeded then "CapacityProviderScalingLimitExceeded"
      when AL::LastUpdateStatusReasonCode::InsufficientCapacity                 then "InsufficientCapacity"
      when AL::LastUpdateStatusReasonCode::Ec2RequestLimitExceeded              then "EC2RequestLimitExceeded"
      when AL::LastUpdateStatusReasonCode::FunctionErrorInitTimeout             then "FunctionError.InitTimeout"
      when AL::LastUpdateStatusReasonCode::FunctionErrorRuntimeInitError        then "FunctionError.RuntimeInitError"
      when AL::LastUpdateStatusReasonCode::FunctionErrorExtensionInitError      then "FunctionError.ExtensionInitError"
      when AL::LastUpdateStatusReasonCode::FunctionErrorInvalidEntryPoint       then "FunctionError.InvalidEntryPoint"
      when AL::LastUpdateStatusReasonCode::FunctionErrorInvalidWorkingDirectory then "FunctionError.InvalidWorkingDirectory"
      when AL::LastUpdateStatusReasonCode::FunctionErrorPermissionDenied        then "FunctionError.PermissionDenied"
      when AL::LastUpdateStatusReasonCode::FunctionErrorTooManyExtensions       then "FunctionError.TooManyExtensions"
      when AL::LastUpdateStatusReasonCode::FunctionErrorInitResourceExhausted   then "FunctionError.InitResourceExhausted"
      when AL::LastUpdateStatusReasonCode::DisallowedByVpcEncryptionControl     then "DisallowedByVpcEncryptionControl"
      when AL::LastUpdateStatusReasonCode::DependencyError                      then "DependencyError"
      else
        raise Exception.new("unknown enum value for 'LastUpdateStatusReasonCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::LastUpdateStatusReasonCode?
      case key
      when "EniLimitExceeded"                      then AL::LastUpdateStatusReasonCode::EniLimitExceeded
      when "InsufficientRolePermissions"           then AL::LastUpdateStatusReasonCode::InsufficientRolePermissions
      when "InvalidConfiguration"                  then AL::LastUpdateStatusReasonCode::InvalidConfiguration
      when "InternalError"                         then AL::LastUpdateStatusReasonCode::InternalError
      when "SubnetOutOfIPAddresses"                then AL::LastUpdateStatusReasonCode::SubnetOutOfIpAddresses
      when "InvalidSubnet"                         then AL::LastUpdateStatusReasonCode::InvalidSubnet
      when "InvalidSecurityGroup"                  then AL::LastUpdateStatusReasonCode::InvalidSecurityGroup
      when "ImageDeleted"                          then AL::LastUpdateStatusReasonCode::ImageDeleted
      when "ImageAccessDenied"                     then AL::LastUpdateStatusReasonCode::ImageAccessDenied
      when "InvalidImage"                          then AL::LastUpdateStatusReasonCode::InvalidImage
      when "KMSKeyAccessDenied"                    then AL::LastUpdateStatusReasonCode::KmsKeyAccessDenied
      when "KMSKeyNotFound"                        then AL::LastUpdateStatusReasonCode::KmsKeyNotFound
      when "InvalidStateKMSKey"                    then AL::LastUpdateStatusReasonCode::InvalidStateKmsKey
      when "DisabledKMSKey"                        then AL::LastUpdateStatusReasonCode::DisabledKmsKey
      when "EFSIOError"                            then AL::LastUpdateStatusReasonCode::EfsioError
      when "EFSMountConnectivityError"             then AL::LastUpdateStatusReasonCode::EfsMountConnectivityError
      when "EFSMountFailure"                       then AL::LastUpdateStatusReasonCode::EfsMountFailure
      when "EFSMountTimeout"                       then AL::LastUpdateStatusReasonCode::EfsMountTimeout
      when "InvalidRuntime"                        then AL::LastUpdateStatusReasonCode::InvalidRuntime
      when "InvalidZipFileException"               then AL::LastUpdateStatusReasonCode::InvalidZipFileException
      when "FunctionError"                         then AL::LastUpdateStatusReasonCode::FunctionError
      when "ServiceQuotaExceededException"         then AL::LastUpdateStatusReasonCode::ServiceQuotaExceededException
      when "VcpuLimitExceeded"                     then AL::LastUpdateStatusReasonCode::VcpuLimitExceeded
      when "CapacityProviderScalingLimitExceeded"  then AL::LastUpdateStatusReasonCode::CapacityProviderScalingLimitExceeded
      when "InsufficientCapacity"                  then AL::LastUpdateStatusReasonCode::InsufficientCapacity
      when "EC2RequestLimitExceeded"               then AL::LastUpdateStatusReasonCode::Ec2RequestLimitExceeded
      when "FunctionError.InitTimeout"             then AL::LastUpdateStatusReasonCode::FunctionErrorInitTimeout
      when "FunctionError.RuntimeInitError"        then AL::LastUpdateStatusReasonCode::FunctionErrorRuntimeInitError
      when "FunctionError.ExtensionInitError"      then AL::LastUpdateStatusReasonCode::FunctionErrorExtensionInitError
      when "FunctionError.InvalidEntryPoint"       then AL::LastUpdateStatusReasonCode::FunctionErrorInvalidEntryPoint
      when "FunctionError.InvalidWorkingDirectory" then AL::LastUpdateStatusReasonCode::FunctionErrorInvalidWorkingDirectory
      when "FunctionError.PermissionDenied"        then AL::LastUpdateStatusReasonCode::FunctionErrorPermissionDenied
      when "FunctionError.TooManyExtensions"       then AL::LastUpdateStatusReasonCode::FunctionErrorTooManyExtensions
      when "FunctionError.InitResourceExhausted"   then AL::LastUpdateStatusReasonCode::FunctionErrorInitResourceExhausted
      when "DisallowedByVpcEncryptionControl"      then AL::LastUpdateStatusReasonCode::DisallowedByVpcEncryptionControl
      when "DependencyError"                       then AL::LastUpdateStatusReasonCode::DependencyError
      else
        nil
      end
    end
  end
end
