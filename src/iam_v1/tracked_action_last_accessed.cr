private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains details about the most recent attempt to access an action within the service.
  #
  # This data type is used as a response element in the
  # [GetServiceLastAccessedDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetails.html)
  # operation.
  class TrackedActionLastAccessed
    # The name of the tracked action to which access was attempted. Tracked actions are actions that
    # report activity to IAM.
    property action_name : String | Nil

    property last_accessed_entity : String | Nil

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when an
    # authenticated entity most recently attempted to access the tracked service. Amazon Web Services
    # does not report unauthenticated requests.
    #
    # This field is null if no IAM entities attempted to access the service within the [tracking
    # period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
    property last_accessed_time : Time | Nil

    # The Region from which the authenticated entity (user or role) last attempted to access the
    # tracked action. Amazon Web Services does not report unauthenticated requests.
    #
    # This field is null if no IAM entities attempted to access the service within the [tracking
    # period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
    property last_accessed_region : String | Nil

    def initialize(
      @action_name : String | Nil = nil,
      @last_accessed_entity : String | Nil = nil,
      @last_accessed_time : Time | Nil = nil,
      @last_accessed_region : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @action_name
        params << {"#{prefix}ActionName", value}
      end

      if value = @last_accessed_entity
        params << {"#{prefix}LastAccessedEntity", value}
      end

      if value = @last_accessed_time
        params << {"#{prefix}LastAccessedTime", Core::QueryValue.time(value)}
      end

      if value = @last_accessed_region
        params << {"#{prefix}LastAccessedRegion", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        action_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ActionName']")),
        last_accessed_entity: Core::XMLValue.string(node.xpath_node("*[local-name()='LastAccessedEntity']")),
        last_accessed_time: Core::XMLValue.time(node.xpath_node("*[local-name()='LastAccessedTime']")),
        last_accessed_region: Core::XMLValue.string(node.xpath_node("*[local-name()='LastAccessedRegion']")),
      )
    end

    def_equals_and_hash(@action_name, @last_accessed_entity, @last_accessed_time, @last_accessed_region)
  end
end
