private alias Core = Amazonite::Core

module Amazonite::IamV1
  # An object that contains details about when the IAM entities (users or roles) were last used in
  # an attempt to access the specified Amazon Web Services service.
  #
  # This data type is a response element in the
  # [GetServiceLastAccessedDetailsWithEntities](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetailsWithEntities.html)
  # operation.
  class EntityDetails
    # The `EntityInfo` object that contains details about the entity (user or role).
    property entity_info : EntityInfo

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the
    # authenticated entity last attempted to access Amazon Web Services. Amazon Web Services does not
    # report unauthenticated requests.
    #
    # This field is null if no IAM entities attempted to access the service within the [tracking
    # period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
    property last_authenticated : Time | Nil

    def initialize(
      @entity_info : EntityInfo,
      @last_authenticated : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@entity_info.to_query_params("#{prefix}EntityInfo."))

      if value = @last_authenticated
        params << {"#{prefix}LastAuthenticated", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        entity_info: node.xpath_node("*[local-name()='EntityInfo']").try { |n| EntityInfo.from_xml(n) }.not_nil!,
        last_authenticated: Core::XMLValue.time(node.xpath_node("*[local-name()='LastAuthenticated']")),
      )
    end

    def_equals_and_hash(@entity_info, @last_authenticated)
  end
end
