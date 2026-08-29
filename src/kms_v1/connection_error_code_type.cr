private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum ConnectionErrorCodeType
    InvalidCredentials
    ClusterNotFound
    NetworkErrors
    InternalError
    InsufficientCloudhsmHsms
    UserLockedOut
    UserNotFound
    UserLoggedIn
    SubnetNotFound
    InsufficientFreeAddressesInSubnet
    XksProxyAccessDenied
    XksProxyNotReachable
    XksVpcEndpointServiceNotFound
    XksProxyInvalidResponse
    XksProxyInvalidConfiguration
    XksVpcEndpointServiceInvalidConfiguration
    XksProxyTimedOut
    XksProxyInvalidTlsConfiguration

    def self.to_json(e : ConnectionErrorCodeType, json : JSON::Builder) : Nil
      value = case e
              when AK::ConnectionErrorCodeType::InvalidCredentials                        then "INVALID_CREDENTIALS"
              when AK::ConnectionErrorCodeType::ClusterNotFound                           then "CLUSTER_NOT_FOUND"
              when AK::ConnectionErrorCodeType::NetworkErrors                             then "NETWORK_ERRORS"
              when AK::ConnectionErrorCodeType::InternalError                             then "INTERNAL_ERROR"
              when AK::ConnectionErrorCodeType::InsufficientCloudhsmHsms                  then "INSUFFICIENT_CLOUDHSM_HSMS"
              when AK::ConnectionErrorCodeType::UserLockedOut                             then "USER_LOCKED_OUT"
              when AK::ConnectionErrorCodeType::UserNotFound                              then "USER_NOT_FOUND"
              when AK::ConnectionErrorCodeType::UserLoggedIn                              then "USER_LOGGED_IN"
              when AK::ConnectionErrorCodeType::SubnetNotFound                            then "SUBNET_NOT_FOUND"
              when AK::ConnectionErrorCodeType::InsufficientFreeAddressesInSubnet         then "INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET"
              when AK::ConnectionErrorCodeType::XksProxyAccessDenied                      then "XKS_PROXY_ACCESS_DENIED"
              when AK::ConnectionErrorCodeType::XksProxyNotReachable                      then "XKS_PROXY_NOT_REACHABLE"
              when AK::ConnectionErrorCodeType::XksVpcEndpointServiceNotFound             then "XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND"
              when AK::ConnectionErrorCodeType::XksProxyInvalidResponse                   then "XKS_PROXY_INVALID_RESPONSE"
              when AK::ConnectionErrorCodeType::XksProxyInvalidConfiguration              then "XKS_PROXY_INVALID_CONFIGURATION"
              when AK::ConnectionErrorCodeType::XksVpcEndpointServiceInvalidConfiguration then "XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION"
              when AK::ConnectionErrorCodeType::XksProxyTimedOut                          then "XKS_PROXY_TIMED_OUT"
              when AK::ConnectionErrorCodeType::XksProxyInvalidTlsConfiguration           then "XKS_PROXY_INVALID_TLS_CONFIGURATION"
              else
                raise Exception.new("unknown enum value for 'ConnectionErrorCodeType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::ConnectionErrorCodeType
      value = pull.read_string
      case value
      when "INVALID_CREDENTIALS"                            then AK::ConnectionErrorCodeType::InvalidCredentials
      when "CLUSTER_NOT_FOUND"                              then AK::ConnectionErrorCodeType::ClusterNotFound
      when "NETWORK_ERRORS"                                 then AK::ConnectionErrorCodeType::NetworkErrors
      when "INTERNAL_ERROR"                                 then AK::ConnectionErrorCodeType::InternalError
      when "INSUFFICIENT_CLOUDHSM_HSMS"                     then AK::ConnectionErrorCodeType::InsufficientCloudhsmHsms
      when "USER_LOCKED_OUT"                                then AK::ConnectionErrorCodeType::UserLockedOut
      when "USER_NOT_FOUND"                                 then AK::ConnectionErrorCodeType::UserNotFound
      when "USER_LOGGED_IN"                                 then AK::ConnectionErrorCodeType::UserLoggedIn
      when "SUBNET_NOT_FOUND"                               then AK::ConnectionErrorCodeType::SubnetNotFound
      when "INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET"          then AK::ConnectionErrorCodeType::InsufficientFreeAddressesInSubnet
      when "XKS_PROXY_ACCESS_DENIED"                        then AK::ConnectionErrorCodeType::XksProxyAccessDenied
      when "XKS_PROXY_NOT_REACHABLE"                        then AK::ConnectionErrorCodeType::XksProxyNotReachable
      when "XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND"             then AK::ConnectionErrorCodeType::XksVpcEndpointServiceNotFound
      when "XKS_PROXY_INVALID_RESPONSE"                     then AK::ConnectionErrorCodeType::XksProxyInvalidResponse
      when "XKS_PROXY_INVALID_CONFIGURATION"                then AK::ConnectionErrorCodeType::XksProxyInvalidConfiguration
      when "XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION" then AK::ConnectionErrorCodeType::XksVpcEndpointServiceInvalidConfiguration
      when "XKS_PROXY_TIMED_OUT"                            then AK::ConnectionErrorCodeType::XksProxyTimedOut
      when "XKS_PROXY_INVALID_TLS_CONFIGURATION"            then AK::ConnectionErrorCodeType::XksProxyInvalidTlsConfiguration
      else
        raise Exception.new("unknown enum value for 'ConnectionErrorCodeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::ConnectionErrorCodeType::InvalidCredentials                        then "INVALID_CREDENTIALS"
      when AK::ConnectionErrorCodeType::ClusterNotFound                           then "CLUSTER_NOT_FOUND"
      when AK::ConnectionErrorCodeType::NetworkErrors                             then "NETWORK_ERRORS"
      when AK::ConnectionErrorCodeType::InternalError                             then "INTERNAL_ERROR"
      when AK::ConnectionErrorCodeType::InsufficientCloudhsmHsms                  then "INSUFFICIENT_CLOUDHSM_HSMS"
      when AK::ConnectionErrorCodeType::UserLockedOut                             then "USER_LOCKED_OUT"
      when AK::ConnectionErrorCodeType::UserNotFound                              then "USER_NOT_FOUND"
      when AK::ConnectionErrorCodeType::UserLoggedIn                              then "USER_LOGGED_IN"
      when AK::ConnectionErrorCodeType::SubnetNotFound                            then "SUBNET_NOT_FOUND"
      when AK::ConnectionErrorCodeType::InsufficientFreeAddressesInSubnet         then "INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET"
      when AK::ConnectionErrorCodeType::XksProxyAccessDenied                      then "XKS_PROXY_ACCESS_DENIED"
      when AK::ConnectionErrorCodeType::XksProxyNotReachable                      then "XKS_PROXY_NOT_REACHABLE"
      when AK::ConnectionErrorCodeType::XksVpcEndpointServiceNotFound             then "XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND"
      when AK::ConnectionErrorCodeType::XksProxyInvalidResponse                   then "XKS_PROXY_INVALID_RESPONSE"
      when AK::ConnectionErrorCodeType::XksProxyInvalidConfiguration              then "XKS_PROXY_INVALID_CONFIGURATION"
      when AK::ConnectionErrorCodeType::XksVpcEndpointServiceInvalidConfiguration then "XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION"
      when AK::ConnectionErrorCodeType::XksProxyTimedOut                          then "XKS_PROXY_TIMED_OUT"
      when AK::ConnectionErrorCodeType::XksProxyInvalidTlsConfiguration           then "XKS_PROXY_INVALID_TLS_CONFIGURATION"
      else
        raise Exception.new("unknown enum value for 'ConnectionErrorCodeType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::ConnectionErrorCodeType?
      case key
      when "INVALID_CREDENTIALS"                            then AK::ConnectionErrorCodeType::InvalidCredentials
      when "CLUSTER_NOT_FOUND"                              then AK::ConnectionErrorCodeType::ClusterNotFound
      when "NETWORK_ERRORS"                                 then AK::ConnectionErrorCodeType::NetworkErrors
      when "INTERNAL_ERROR"                                 then AK::ConnectionErrorCodeType::InternalError
      when "INSUFFICIENT_CLOUDHSM_HSMS"                     then AK::ConnectionErrorCodeType::InsufficientCloudhsmHsms
      when "USER_LOCKED_OUT"                                then AK::ConnectionErrorCodeType::UserLockedOut
      when "USER_NOT_FOUND"                                 then AK::ConnectionErrorCodeType::UserNotFound
      when "USER_LOGGED_IN"                                 then AK::ConnectionErrorCodeType::UserLoggedIn
      when "SUBNET_NOT_FOUND"                               then AK::ConnectionErrorCodeType::SubnetNotFound
      when "INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET"          then AK::ConnectionErrorCodeType::InsufficientFreeAddressesInSubnet
      when "XKS_PROXY_ACCESS_DENIED"                        then AK::ConnectionErrorCodeType::XksProxyAccessDenied
      when "XKS_PROXY_NOT_REACHABLE"                        then AK::ConnectionErrorCodeType::XksProxyNotReachable
      when "XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND"             then AK::ConnectionErrorCodeType::XksVpcEndpointServiceNotFound
      when "XKS_PROXY_INVALID_RESPONSE"                     then AK::ConnectionErrorCodeType::XksProxyInvalidResponse
      when "XKS_PROXY_INVALID_CONFIGURATION"                then AK::ConnectionErrorCodeType::XksProxyInvalidConfiguration
      when "XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION" then AK::ConnectionErrorCodeType::XksVpcEndpointServiceInvalidConfiguration
      when "XKS_PROXY_TIMED_OUT"                            then AK::ConnectionErrorCodeType::XksProxyTimedOut
      when "XKS_PROXY_INVALID_TLS_CONFIGURATION"            then AK::ConnectionErrorCodeType::XksProxyInvalidTlsConfiguration
      else
        nil
      end
    end
  end
end
