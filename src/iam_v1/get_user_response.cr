module Amazonite::IamV1
  # Contains the response to a successful
  # [GetUser](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUser.html) request.
  class GetUserResponse
    # A structure containing details about the IAM user.
    #
    # Due to a service issue, password last used data does not include password use from May 3, 2018
    # 22:50 PDT to May 23, 2018 14:08 PDT. This affects [last
    # sign-in](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_finding-unused.html)
    # dates shown in the IAM console and password last used dates in the [IAM credential
    # report](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html),
    # and returned by this operation. If users signed in during the affected time, the password last
    # used date that is returned is the date the user last signed in before May 3, 2018. For users
    # that signed in after May 23, 2018 14:08 PDT, the returned password last used date is accurate.
    #
    # You can use password last used information to identify unused credentials for deletion. For
    # example, you might delete users who did not sign in to Amazon Web Services in the last 90 days.
    # In cases like this, we recommend that you adjust your evaluation window to include dates after
    # May 23, 2018. Alternatively, if your users use access keys to access Amazon Web Services
    # programmatically you can refer to access key last used information because it is accurate for
    # all dates.
    property user : User

    def initialize(
      @user : User,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@user.to_query_params("#{prefix}User."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user: node.xpath_node("*[local-name()='User']").try { |n| User.from_xml(n) }.not_nil!,
      )
    end

    def_equals_and_hash(@user)
  end
end
