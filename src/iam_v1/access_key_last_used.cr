private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about the last time an Amazon Web Services access key was used since IAM
  # began tracking this information on April 22, 2015.
  #
  # This data type is used as a response element in the
  # [GetAccessKeyLastUsed](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccessKeyLastUsed.html)
  # operation.
  class AccessKeyLastUsed
    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the
    # access key was most recently used. This field is null in the following situations:
    #
    # - The user does not have an access key.
    #
    # - An access key exists but has not been used since IAM began tracking this information.
    #
    # - There is no sign-in data associated with the user.
    property last_used_date : Time | Nil

    # The name of the Amazon Web Services service with which this access key was most recently used.
    # The value of this field is "N/A" in the following situations:
    #
    # - The user does not have an access key.
    #
    # - An access key exists but has not been used since IAM started tracking this information.
    #
    # - There is no sign-in data associated with the user.
    property service_name : String

    # The Amazon Web Services Region where this access key was most recently used. The value for this
    # field is "N/A" in the following situations:
    #
    # - The user does not have an access key.
    #
    # - An access key exists but has not been used since IAM began tracking this information.
    #
    # - There is no sign-in data associated with the user.
    #
    # For more information about Amazon Web Services Regions, see [Regions and
    # endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html) in the Amazon Web Services
    # General Reference.
    property region : String

    def initialize(
      @service_name : String,
      @region : String,
      @last_used_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @last_used_date
        params << {"#{prefix}LastUsedDate", Core::QueryValue.time(value)}
      end

      params << {"#{prefix}ServiceName", @service_name}

      params << {"#{prefix}Region", @region}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        last_used_date: Core::XMLValue.time(node.xpath_node("*[local-name()='LastUsedDate']")),
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceName']")).not_nil!,
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='Region']")).not_nil!,
      )
    end

    def_equals_and_hash(@last_used_date, @service_name, @region)
  end
end
