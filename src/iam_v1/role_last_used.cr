private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about the last time that an IAM role was used. This includes the date and
  # time and the Region in which the role was last used. Activity is only reported for the trailing
  # 400 days. This period can be shorter if your Region began supporting these features within the
  # last year. The role might have been used more than 400 days ago. For more information, see
  # [Regions where data is
  # tracked](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period)
  # in the *IAM user Guide*.
  #
  # This data type is returned as a response element in the
  # [GetRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRole.html) and
  # [GetAccountAuthorizationDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html)
  # operations.
  class RoleLastUsed
    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601) that the role
    # was last used.
    #
    # This field is null if the role has not been used within the IAM tracking period. For more
    # information about the tracking period, see [Regions where data is
    # tracked](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period)
    # in the *IAM User Guide*.
    property last_used_date : Time | Nil

    # The name of the Amazon Web Services Region in which the role was last used.
    property region : String | Nil

    def initialize(
      @last_used_date : Time | Nil = nil,
      @region : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @last_used_date
        params << {"#{prefix}LastUsedDate", Core::QueryValue.time(value)}
      end

      if value = @region
        params << {"#{prefix}Region", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        last_used_date: Core::XMLValue.time(node.xpath_node("*[local-name()='LastUsedDate']")),
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='Region']")),
      )
    end
  end
end
